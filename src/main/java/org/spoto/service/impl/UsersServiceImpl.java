package org.spoto.service.impl;

import org.spoto.dao.UsersMapper;
import org.spoto.dto.TabData;
import org.spoto.model.Users;
import org.spoto.service.UsersService;
import org.spoto.utils.PageUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {

    @Resource
    private UsersMapper um;

    @Override
    public TabData<Users> list(Integer pageIndex, Integer pageSize, String account, Integer age){
        TabData<Users> td = new TabData<>();
        td.setPageIndex(pageIndex);
        td.setPageSize(pageSize);

        //查询统计数据
        Integer count = um.listCount(account, age);
//        System.out.println("统计数据:" + count);
        td.setDataCount(count);
        if (count <= 0){

            return td;
        }

        //查询数据列表
        List<Users> list = um.list(account, age, PageUtils.getRb(pageIndex, pageSize));
        td.setDataList(list);

        return td;
    }

    @Override
    public boolean save(Users us){

        Integer id = us.getId();
        Integer r = 0;
        if(id.equals(0)){
            //新增
           r =  um.add(us);
        }else {
            //编辑
           r = um.change(us);
        }
        return r > 0;
    }

    @Override
    public boolean del(String[] idArr){
        List<Integer> ids = new ArrayList<>();
        for (String s : idArr){
            int id = Integer.parseInt(s);
            ids.add(id);
        }
        Integer del = um.del(ids);
        return del > 0;
    }
}
