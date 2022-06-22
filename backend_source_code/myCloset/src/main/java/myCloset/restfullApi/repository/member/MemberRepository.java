package myCloset.restfullApi.repository.member;

import myCloset.restfullApi.entity.member.Member;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

    Optional<Member> findByEmail(String email);
    Optional<Member> findByUserId(String userId);
    Optional<Member> findByNickname(String nickname);

    boolean existsByEmail(String email);
    boolean existsByUserId(String userId);
    boolean existsByNickname(String nickname);

    @EntityGraph("Member.roles")
    Optional<Member> findWithRolesByUserId(String userId);
}
