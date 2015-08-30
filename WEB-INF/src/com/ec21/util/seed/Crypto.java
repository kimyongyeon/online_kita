package com.ec21.util.seed;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;


/*
 * @author EC21 - Han SeungHoon
 * @작성된 날짜: Mar 13, 2008
 * @version 1.0
 * @file name: Crypto
 *  *  확인  사항: 
 *  1. 물리적 위치가 다를시에는 비밀키를 한쪽에서 생성해서 배포를 해야함.
 *  2. BASE64Encoder 시에 플랫폼 별로 carrige return이 추가되고  값이 다름 --> 이를 제거하도록 했음
 *     - windows: \r\n 
 *     - linux, unix : \n
 *  3. unix server side에서는  BASE64Encoder시, 기호 '+','_' 에 대하여  http 통신시에 삭제 되는 경우가 발생함 
 *     - 한번더 URL encode 해줌 
 *  
 *  4. http call시에는 URL DECODE가 자동적으로 수행되므로 decrypt시에 빼 주어야함. 
 */

public class Crypto {
  /**
	 * 파일암호화에 쓰이는 버퍼 크기 지정
	 */
	public static final int kBufferSize = 8192;

	public static java.security.Key key = null;

	public static final String defaultkeyfileurl = "defaultkey.key";

	/**
	 * 비밀키 생성메소드
	 * 
	 * @return void
	 * @exception java.io.IOException,java.security.NoSuchAlgorithmException
	 */
	public static java.io.File makekey() throws java.io.IOException, java.security.NoSuchAlgorithmException {
		return makekey(defaultkeyfileurl);
	}

	public static java.io.File makekey(String filename) throws java.io.IOException, java.security.NoSuchAlgorithmException {
		java.io.File tempfile = new java.io.File(".", filename);
		javax.crypto.KeyGenerator generator = javax.crypto.KeyGenerator.getInstance("DES");
		generator.init(new java.security.SecureRandom());
		java.security.Key key = generator.generateKey();
		java.io.ObjectOutputStream out = new java.io.ObjectOutputStream(new java.io.FileOutputStream(tempfile));
		out.writeObject(key);
		out.close();
		return tempfile;
	}

	/**
	 * 지정된 비밀키를 가지고 오는 메서드
	 * 
	 * @return Key 비밀키 클래스
	 * @throws NoSuchAlgorithmException
	 * @exception Exception
	 */

	private static java.security.Key getKey() throws Exception {
		if (key != null) {
			return key;
		} else {
			return getKey(defaultkeyfileurl);
			// return getMKey();
		}
	}

	private static java.security.Key getKey(String fileurl) throws Exception {
		if (key == null) {
			java.io.File file = new java.io.File(fileurl);
			if (!file.exists()) {
				file = makekey();
			}
			if (file.exists()) {
				java.io.ObjectInputStream in = new java.io.ObjectInputStream(new java.io.FileInputStream(fileurl));
				key = (java.security.Key) in.readObject();
				in.close();
			} else {
				throw new Exception("암호키객체를 생성할 수 없습니다.");
			}
		}
		return key;
	}

	private static java.security.Key getMKey() throws NoSuchAlgorithmException {

		javax.crypto.KeyGenerator generator = javax.crypto.KeyGenerator.getInstance("DES");
		generator.init(new java.security.SecureRandom());
		java.security.Key key = generator.generateKey();
		// System.out.println("MKey[" + key + "]");
		Crypto.key = key;
		return key;
	}

	public static String decrypt(String outStr) throws InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, IOException, Exception {
		return decrypt(outStr, 0);
	}

	public static String decrypt(String outStr, int dec) throws UnsupportedEncodingException, Exception {
		if (outStr == null || outStr.length() == 0)
			return "";

//		System.out.println("before url_decode: " + outStr);

		/** **** using in not http protocal ********** */
		if (dec == 1) {
			outStr = URLDecoder.decode(outStr);
//			System.out.println("after url_decode: " + outStr);
		}

		/** ***************************************** */

		SeedCipher seed = new SeedCipher();

		//byte[] encryptbytes = Base64.decode(outStr);
		sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
		byte[] encryptbytes  = decoder.decodeBuffer(outStr);
		String decryptText = seed.decryptAsString(encryptbytes, getKey().toString().getBytes(), "UTF-8");

//		System.out.println("dectypt: " + decryptText);
		return decryptText;
	}

	public static String encrypt(String inStr) throws UnsupportedEncodingException, Exception {
		if (inStr == null || inStr.length() == 0)
			return "";

//		System.out.println("before encrypt: " + inStr);
		//String plaintext = inStr;
		SeedCipher seed = new SeedCipher();
		//String encryptText = Base64.encode(seed.encrypt(plaintext, getKey().toString().getBytes(), "UTF-8"));
		sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
		String encryptText = encoder.encode(seed.encrypt(inStr, getKey().toString().getBytes(), "UTF-8"));

		// String reStr = outputStr.replace("\n",""); // windows --> \r\n, unix-->
		// \n
		Pattern p = Pattern.compile("\r\n|\n");
		Matcher m = p.matcher(encryptText);
		String reStr = m.replaceAll("");

//		System.out.println("enctypt: " + reStr);

		reStr = URLEncoder.encode(reStr);

//		 System.out.println("url_encode: " + reStr);

		return reStr;
	}
}
