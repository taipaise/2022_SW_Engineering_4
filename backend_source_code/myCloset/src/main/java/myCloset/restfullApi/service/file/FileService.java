package myCloset.restfullApi.service.file;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
    String upload(MultipartFile file, String filename);
    String changeFileName(String src, String dest);
    void delete(String filename);
}
