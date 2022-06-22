package myCloset.restfullApi.service.sign;

import myCloset.restfullApi.config.token.TokenHelper;
import myCloset.restfullApi.dto.sign.*;
import myCloset.restfullApi.entity.member.Member;
import myCloset.restfullApi.entity.member.Role;
import myCloset.restfullApi.entity.member.RoleType;
import myCloset.restfullApi.exception.*;
import myCloset.restfullApi.repository.member.MemberRepository;
import myCloset.restfullApi.repository.role.RoleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SignService {

    private final MemberRepository memberRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;
    private final TokenHelper accessTokenHelper;
    private final TokenHelper refreshTokenHelper;
    private final String defaultString = "123456789a!";


    @Transactional
    public void signUp(SignUpRequest req) {
        validateSignUpInfo(req);
        String encodedPassword = passwordEncoder.encode(req.getPassword());
        List<Role> roles = List.of(roleRepository.findByRoleType(RoleType.ROLE_NORMAL).orElseThrow(RoleNotFoundException::new));
        memberRepository.save(
                new Member(req.getEmail(), encodedPassword, req.getUsername(), req.getNickname(), roles)
        );
    }

    @Transactional
    public void signDown(SignDownRequest req) {
        Member member = memberRepository.findWithRolesByUserId(req.getUserId()).orElseThrow(LoginFailureException::new);
        memberRepository.delete(member);
    }

    @Transactional(readOnly = true)
    public SignInResponse signIn(SignInRequest req) {
        Member member = memberRepository.findWithRolesByUserId(req.getUserId()).orElseThrow(LoginFailureException::new);
        validatePassword(req, member);
        TokenHelper.PrivateClaims privateClaims = createPrivateClaims(member);
        String accessToken = accessTokenHelper.createToken(privateClaims);
        String refreshToken = refreshTokenHelper.createToken(privateClaims);
        return new SignInResponse(accessToken, refreshToken);
    }

    @Transactional(readOnly = true)
    public void modify(modifyRequest req) {
        validateModifyInfo(req);
        Member member = memberRepository.findByEmail(req.getEmail()).orElseThrow(MemberNotFoundException::new);
        memberRepository.save(
                new Member(member.getEmail(), passwordEncoder.encode(member.getPassword()), member.getUserId(), req.getNickname(), member.getRoles())
        );
    }

    public String findId(FindIdRequest req) {
        Member member = memberRepository.findByEmail(req.getEmail()).orElseThrow(MemberNotFoundException::new);
        return member.getUserId();
    }

    public String findPw(FindPwRequest req) {
        Member member = memberRepository.findByEmail(req.getEmail()).orElseThrow(MemberNotFoundException::new);
        if (!member.getUserId().equals(req.getUserId())) {
            throw new MemberIdDoesNotMatchException(req.getUserId());
        }
        return defaultString;
    }

    public RefreshTokenResponse refreshToken(String rToken) {
        TokenHelper.PrivateClaims privateClaims = refreshTokenHelper.parse(rToken).orElseThrow(RefreshTokenFailureException::new);
        String accessToken = accessTokenHelper.createToken(privateClaims);
        return new RefreshTokenResponse(accessToken);
    }

    private void validateModifyInfo(modifyRequest req) {
        if(memberRepository.existsByNickname(req.getNickname()))
            throw new MemberNicknameAlreadyExistsException(req.getNickname());
    }

    private void validateSignUpInfo(SignUpRequest req) {
        if(memberRepository.existsByEmail(req.getEmail()))
            throw new MemberEmailAlreadyExistsException(req.getEmail());
        if(memberRepository.existsByNickname(req.getNickname()))
            throw new MemberNicknameAlreadyExistsException(req.getNickname());
    }

    private void validatePassword(SignInRequest req, Member member) {
        if(!passwordEncoder.matches(req.getPassword(), member.getPassword())) {
            throw new LoginFailureException();
        }
    }

    private TokenHelper.PrivateClaims createPrivateClaims(Member member) {
        return new TokenHelper.PrivateClaims(
                String.valueOf(member.getId()),
                member.getRoles().stream()
                        .map(memberRole -> memberRole.getRole())
                        .map(role -> role.getRoleType())
                        .map(roleType -> roleType.toString())
                        .collect(Collectors.toList()));
    }
}
