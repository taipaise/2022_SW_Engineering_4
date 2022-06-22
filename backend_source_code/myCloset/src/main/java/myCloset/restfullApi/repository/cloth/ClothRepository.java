package myCloset.restfullApi.repository.cloth;

import myCloset.restfullApi.entity.cloth.Cloth;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ClothRepository extends JpaRepository<Cloth, Long> {
    List<Cloth> findAllById(Long id);
    Optional<Cloth> findByUniqueName(String uniqueName);
}
