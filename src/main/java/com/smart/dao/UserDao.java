package com.smart.dao;

import com.smart.domain.User;
import com.smart.web.domain.UserRoleInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by HP on 2017-07-30.
 */
@Repository
public class UserDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    private final static String MATCH_COUNT_SQL = " SELECT count(*) FROM t_user WHERE user_name = ? and password = ? ";

    private final static String UPDATE_LOGIN_INFO_SQL = " UPDATE t_user SET last_visit=?, last_ip=?,credits=? WHERE user_id=?";

    private final static String QUERY_BY_USERNAME = " SELECT user_id,user_name,credits FROM t_user WHERE user_name=? ";

    public int getMatchCount(String userName, String password) throws DataAccessException {
        return jdbcTemplate.queryForObject(MATCH_COUNT_SQL, new Object[]{ userName, password}, Integer.class);
    }

    private final static String MATCH_USERNAME_COUNT_SQL = " SELECT count(*) FROM t_user WHERE user_name = ? ";

    public int getMatchCount(String userName){
        return jdbcTemplate.queryForObject(MATCH_USERNAME_COUNT_SQL, new Object[]{ userName }, Integer.class);
    }

    public User findUserByUserName(final String userName){
        final User user = new User();
        jdbcTemplate.query(QUERY_BY_USERNAME, new Object[]{userName}, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                user.setUserId(resultSet.getInt("user_id"));
                user.setUserName(userName);
                user.setCredits(resultSet.getInt("credits"));
            }
        });
        return user;
    }

    public void updateLoginInfo(User user){
        jdbcTemplate.update(UPDATE_LOGIN_INFO_SQL, new Object[]{ user.getLastVisit(), user.getLastIp(), user.getCredits(), user.getUserId() });
    }

    private static final String REGISTER = " INSERT INTO t_user(user_name,password) VALUES(?,?) ";
    public User register(User user){
        jdbcTemplate.update(REGISTER, new Object[]{ user.getUserName(), user.getPassword()});
        User user1 = findUserByUserName(user.getUserName());
        user1.setPassword(user.getPassword());
        return user1;
    }

    private static final String INSERT_USER_ROLE_SQL = " INSERT INTO t_user_role(user_id, role_id) VALUES(?,?) ";
    public void insertUserRole(int userId, int roleId){
        jdbcTemplate.update(INSERT_USER_ROLE_SQL, new Object[]{ userId, roleId });
    }

    private static final String QUERY_USER_ROLE_SQL = "SELECT u.user_id, u.user_name, r.descript FROM t_user u, t_role r, t_user_role ur " +
            " WHERE u.user_id=ur.user_id AND r.id=ur.role_id ";
    public List<UserRoleInfo> userRoleInfoList(int pageNo, int pageSize){
        return jdbcTemplate.query(QUERY_USER_ROLE_SQL + getPage(pageNo, pageSize), new RowMapper<UserRoleInfo>() {
            @Override
            public UserRoleInfo mapRow(ResultSet resultSet, int i) throws SQLException {
                UserRoleInfo userRoleInfo = new UserRoleInfo();
                userRoleInfo.setUserId(resultSet.getInt("user_id"));
                userRoleInfo.setUserName(resultSet.getString("user_name"));
                userRoleInfo.setRoleName(resultSet.getString("descript"));
                return userRoleInfo;
            }
        });
    }

    private String getPage(int pageNo, int pageSize){
        if (pageNo < 1) pageNo = 1;
        if (pageSize <= 0) pageSize = 5;
        String page = " LIMIT " + (pageNo - 1) * pageSize + ", " + pageSize + " ";
        return page;
    }
}
