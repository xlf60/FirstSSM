package org.spoto.utils;

import org.apache.ibatis.session.RowBounds;

/**
 * 分页工具类
 */
public class PageUtils {

    /**
     * 计算最大页
     * @param dataCount 数据总条数
     * @param pageSize  每页显示的条数
     * @return 最大页
     */
    public static Integer getMaxPage(Integer dataCount,Integer pageSize){
        return (dataCount % pageSize == 0) ? (dataCount / pageSize) : (dataCount / pageSize) + 1;
    }

    /**
     * 计算分页数
     * @param pageIndex 页面索引
     * @param pageSize  页面数据条数
     * @return 分页数据
     */
    public static RowBounds getRb(Integer pageIndex, Integer pageSize){
        int offset = (pageIndex - 1) * pageSize;
        return new RowBounds(offset,pageSize);
    }
}
