package cn.rails.physicals.service;

import org.springframework.web.multipart.MultipartFile;

public interface PhysicalDataImportService {

    void importPhysicalData(MultipartFile multipartFile);

}
