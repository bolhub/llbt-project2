package com.smart.service;

import com.smart.dao.ResourceDao;
import com.smart.domain.GeneralResouce;
import com.smart.domain.Resume;
import com.smart.web.ResumeInfo;
import com.smart.web.domain.GeneralResourceInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceServer {
    private ResourceDao resourceDao;

    @Autowired
    public void setResourceDao(ResourceDao resourceDao){
        this.resourceDao = resourceDao;
    }

    public List<ResumeInfo> getResumeList(int pageNo, int pageSize, ResumeInfo resumeInfo){
        return resourceDao.getResumeList(pageNo, pageSize, resumeInfo);
    }

    public void updateGeneralResouce(GeneralResouce generalResouce){
        resourceDao.insertGeneralResouce(generalResouce);
    }

    public void updateResume(Resume resume){
        resourceDao.insertResume(resume);
    }

    public GeneralResouce getGeneralResource(GeneralResouce generalResouce){
        return resourceDao.getGeneralResouce(generalResouce);
    }

    public Integer getResumeListCount(ResumeInfo resumeInfo){
        return resourceDao.getResumeListCount(resumeInfo);
    }

    public List<GeneralResourceInfo> getGeneralResourceList(int pageNo, int pageSize){
        return resourceDao.getGeneralResourceList(pageNo, pageSize);
    }

    public Integer getGeneralResourceListCount(){
        return resourceDao.getGeneralResourceListCount();
    }
}
