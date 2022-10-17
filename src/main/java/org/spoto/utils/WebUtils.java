package org.spoto.utils;

import com.alibaba.fastjson.JSONObject;

/**
 * web工具类
 */
public class WebUtils {
    public static String retrunData(Object obj){
        JSONObject json = (JSONObject) JSONObject.toJSON(obj);
        return json.toString();
    }
}
