package cn.rails.physicals.util;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
/**
 * @Description: shiro加密
 * @Author: pan zhenghui
 * @Date: 2021/1/25 14:20
 */
public class PasswordUtils {

    private static RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();

    private static String algorithmName = "md5";
    private static int hashIterations = 2;

    public static String getSalt() {
        return randomNumberGenerator.nextBytes().toHex();
    }

    public static String encryptPassword(String password, String salt) {
        return new SimpleHash(algorithmName, password, ByteSource.Util.bytes(salt), hashIterations).toHex();
    }


    public static void main(String[] args) {
        String salt = getSalt();
        System.out.println("salt:" + salt);
        System.out.println("password:" + encryptPassword("mars", salt));
    }

}