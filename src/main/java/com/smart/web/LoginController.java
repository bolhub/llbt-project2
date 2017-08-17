package com.smart.web;

import com.smart.domain.User;
import com.smart.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by HP on 2017-07-31.
 */
//1.标注成为一个Spring MVC的Controller
@Controller
public class LoginController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService){
            this.userService = userService;
        }

    //2.负责处理/index.html的请求
    @RequestMapping(value = "/index.html")
    public String loginPage(){
        return "login";
    }

    //3.负责处理/loginCheck.html的请求
    @RequestMapping(value = "/loginCheck.html")
    public ModelAndView loginCheck(HttpServletRequest request, LoginCommand loginCommand){
        boolean isValidUser = userService.hasMatchUser(loginCommand.getUserName(), loginCommand.getPassword());

        return new ModelAndView("main");
        /*if(!isValidUser)
            return new ModelAndView("login", "error", "用户名或密码错误。");
        else {
            User user = userService.findUserByUserName(loginCommand.getUserName());
            user.setLastIp(request.getLocalAddr());
            user.setLastVisit(new Date());
            userService.loginSuccess(user);
            request.getSession().setAttribute("user", user);
            return new ModelAndView("main");
        }*/
    }

    @RequestMapping(value = "/register.html")
    public String register(){
        return "register";
    }

    @RequestMapping(value = "/doRegister.html")
    public ModelAndView doRegister(HttpServletRequest request, LoginCommand loginCommand){
        boolean isvalidUserName = !userService.hasMatchUserName(loginCommand.getUserName());

        if (!isvalidUserName){
            return new ModelAndView("register", "error", "用户名已经被使用");
        }

        User user = new User();
        user.setUserName(loginCommand.getUserName());
        user.setPassword(loginCommand.getPassword());
        /*user.setLastIp(request.getLocalAddr());
        user.setLastVisit(new Date());*/
        userService.register(user);
        return new ModelAndView("login", "success", "注册成功请登录！");
    }

}
