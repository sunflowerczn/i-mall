package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016092100565419";
    //public static String app_id = "13285055956";
    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCDN84OS8d2hHffwwsCMA3vS1sMB7LElLRc/0rgRTHXDu+WvE26fA88na9daIpErzMh5fO4jn7xPfjgUCcTSucMndhY48Ds3bASZHYcvEI81Dl02m1lBcNIlPkBRjG791kZdHmeQlXelwOJsgd0gPVaWU6v2x+DXCO0aN7gMzikmIaUmDAiCetJFqFQ5rzIHOrli8Z3XK99wSaT1f3nzOtCydeIb3JIfgE24J9Ji8Wis3+2MAiKzZWDchLI3njhKlnVZxGQ3sxyn5wfDBsMd93zhEmznAlfX5sDrDISzGDm9N4UoHP+4BXNsoIxIuPe8jiaYYTKsIJNz0e/2Pcs46c9AgMBAAECggEAQP9Qi1ZQHE3rzyQe/Ntu25y5IdFiZOvAF9zBayv7Tyrv1Pu7iOdQ6Na2+g8Bhpo+OslcG4xCJx9qezpY0L6mimJZu1Y9x1bck4+9zegW62i4eUCFNahQHlDksxPhKNmSAgDnCVSUkmi9cOSFutjyL+nTB1sEVh469W+JDwdwRF8oc2PZK8mMp4+GckVb1KyStRnNxBvtK0OgLRxBDjkEdGsv0VpGiwb1qlgKnIOpBIf7HWIJf05h5nZEsLhVaW5OeebUlS4xIYXUqeTDlLTXzbSygCCpRXLIZeL8U1idYCcIZ4yDXVsQlEPqD9Npj4E5tn1vFPuZ7DKbVfUu7Fb2pQKBgQDyi3B75JMML/UgTP3zG+glBs8NL0ZiWIoLKsa/ixjrqWbU3uD0twAnQQ70bfEy8AcpX9eePhfVogjZX7EXcc9yiJEg5eZk7BHSIQfMc+rsCYKSyhZQiriNBdyd8tfuKRHejcsOvxoEdZy03P+7C56cs5TyT5mhOPwgozHR3gOg5wKBgQCKf1SyU6JBl5qBUw3Dk51eVrGI4vHp4lAaFm+BZ3+TVIengURM/yYjkp3fiADTSC6XarCWo603IeB/T8LFI2Z7Eohm8MUs1UVvNkF1W/nCLSi5c+0wk8RWEjlz+rHIcpK5Ie8iwZiNBBy5Kp1FBKudKmFPwUK3urFTcSd1SmmeOwKBgQCnR6R8zljcvvbBIFjFoymo39lNrp1MluQeb5JD6Rt27Y8Ooelk3hItAKHf0zPXfdRypLeBXDH0FZ0kzurE0KnSxH3Twrv0PxzLYByQ1iHgSW7U7qwVQJeoK7LM/QAQMiMw63pw4TyAdt1toD6AMrNiQDkqJdw/ZZ3+pI9nv0ehYQKBgFSQitaX2mrSdrSgUbcpWt1PcfdzGuMEHITRTiRlXbBH3MyaUWnyIQd3bo4eLOLVIB20Nz7DkfAn7zvNJ8/XXauoFUFFoh9N2aeeKTnPfyDhEgyqjBktIKStXAdE+2i5DH2eCrXeH5d6+07UhlKuF1tPlTttdZ9Zjwyz+rPTS8ohAoGADigq3jusyOvq34sbdTTnbNhn9IQnhwjRVGnCeZgYjxh5j5sYgn99OpsolgIVLv0YUEgUOb72uQmgFRMAe6ymbRQh4EBPb3u60lgo4tUfWXwBr0kc1oQwFg6H6cHbAJ8E18jzb69rlxSrKOKw9vO+m5Z7LLkRcl8LCZu/aqH72ko=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgzfODkvHdoR338MLAjAN70tbDAeyxJS0XP9K4EUx1w7vlrxNunwPPJ2vXWiKRK8zIeXzuI5+8T344FAnE0rnDJ3YWOPA7N2wEmR2HLxCPNQ5dNptZQXDSJT5AUYxu/dZGXR5nkJV3pcDibIHdID1WllOr9sfg1wjtGje4DM4pJiGlJgwIgnrSRahUOa8yBzq5YvGd1yvfcEmk9X958zrQsnXiG9ySH4BNuCfSYvForN/tjAIis2Vg3ISyN544SpZ1WcRkN7Mcp+cHwwbDHfd84RJs5wJX1+bA6wyEsxg5vTeFKBz/uAVzbKCMSLj3vI4mmGEyrCCTc9Hv9j3LOOnPQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    // public static String notify_url = "http://ypez8m.natappfree.cc/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://2954sc.natappfree.cc/pay/notifyPay";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     *
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
