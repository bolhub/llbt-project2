package com.smart.web;

import com.smart.dao.UserDao;
import com.smart.service.UserService;
import com.smart.web.domain.UserRoleInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UserFunctionController {

    private UserService userService;

    @RequestMapping(value = "/userFunction.html")
    public String userFunction(HttpServletRequest request){
        List<UserRoleInfo> userRoleInfoList = userService.userRoleInfoList(1, 5);
        request.getSession().setAttribute("userRoleList", userRoleInfoList);
        return "userRole";
    }

    @Autowired
    public void setUserService(UserService userService){
        this.userService = userService;
    }
}
