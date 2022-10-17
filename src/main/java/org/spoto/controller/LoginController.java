package org.spoto.controller;

import com.alibaba.fastjson.JSONObject;
import org.spoto.model.Users;
import org.spoto.service.LoginService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@RestController
public class LoginController {

    @Resource
    private LoginService ls;

    @RequestMapping("dologin")
    public String dologin(String account, String passwd, HttpServletRequest request){
        System.out.println(account);
        System.out.println(passwd);
        JSONObject d = new JSONObject();

        Users u = ls.doLogin(account, passwd);
        if (u != null) {
            //登录成功后存状态
            request.getSession().setAttribute("logined",u.getId());
            d.put("type",true);
        }else {
            d.put("type",false);
        }
        return d.toString();
    }
}
