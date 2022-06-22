package myCloset.restfullApi.repository.record;



import myCloset.restfullApi.entity.record.Record;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RecordRepository extends JpaRepository<Record, Long> {
    List<Record> findAllById(Long id);
}
