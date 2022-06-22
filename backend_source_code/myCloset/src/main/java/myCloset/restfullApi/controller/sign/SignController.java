package myCloset.restfullApi.controller.sign;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import myCloset.restfullApi.dto.response.Response;
import myCloset.restfullApi.dto.sign.*;
import myCloset.restfullApi.service.sign.SignService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.validation.Valid;

import static myCloset.restfullApi.dto.response.Response.success;

@Api(value = "Sign Controller", tags = "Sign")
@RestController
@RequiredArgsConstructor
public class SignController {
    private final SignService signService;

    @ApiOperation(value = "회원가입", notes = "회원가입을 한다.")
    @PostMapping("/api/sign-up")
    @ResponseStatus(HttpStatus.CREATED)
    public Response signUp(@Valid @RequestBody SignUpRequest req) {
        signService.signUp(req);
        return success();
    }

    @ApiOperation(value = "회원탈퇴", notes = "회원탈퇴를 한다.")
    @PostMapping("/api/sign-down")
    @ResponseStatus(HttpStatus.OK)
    public Response signDown(@Valid @RequestBody SignDownRequest req) {
        signService.signDown(req);
        return success();
    }

    @ApiOperation(value = "로그인", notes = "로그인을 한다.")
    @PostMapping("/api/sign-in")
    @ResponseStatus(HttpStatus.OK)
    public Response signIn(@Valid @RequestBody SignInRequest req) {
        return success(signService.signIn(req));
    }

    @ApiOperation(value = "토큰 재발급", notes = "리프레시 토큰으로 새로운 액세스 토큰을 발급 받는다.")
    @PostMapping("/api/refresh-token")
    @ResponseStatus(HttpStatus.OK)
    public Response refreshToken(@ApiIgnore @RequestHeader(value = "Authorization") String refreshToken) {
        return success(signService.refreshToken(refreshToken));
    }

    @ApiOperation(value = "회원정보수정", notes = "닉네임 또는 비밀번호를 수정한다.")
    @PostMapping("/api/modify-info")
    @ResponseStatus(HttpStatus.OK)
    public Response modify(@Valid @RequestBody modifyRequest req) {
        signService.modify(req);
        return success();
    }

    @ApiOperation(value = "아이디찾기", notes = "아이디를 찾는다.")
    @PostMapping("/api/find-id")
    @ResponseStatus(HttpStatus.OK)
    public Response findId(@Valid @RequestBody FindIdRequest req) {
        return success(signService.findId(req));
    }

    @ApiOperation(value = "비밀번호찾기", notes = "비밀번호를 찾는다.")
    @PostMapping("/api/find-pw")
    @ResponseStatus(HttpStatus.OK)
    public Response findId(@Valid @RequestBody FindPwRequest req) {
        return success(signService.findPw(req));
    }
}

































