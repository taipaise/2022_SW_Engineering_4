package myCloset.restfullApi.entity.member;

import myCloset.restfullApi.entity.common.EntityDate;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

import static java.util.stream.Collectors.toSet;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@NamedEntityGraph(
        name = "Member.roles",
        attributeNodes = @NamedAttributeNode(value = "roles", subgraph = "Member.roles.role"),
        subgraphs = @NamedSubgraph(name = "Member.roles.role", attributeNodes = @NamedAttributeNode("role"))
)
public class Member extends EntityDate {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_id")
    private Long id;

    @Column(nullable = false, length = 30, unique = true)
    private String email;

    private String password;

    @Column(nullable = false, length = 20)
    private String userId;

    @Column(nullable = false, unique = true, length = 20)
    private String nickname;

    @OneToMany(mappedBy = "member", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<MemberRole> roles;

    public Member(String email, String password, String userId, String nickname, List<Role> roles) {
        this.email = email;
        this.password = password;
        this.userId = userId;
        this.nickname = nickname;
        this.roles = roles.stream().map(r -> new MemberRole(this, r)).collect(toSet());
    }

    public Member(String email, String password, String userId, String nickname, Set<MemberRole> roles) {
        this.email = email;
        this.password = password;
        this.userId = userId;
        this.nickname = nickname;
        this.roles = roles;
    }

    public void updateNickname(String nickname) {
        this.nickname = nickname;
    }
}
