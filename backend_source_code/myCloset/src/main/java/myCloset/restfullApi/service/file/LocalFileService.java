package myCloset.restfullApi.service.file;

import myCloset.restfullApi.exception.FileUploadFailureException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
@Slf4j
public class LocalFileService implements FileService {

    @Value("${upload.image.location}")
    private String location;

    @PostConstruct
    void postConstruct() {
        File dir = new File(location);
        if (!dir.exists()) {
            dir.mkdir();
        }
    }

    @Override
    public String upload(MultipartFile file, String filename) {
        try {
            file.transferTo(new File(location + filename));
            return location + filename;
        } catch(IOException e) {
            throw new FileUploadFailureException(e);
        }
    }

    @Override
    public String changeFileName(String src, String dest) {
        try {
            Path srcFile = Paths.get(location + src);
            Path destFile = Paths.get(location + dest);

            return Files.move(srcFile, destFile).toString();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }


    @Override
    public void delete(String filename) {
        new File(location + filename).delete();
    }
}
