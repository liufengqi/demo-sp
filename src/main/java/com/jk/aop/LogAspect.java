package com.jk.aop;

import com.jk.model.Aop;
import com.jk.model.News;
import com.jk.model.User;
import com.jk.model.YIchang;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Aspect
@Component
public class LogAspect {

private  static  String url="";

    @Autowired
    private MongoTemplate mongoTemplate;

    @Pointcut("execution(public * com.jk.controller.*.*(..))")
    public void webLog(){
    }


    @Before("webLog()")
    public void deBefore(JoinPoint joinPoint) throws Throwable {
        System.err.println("22222222222");
        // 接收到请求，记录请求内容
    ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        // 记录下请求内容
       url= request.getRequestURL().toString();
             System.out.println("URL : " + request.getRequestURL().toString());
        System.out.println("HTTP_METHOD : " + request.getMethod());
        System.out.println("IP : " + request.getRemoteAddr());
        System.out.println("CLASS_METHOD : " + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        System.out.println("ARGS : " + Arrays.toString(joinPoint.getArgs()));

    }

    @AfterReturning(returning = "ret", pointcut = "webLog()")
    public void doAfterReturning(Object ret) throws Throwable {
        HttpServletRequest request= ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        String url = request.getRequestURL().toString().substring(request.getRequestURL().toString().lastIndexOf("/"));
        System.err.println(url+"刘风奇");

        if ("/selectUser".equals(url)&&url!=null) {

            User req = (User) request.getSession().getAttribute("user");
            User user = new User();
            System.err.println("req : " + req);
            System.err.println("getUsername : " + req.getUsername());
            user.setUserid(req.getUserid());
            user.setUsername(req.getUsername());
            user.setUserpass(req.getUserpass());
            user.setZtid(ret.toString());
            mongoTemplate.save(user);
        }else{

            System.err.println("sfasfafadfdsknfadkl"+ret.toString());
             Aop aop=new Aop();
          //  List <News>list=(List<News>)ret;
      /*      for (int i = 0; i <list.size(); i++) {*/
              /*  news.setNewsid(list.get(i).getNewsid());*/
            aop.setUser(ret.toString());
              /*  news.setContent(list.get(i).getContent());
                news.setPublishtime(list.get(i).getPublishtime());*/
                mongoTemplate.save(aop);
         /*   }*/
        }

       /* List<Object> resultList = mdmWritebackDao.getEsolutionCallData(esolutionCall, indexOf, pageSize);
*/
    /*    for (Object obj : ret) {
            Object[] objs = (Object[]) obj;
            String param1 = (String) objs[0];
            String param2 = (String) objs[1];
            String param3 = (String) objs[2];
        }*/

        // 处理完请求，返回内容

       System.out.println("方法的返回值 : " + ret);

        List list = new ArrayList();
        /*for (int i = 0; i < ret.size(); i++) {
            news.setNewsid(list.get(i));
        }*/
    }

    //后置异常通知
    @AfterThrowing("webLog()")
    public void throwss(JoinPoint jp){
        System.err.println(jp);
        System.out.println("方法异常时执行.....");
        YIchang yichang = new YIchang();

         yichang.setYcvalue(jp.toString());
              /*  news.setContent(list.get(i).getContent());
                news.setPublishtime(list.get(i).getPublishtime());*/
           mongoTemplate.save(yichang);
    }
}
