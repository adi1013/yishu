package com.gcu.yishu.uuid;

import java.util.UUID;
/*
 * uuid工具类
 * */
public class UUIDUtils {
    
	//用于产生唯一标识uuid
	public static String getUUID(){
        return UUID.randomUUID().toString().replace("-", "");
   }

}
