package com.smart.web;

import com.smart.domain.GeneralResouce;
import com.smart.domain.Resume;
import com.smart.domain.User;
import com.smart.service.ResourceServer;
import com.smart.web.domain.GeneralResourceInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ResourceController {
    private ResourceServer resourceServer;

    @Autowired
    public void setResourceServer(ResourceServer resourceServer){
        this.resourceServer = resourceServer;
    }

    @RequestMapping(value = "/resume.html")
    public String resume(HttpServletRequest request, ResumeInfo resumeInfo){
        List<ResumeInfo> resumeList = resourceServer.getResumeList(1,5, resumeInfo);
        Integer listCount = resourceServer.getResumeListCount(resumeInfo);
        request.getSession().setAttribute("listCount", listCount);
        request.getSession().setAttribute("resumeList", resumeList);
        return "resume";
    }

    @RequestMapping(value = "/resumepage.html")
    @ResponseBody
    public List<ResumeInfo> resumePage(int pageNo, int pageSize, ResumeInfo resumeInfo){
        List<ResumeInfo> resumeList = resourceServer.getResumeList(pageNo, pageSize, resumeInfo);
        return resumeList;
    }

    @RequestMapping(value = "/generalResourcePage.html")
    @ResponseBody
    public List<GeneralResourceInfo> generalResourcePage(int pageNo, int pageSize){
        List<GeneralResourceInfo> generalResourceInfoList = resourceServer.getGeneralResourceList(pageNo, pageSize);
        return generalResourceInfoList;
    }

    @RequestMapping(value = "/resumeCount.html")
    @ResponseBody
    public Integer resumeCount(ResumeInfo resumeInfo){
        Integer result = resourceServer.getResumeListCount(resumeInfo);
        return result;
    }

    @RequestMapping(value = "/uploadResume.html")
    public String doUploadResume(@RequestParam MultipartFile uploadResume, HttpServletRequest request, UpdateResume updateResume){
        String realPath = request.getSession().getServletContext().getRealPath("/fileUpload/temp");
        String originalFilename;
        if (uploadResume.isEmpty()){
            return "1 请选择文件后上传";
        }else {
            originalFilename = uploadResume.getOriginalFilename();
//            System.out.println("文件原名：" + originalFilename);
//            System.out.println("文件名称：" + uploadResume.getName());
//            System.out.println("文件长度：" + uploadResume.getSize());
//            System.out.println("文件类型：" + uploadResume.getContentType());
//            System.out.println("=======================================================");
            try{
                File filepath = new File(realPath, originalFilename);
                if (!filepath.getParentFile().exists()){
                    filepath.getParentFile().mkdirs();
                }
                uploadResume.transferTo(new File(realPath + File.separator + originalFilename));
                GeneralResouce generalResouce = resourceServer.getGeneralResource(updateGeneralResource(request, realPath, originalFilename));
                updateResume(updateResume, generalResouce);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/resume.html";
    }

    @RequestMapping(value = "/uploadGeneralResource.html")
    public String doUploadGeneralResource(@RequestParam MultipartFile generalResource, HttpServletRequest request){
        String realPath = request.getSession().getServletContext().getRealPath("/fileUpload/temp");
        String originalFilename;
        if (generalResource.isEmpty()){
            return "1 请选择文件后上传";
        }else {
            originalFilename = generalResource.getOriginalFilename();
//            System.out.println("文件原名：" + originalFilename);
//            System.out.println("文件名称：" + uploadResume.getName());
//            System.out.println("文件长度：" + uploadResume.getSize());
//            System.out.println("文件类型：" + uploadResume.getContentType());
//            System.out.println("=======================================================");
            try{
                File filepath = new File(realPath, originalFilename);
                if (!filepath.getParentFile().exists()){
                    filepath.getParentFile().mkdirs();
                }
                generalResource.transferTo(new File(realPath + File.separator + originalFilename));
                updateGeneralResource(request, realPath, originalFilename);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/generalResource.html";
    }

    private GeneralResouce updateGeneralResource(HttpServletRequest request, String realPath, String filename){
        User user = (User) request.getSession().getAttribute("user");

        GeneralResouce generalResouce = new GeneralResouce();
        generalResouce.setFileName(filename);
        generalResouce.setFileUrl(realPath + "/" + filename);
        generalResouce.setUpdateTime(new Date());
        generalResouce.setUpUid(user.getUserId());
        generalResouce.setResourceLevel(GeneralResouce.RESUME);
        resourceServer.updateGeneralResouce(generalResouce);

        return generalResouce;
    }

    private void updateResume(UpdateResume updateResume, GeneralResouce generalResouce){
        Resume resume = new Resume();
        resume.setfId(generalResouce.getFileId());
        resume.setEducationBackground(updateResume.getEducationBackground());
        resume.setGraduatedYear(updateResume.getGraduatedYear());
        resume.setPersonName(updateResume.getPersonName());
        resume.setProjects(updateResume.getProjects());
        resourceServer.updateResume(resume);
    }

    @RequestMapping(value = "/downloadResume.html")
    public ResponseEntity<byte[]> downloadResume(HttpServletRequest request, String filename) throws IOException {

        //下载文件路径
        String path = request.getServletContext().getRealPath("/fileUpload/temp/");
        File file = new File(path + File.separator + filename);
        HttpHeaders headers = new HttpHeaders();
        //下载显示的文件名，解决中文名称乱码问题
        String downloadFileName = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
        //通知浏览器以attachment（下载方式）
        headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + downloadFileName);
//        headers.setContentDispositionFormData("attachment", filename);
        //application/octet-stream : 二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/generalResource.html")
    public String generalResource(HttpServletRequest request){
        List<GeneralResourceInfo> generalResourceList = resourceServer.getGeneralResourceList(1, 10);
        Integer listCount = resourceServer.getGeneralResourceListCount();
        request.getSession().setAttribute("listCount", listCount);
        request.getSession().setAttribute("generalResourceList", generalResourceList);
        return "generalResource";
    }
}
