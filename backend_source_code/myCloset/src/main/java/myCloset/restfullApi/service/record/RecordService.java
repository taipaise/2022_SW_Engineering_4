package myCloset.restfullApi.service.record;


import myCloset.restfullApi.dto.record.RecordCreateRequest;
import myCloset.restfullApi.dto.record.RecordCreateResponse;
import myCloset.restfullApi.dto.record.RecordUpdateRequest;
import myCloset.restfullApi.dto.record.RecordUpdateResponse;
import myCloset.restfullApi.entity.cloth.Cloth;
import myCloset.restfullApi.entity.record.Record;
import myCloset.restfullApi.exception.ClothNotFoundException;
import myCloset.restfullApi.repository.record.RecordRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class RecordService {

    private final RecordRepository recordRepository;

    @Transactional(readOnly = true)
    public RecordCreateResponse save(RecordCreateRequest req) {
        Record record = recordRepository.save(new Record(req.getClothTop(), req.getClothBottom(), req.getClothOuter(), req.getClothShoes(), req.getRating(), req.getComment()));
        return new RecordCreateResponse(record.getId());
    }

    @Transactional
    public RecordUpdateResponse update(RecordUpdateRequest req) {
        Record record = recordRepository.save(new Record(req.getClothTop(), req.getClothBottom(), req.getClothOuter(), req.getClothShoes(), req.getRating(), req.getComment()));
        return new RecordUpdateResponse(record.getId());
    }

    @Transactional
    public void delete(Long id) {
        Record record = recordRepository.findById(id).orElseThrow(ClothNotFoundException::new);
    }

    @Transactional
    public List<Record> findAll() {
        return recordRepository.findAll();
    }

}
