package myCloset.restfullApi.repository.role;

import myCloset.restfullApi.entity.member.Role;
import myCloset.restfullApi.entity.member.RoleType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Optional<Role> findByRoleType(RoleType roleType);
}
