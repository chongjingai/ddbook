import com.oraclewdp.dd.util.MD5Util;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public class MD5UtilTest {
    public static void main(String  args[]){
        String admin="admin";
        try {
            System.out.print(MD5Util.getEncryptedPwd(admin));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
