package com.coderman;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.github.tobato.fastdfs.FdfsClientConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import tk.mybatis.spring.annotation.MapperScan;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;

@EnableTransactionManagement  //开启事务管理
@MapperScan("com.coderman.api.*.mapper") //扫描mapper
@SpringBootApplication
@Import(FdfsClientConfig.class)
public class XinguanApplication {

    public static void main(String[] args) {
        SpringApplication.run(XinguanApplication.class, args);
    }


}
