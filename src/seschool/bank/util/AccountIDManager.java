package seschool.bank.util;

import java.text.DecimalFormat;
import java.util.Random;

/**
 * 새로운 은행계좌 번호를 생성하는 클래스.
 * 중복된 번호 검사는 하지 않는다.
 */
public class AccountIDManager {
	private static final int BANK = 123;	/** 은행 코드 */
	private static final int BRANCH = 45;	/** 지점 코드 */
	
	/**
	 * 해당 은행코드, 지점코드, 무작위로 생성한 5자리 숫자를 조합하여 새로운 계좌번호를 생성한다.
	 * @return 생성된 계좌번호
	 */
	public static String newAccountNo() {
		Random r = new Random();
		int num = r.nextInt(100000);	//0~99999 값 

		DecimalFormat df = new DecimalFormat("00000");
		String accNo = BANK + "-" + BRANCH + "-" + df.format(num);

		return accNo;
	}
}
