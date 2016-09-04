package seschool.bank.util;

import java.util.Random;

/**
 * 적금이나 대출 계좌를 신규로 개설할 때, 이율을 계산하는 클래스. (임의의 값을 생성하여 사용한다.)
 */
public class InterestManager {
	private static final double SAVING = 2.;	//적금 이율은 2~3% 랜덤으로 생성
	private static final double LOAN = 4.;		//대출 이율은 4~5% 랜덤으로 생성
	
	/**
	 * @param type 계좌 종류
	 * @return 적금 또는 대출 이율
	 */
	public static double getInterest(String type) {
		Random r = new Random();
		double num = r.nextInt(10) / 10.0;	// 0 ~ 1미만의 값 
		
		if (type.equals("saving")) {
			num += SAVING;
		}
		else if (type.equals("loan")) {
			num += LOAN;
		}

		return num;
	}
}
