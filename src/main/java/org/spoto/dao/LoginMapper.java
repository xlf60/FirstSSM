package org.spoto.dao;

import org.apache.ibatis.annotations.Param;
import org.spoto.model.Users;

public interface LoginMapper {

    Users doLogin(@Param("account") String account, @Param("passwd")String passwd);
}
