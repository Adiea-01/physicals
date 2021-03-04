package cn.rails.physicals.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface PhysicalDataImportService {

    void importPhysicalData(MultipartFile multipartFile) throws IOException;

}
