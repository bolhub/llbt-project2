package com.smart.dao;

import com.smart.domain.GeneralResouce;
import com.smart.domain.Resume;
import com.smart.web.ResumeInfo;
import com.smart.web.domain.GeneralResourceInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

@Repository
public class ResourceDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String QUERY_RESUME_SQL = " SELECT r.*,g.fileName FROM t_resume r, t_generalresouce g WHERE r.fId=g.fileId ";

    /**
     * 简历列表
     * @return
     */
    public List<ResumeInfo> getResumeList(int pageNo, int pageSize, ResumeInfo resumeInfo){
        String add_sql = "";
        if (StringUtils.hasLength(resumeInfo.getPersonName()))
            add_sql += " AND personName='" + resumeInfo.getPersonName() + "' ";
        if (StringUtils.hasLength(resumeInfo.getGraduatedYear())) {
            if (resumeInfo.getGraduatedYear().length() == 1) {
                add_sql += " AND YEAR(now()) - YEAR(graduated_year)=" + resumeInfo.getGraduatedYear();
            }else
                add_sql += " AND YEAR(now()) - YEAR(graduated_year)" + resumeInfo.getGraduatedYear();
        }
        if (StringUtils.hasLength(resumeInfo.getEducationBackground()))
            add_sql += " AND educationBackground='" + resumeInfo.getEducationBackground() + "' ";
        if (StringUtils.hasLength(resumeInfo.getProjects()))
            add_sql += " AND projects=" + resumeInfo.getProjects();
        return jdbcTemplate.query(QUERY_RESUME_SQL + add_sql + getPage(pageNo, pageSize), new RowMapper<ResumeInfo>() {
            public ResumeInfo mapRow(ResultSet resultSet, int i) throws SQLException {
                ResumeInfo resumeInfo = new ResumeInfo();
                resumeInfo.setfId(resultSet.getInt("fId"));
                resumeInfo.setPersonName(resultSet.getString("personName"));
                if(resultSet.getDate("graduated_year") != null)
                    resumeInfo.setGraduatedYear(new SimpleDateFormat("YYYY-MM-DD").format(resultSet.getDate("graduated_year")));
                resumeInfo.setEducationBackground(resultSet.getString("educationBackground"));
                resumeInfo.setProjects(resultSet.getString("projects"));
                resumeInfo.setFileName(resultSet.getString("fileName"));
                return resumeInfo;
            }
        });
    }

    private static final String RESUME_COUNT_SQL = " SELECT count(*) FROM t_resume r, t_generalresouce g WHERE r.fId=g.fileId ";

    /**
     * 获得简历总记录条数
     * @return
     */
    public Integer getResumeListCount(ResumeInfo resumeInfo){
        String add_sql = "";
        if (StringUtils.hasLength(resumeInfo.getPersonName()))
            add_sql += " AND r.personName='" + resumeInfo.getPersonName() + "' ";
        if (StringUtils.hasLength(resumeInfo.getGraduatedYear())) {
            if (resumeInfo.getGraduatedYear().length() == 1) {
                add_sql += " AND YEAR(now()) - YEAR(r.graduated_year)=" + resumeInfo.getGraduatedYear();
            }else
                add_sql += " AND YEAR(now()) - YEAR(r.graduated_year)" + resumeInfo.getGraduatedYear();
        }
        if (StringUtils.hasLength(resumeInfo.getEducationBackground()))
            add_sql += " AND r.educationBackground='" + resumeInfo.getEducationBackground() + "' ";
        if (StringUtils.hasLength(resumeInfo.getProjects()))
            add_sql += " AND r.projects=" + resumeInfo.getProjects();
        Integer result = jdbcTemplate.queryForObject(RESUME_COUNT_SQL + add_sql, Integer.class);
        return result;
    }

    private static final String GENERALRESOURCE_COUNT_SQL = " SELECT count(*) FROM t_generalresouce WHERE resource_level=0 ";

    /**
     * 获得普通资源总记录条数
     * @return
     */
    public Integer getGeneralResourceListCount(){
        return jdbcTemplate.queryForObject(GENERALRESOURCE_COUNT_SQL, Integer.class);
    }

    private static final String QUERY_GENERALRESOURCE_SQL = " SELECT g.fileId, g.filename, g.updateTime, u.user_name FROM t_generalresouce g, t_user u WHERE g.upUid=u.user_id AND g.resource_level=0 ";
    /**
     * 文件列表
     * @return
     */
    public List<GeneralResourceInfo> getGeneralResourceList(int pageNo, int pageSize){
        return jdbcTemplate.query(QUERY_GENERALRESOURCE_SQL + getPage(pageNo, pageSize), new RowMapper<GeneralResourceInfo>() {
            @Override
            public GeneralResourceInfo mapRow(ResultSet resultSet, int i) throws SQLException {
                GeneralResourceInfo generalResouce = new GeneralResourceInfo();
                generalResouce.setFileId(resultSet.getInt("fileId"));
                generalResouce.setFilename(resultSet.getString("fileName"));
                generalResouce.setUpdateTime(resultSet.getString("updateTime"));
                generalResouce.setOwner(resultSet.getString("user_name"));
                return generalResouce;
            }
        });
    }

    private final static String INSERT_RESUME_SQL = " INSERT INTO " +
            " t_resume(fId, personName, graduatedYear, educationBackground, projects) VALUES(?,?,?,?,?)";

    /**
     * 写入简历信息
     * @param resume
     */
    public void insertResume(Resume resume){
        Object[] args = { resume.getfId(), resume.getPersonName(), resume.getGraduatedYear(), resume.getEducationBackground(), resume.getProjects() };
        jdbcTemplate.update(INSERT_RESUME_SQL,args);
    }

    private final static String INSERT_GENERAL_RESOUCE_SQL = " INSERT INTO " +
            " t_generalresouce(fileName, fileUrl, updateTime, upUid ) VALUES(?,?,?,?) ";

    /**
     * 数据库写入上传文件信息
     * @param generalResouce
     */
    public void insertGeneralResouce(GeneralResouce generalResouce){
        Object[] args = { generalResouce.getFileName(), generalResouce.getFileUrl(), generalResouce.getUpdateTime(), generalResouce.getUpUid() };
        jdbcTemplate.update(INSERT_GENERAL_RESOUCE_SQL, args);
    }

    private static final String QUERY_BY_GENERALRESOUCE = " SELECT * FROM t_generalresouce WHERE " +
            " fileName=? and updateTime=? and upUid=? ";

    /**
     * 写入generalResource后得到generalResource
     * @param generalResouce
     * @return
     */
    public GeneralResouce getGeneralResouce(final GeneralResouce generalResouce){
        Object[] args = { generalResouce.getFileName(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(generalResouce.getUpdateTime()), generalResouce.getUpUid() };
        jdbcTemplate.query(QUERY_BY_GENERALRESOUCE, args, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                generalResouce.setFileId(resultSet.getInt("fileId"));
            }
        });
        return generalResouce;
    }

    private String getPage(int pageNo, int pageSize){
        if (pageNo < 1) pageNo = 1;
        if (pageSize <= 0) pageSize = 5;
        String page = " LIMIT " + (pageNo - 1) * pageSize + ", " + pageSize + " ";
        return page;
    }
}
