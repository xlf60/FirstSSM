package org.spoto.controller;

import com.alibaba.fastjson.JSONObject;
import org.spoto.dto.TabData;
import org.spoto.model.Users;
import org.spoto.service.UsersService;
import org.spoto.utils.WebUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;


@RestController
public class UsersController {

     @Resource
     private UsersService us;

    @RequestMapping("users-list")
    public String list(Integer pageIndex,String account,Integer age){
        //参数校验
        if(pageIndex == null || pageIndex <=0){
            pageIndex = 1;
        }
        //每页显示几条数据
        int pageSize = 4;

        //调用业务层处理数据
        TabData<Users> td = us.list(pageIndex, pageSize, account, age);
        //输出
        return WebUtils.retrunData(td);
    }


    @RequestMapping("users-save")
    public String save(Users ur){
        ur.setPasswd("123");

        System.out.println(ur.toString());
        boolean save = us.save(ur);

        JSONObject data = new JSONObject();

        data.put("type",save);

        //输出
        return data.toString();
    }

    @RequestMapping("users-del")
    public String  del( String ids){
        JSONObject data = new JSONObject();

        //参数校验
        if(ids == null || ids.equals("")){
            data.put("type",false);
            return "err";
        }
        String[] idArr = ids.split(",");
        //调用业务层处理数据
        boolean del = us.del(idArr);

        data.put("type",del);

        //输出
        return data.toString();
    }
}
