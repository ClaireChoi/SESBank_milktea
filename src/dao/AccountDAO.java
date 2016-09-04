package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.Account;
import vo.AccountLog;

public class AccountDAO {
	SqlSessionFactory factory= MybatisConfig.getSqlSessionFactory();
	SqlSession sqlSession;
	public AccountDAO() {
		super();
		
	}

	public List listAccount(String custid){
		List<Account> acList = null;
		Map<String,String> custidmap = new HashMap<>();
		custidmap.put("custid", custid);
		try{
			sqlSession = factory.openSession();
			acList = sqlSession.selectList("Account.listAccount", custidmap);
			sqlSession.commit();
			System.out.println("=================accountdao"+acList);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
		return acList;
	}
	
	public int searchAccount(String accountno){
		int cnt =0;
		try{
			sqlSession = factory.openSession();
			Account ac=null;
			ac= sqlSession.selectOne("Account.searchAccount", accountno);
			if(ac!=null){
				cnt++;
			}
			sqlSession.commit();
			System.out.println("=================account cnt:"+cnt);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
		return cnt;
	}
	
	public int insertAccount(Account acc){
		int cnt=0;
		try{
			sqlSession = factory.openSession();
			cnt=sqlSession.insert("Account.insertAccount", acc);
			sqlSession.commit();
			System.out.println("=================accountdao insert 확인 "+cnt);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
		return cnt;
	}
	
	public void deposit(Map<String, String> anoamo){
	
		System.out.println("=================accountdao deposit 확인 "+ anoamo );
		if(anoamo.get("custid")!=null){
		int balance = checkBalance(anoamo);
		AccountLog acclog = new AccountLog(0, anoamo.get("custid"), anoamo.get("accountno"),
				"", "sysdate", "deposit", "", Integer.parseInt(anoamo.get("amount")), balance);
		accountLog(acclog);}
		try{
			sqlSession = factory.openSession();
			
			sqlSession.update("Account.depositAccount", anoamo);
			sqlSession.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
	}
	
	//출금 실패하면 0 리턴, 성공하면 1리턴
	public int withdraw(Map<String, String> anoamo){
		System.out.println("===================accountdao withdraw 확인 "+ anoamo);
		if(anoamo.get("custid")!=null){
		int balance = checkBalance(anoamo);
		AccountLog acclog = new AccountLog(0, anoamo.get("custid"), anoamo.get("accountno"),
				"", "sysdate", "withdraw", "", Integer.parseInt(anoamo.get("amount")), balance);
		accountLog(acclog);
		}
		int bal = this.checkBalance(anoamo);
		if(bal < Integer.parseInt(anoamo.get("amount"))){
			System.out.println("출금 금액이 잔액보다 큽니다.");
			return 0; //출금 실패. 
		}
		try{
			sqlSession = factory.openSession();
			
			sqlSession.update("Account.withdrawAccount", anoamo);
			sqlSession.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
		return 1; //출금 성공
	}
	
	public int checkBalance(Map<String , String> acno){
		System.out.println("=============select balance 확인 "+acno);
		int bal = 0;
		try{
			sqlSession = factory.openSession();
			
			bal = sqlSession.selectOne("Account.checkBalance", acno);
			sqlSession.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
		return bal;
	}
	
	//정보를 저장하자!
	//custid, accountno,transferno,eventdate, eventtype,eventrecord, amount, balance
	public void accountLog(AccountLog alog){
		System.out.println("===============insert AccountLog");
		try{
			sqlSession = factory.openSession();
			sqlSession.insert("AccountLog.insertAccountLog", alog);
			sqlSession.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
	}
	
	public List searchAccountLog(Map<String, String> info){
		List logList = null;
		try{
			sqlSession = factory.openSession();
			logList = sqlSession.selectList("AccountLog.searchAccountLog", info);
			sqlSession.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
		return logList;
	}
	
	//accountno 받아와서 대출허가 N 으로 바꿔주기
	public void loan_allow(String accno){
		try {
			Map<String, String> accnom = new HashMap<>();
			accnom.put("accno", accno);
			sqlSession = factory.openSession();
			sqlSession.update("Account.loan_allow", accnom);
			sqlSession.commit();
			
		} catch (Exception e) {
			if(sqlSession != null) sqlSession.close();
		}
		
	}
}
