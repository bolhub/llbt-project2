package com.smart.domain;

import java.util.Date;

public class GeneralResouce {
    private Integer fileId;
    private String fileName;
    private String fileUrl;
    private Date updateTime;
    private Integer upUid;
    private Integer resourceLevel;

    public static final Integer RESUME = 1; //简历

    public static final Integer NOMAL = 0; //普通资源

    public Integer getResourceLevel() {
        return resourceLevel;
    }

    public void setResourceLevel(Integer resourceLevel) {
        this.resourceLevel = resourceLevel;
    }

    public Integer getFileId() {
        return fileId;
    }

    public void setFileId(Integer fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getUpUid() {
        return upUid;
    }

    public void setUpUid(Integer upUid) {
        this.upUid = upUid;
    }
}
