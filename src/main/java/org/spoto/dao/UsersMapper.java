package org.spoto.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.spoto.model.Users;

import java.util.List;

public interface UsersMapper {

    List<Users> list(@Param("account") String account, @Param("age") Integer age, RowBounds rb);

    Integer listCount(@Param("account") String account, @Param("age") Integer age);

    Integer add(Users us);

    Integer change(Users us);

    Integer del(@Param("ids")List<Integer> ids);
}
