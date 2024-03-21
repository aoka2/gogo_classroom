package Model;

import java.security.MessageDigest;

import org.apache.tomcat.util.codec.binary.Base64;

public class doHash{
	public static String hash(String target) {
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(target.getBytes());
				return Base64.encodeBase64URLSafeString(md.digest());
			}catch(Exception e) {
				throw new RuntimeException(e);
			}
	}
}