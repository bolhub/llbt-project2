package com.smart.web;

import java.util.Date;

public class UpdateResume {
    private String personName;
    private Date graduatedYear;
    private String educationBackground;
    private String projects;

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public Date getGraduatedYear() {
        return graduatedYear;
    }

    public void setGraduatedYear(Date graduatedYear) {
        this.graduatedYear = graduatedYear;
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
