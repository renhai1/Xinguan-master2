package com.coderman.api.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

//自定义注解，用于标注在controller的方法上，异步记录日志
@Target(ElementType.METHOD)
//指明了被描述的注解可以用在方法内
@Retention(RetentionPolicy.RUNTIME)
//指明生存周期，这里是运行级别保留，编译后的class文件中存在，在jvm运行时保留，可以被反射调用
public @interface ControllerEndpoint {
    String operation() default "";
    String exceptionMessage() default "系统内部异常";
}
