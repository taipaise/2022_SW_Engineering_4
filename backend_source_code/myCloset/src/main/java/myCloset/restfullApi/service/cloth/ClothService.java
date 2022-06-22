package myCloset.restfullApi.service.cloth;


import myCloset.restfullApi.dto.cloth.ClothCreateRequest;
import myCloset.restfullApi.dto.cloth.ClothCreateResponse;
import myCloset.restfullApi.dto.cloth.ClothUpdateRequest;
import myCloset.restfullApi.dto.cloth.ClothUpdateResponse;
import myCloset.restfullApi.entity.cloth.Cloth;
import myCloset.restfullApi.exception.ClothNotFoundException;
import myCloset.restfullApi.exception.UnsupportedImageFormatException;
import myCloset.restfullApi.repository.cloth.ClothRepository;
import myCloset.restfullApi.service.file.LocalFileService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
@RequiredArgsConstructor
public class ClothService {

    private final ClothRepository clothRepository;
    private final LocalFileService localFileService;

    @Transactional
    public ClothCreateResponse save(ClothCreateRequest req) {
        String uniqueName = generateUniqueName(extractExtension(req.getOriginName()));
        String path = localFileService.upload(req.getImage(), uniqueName);
        Cloth temp = new Cloth(req.getOriginName(), uniqueName, req.getFeatureCategory(), req.getSeasonCategory(), path);
        Cloth cloth = clothRepository.save(temp);
        return new ClothCreateResponse(cloth.getId());
    }

    @Transactional
    public ClothUpdateResponse update(ClothUpdateRequest req) {
        Cloth cloth = clothRepository.findByUniqueName(req.getOriginName()).orElseThrow(ClothNotFoundException::new);
        String uniqueName = generateUniqueName(extractExtension(req.getOriginName()));
        String path = localFileService.changeFileName(cloth.getUniqueName(), uniqueName);
        Cloth updatedCloth = new Cloth(req.getOriginName(), uniqueName, req.getFeatureCategory(), req.getSeasonCategory(), path);
        updatedCloth = clothRepository.save(updatedCloth);
        return new ClothUpdateResponse(updatedCloth.getId());
    }

    @Transactional
    public void delete(Long id) {
        Cloth cloth = clothRepository.findById(id).orElseThrow(ClothNotFoundException::new);
        localFileService.delete(cloth.getUniqueName());
        clothRepository.delete(cloth);
    }

    @Transactional
    public List<Cloth> findAll() {
        return clothRepository.findAll();
    }

    private final static String supportedExtension[] = {"jpg", "jpeg", "gif", "bmp", "png"};

    private String generateUniqueName(String extension) {
        return UUID.randomUUID().toString() + "." + extension;
    }

    private String extractExtension(String originName) {
        try {
            String ext = originName.substring(originName.lastIndexOf(".") + 1);
            if(isSupportedFormat(ext)) return ext;
        } catch (StringIndexOutOfBoundsException e) { }
        throw new UnsupportedImageFormatException();
    }

    private boolean isSupportedFormat(String ext) {
        return Arrays.stream(supportedExtension).anyMatch(e -> e.equalsIgnoreCase(ext));
    }

}
