package com.imcode.mail;

import com.imcode.common.service.MailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-config.xml")
public class MailTest {

    @Autowired
    private MailService mailService;


    @Test
    public void test02(){

        mailService.sendSimpleMail("541167234@qq.com",
                "jike_li@qq.com",
                "spring集成邮件测试",
                "Hello World");
    }






    @Test
    public void test01(){

        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

        mailSender.setHost("smtp.163.com");//邮件服务器
        mailSender.setPort(25);//邮件服务器端口
        mailSender.setUsername("ztd_zhiyou@163.com"); //可以设置为注册的163邮箱
        mailSender.setPassword("zhiyou123"); //客户端授权密码

        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom("ztd_zhiyou@163.com");
        mailMessage.setTo("jike_li@qq.com");
        mailMessage.setSubject("爱生鲜-账号激活");//主题
        mailMessage.setText("大家好才是真的好");
        //发送邮件
        mailSender.send(mailMessage);

        System.out.println("发送邮件成功");
    }
}
