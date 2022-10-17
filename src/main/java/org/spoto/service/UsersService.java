package org.spoto.service;

import org.spoto.dto.TabData;
import org.spoto.model.Users;

public interface UsersService {
    TabData<Users> list(Integer pageIndex, Integer pageSize, String account, Integer age);

    boolean save(Users us);

    boolean del(String[] idArr);
}
