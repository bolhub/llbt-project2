package com.smart.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

//简历
public class Resume extends GeneralResouce implements Serializable {
    private String personName;
    private Integer fId;
    private Date graduatedYear;
    private String educationBackground;
    private String projects;

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public Integer getfId() {
        return fId;
    }

    public void setfId(Integer fId) {
        this.fId = fId;
    }

    public void setGraduatedYear(Date graduatedYear) {
        this.graduatedYear = graduatedYear;
    }

    public Date getGraduatedYear() {
        return graduatedYear;
    }

    public String getEducationBackground() {
        return educationBackground;
    }

    public void setEducationBackground(String educationBackground) {
        this.educationBackground = educationBackground;
    }

    public String getProjects() {
        return projects;
    }

    public void setProjects(String projects) {
        this.projects = projects;
    }
}
