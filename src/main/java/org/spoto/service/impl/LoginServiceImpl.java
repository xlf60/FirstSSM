package org.spoto.service.impl;

import org.spoto.dao.LoginMapper;
import org.spoto.model.Users;
import org.spoto.service.LoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LoginServiceImpl implements LoginService {

    @Resource
    private LoginMapper lm;

    @Override
    public Users doLogin(String account, String passwd) {
//        System.out.println("========" + uname);
        return lm.doLogin(account,passwd);
    }
}
