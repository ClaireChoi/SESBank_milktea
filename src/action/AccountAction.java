package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.struts2.interceptor.SessionAware;
import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;

import com.opensymphony.xwork2.ActionSupport;

import dao.AccountDAO;
import seschool.bank.util.AccountIDManager;
import seschool.bank.util.InterestManager;
import seschool.bank.util.PageNavigator;
import vo.Account;
import vo.AccountLog;

public class AccountAction extends ActionSupport implements SessionAware {

	private String accountno;
	private String custid;
	private String accounttype;
	private String balance;
	private int payment;
	private double interest;
	private String startdeposit;
	private String enddeposit;
	private Map<String, Object> session;
	private List<Account> acList;
	private Account account;
	private String years;
	private String amount;
	private String backingname;
	private String accountsel;
	private String startdate;
	private String enddate;
	private String listcheck;
	private String listcheck2;
	private List<AccountLog> logList;
	private String approval;
	private List<AccountLog> pageList;
	private PageNavigator pagenavi;
	private int currentGroup;
	private int startPageGroup;
	private int endPageGroup;
	private String message;

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String execute() {
		return SUCCESS;
	}

	// balance를 받아온다.
	public String openAccount() {
		AccountDAO accdao = new AccountDAO();
		int exist;

		// 계좌번호 생성
		accountno = AccountIDManager.newAccountNo();
		System.out.println(balance + "   " + accountno + "    " + accounttype + "  " + years);
		enddeposit = years;
		exist = accdao.searchAccount(accountno);
		while (exist != 0) {
			accountno = AccountIDManager.newAccountNo();
			exist = accdao.searchAccount(accountno);
		}
		// 이자 생성
		interest = InterestManager.getInterest(accounttype);
		System.out.println("interest: " + interest);
		// balance String int 로 바꾸기
		int balance1 = 0;
		if (balance != null) {
			balance1 = Integer.parseInt(balance);
		}
		custid = (String) session.get("loginId");
		Account acc = null;
		System.out.println(accountno + custid + accounttype + payment + interest + "sysdate" + enddeposit + "N");
		if (accounttype.equals("checking")) {
			acc = new Account(accountno, custid, accounttype, balance1);
		} else if (accounttype.equals("saving")) {// 적금
			acc = new Account(accountno, custid, accounttype, payment, interest, "sysdate", enddeposit, "N");
		} else if (accounttype.equals("loan")) { // 대출
			acc = new Account(accountno, custid, accounttype, balance1, payment, interest, "sysdate", enddeposit, "N");
		}
		accdao.insertAccount(acc);
		// account list
		accdao = new AccountDAO();
		acList = accdao.listAccount(custid);
		for (Account account : acList) {
			if (account.getAccounttype().equals("checking")) {// 예
				account.setAccounttype("예금");
			} else if (account.getAccounttype().equals("saving")) {// 적
				account.setAccounttype("적금");
			} else if (account.getAccounttype().equals("loan")) {// 대출
				account.setAccounttype("대출");
			}

		}
		return SUCCESS;
	}

	public String depositForm() {
		System.out.println("depositForm");
		System.out.println("selected accountno" + backingname);
		String[] values = backingname.split(" ");
		System.out.println("Splited: " + values[0] + "  " + values[1]); // accountno,
																		// accounttype

		accountno = values[0];
		accounttype = values[1];
		return SUCCESS;
	}

	public String withdrawFormTest() {
		System.out.println("withdrawFormTest");
		System.out.println("selected accountno" + backingname);
		String[] values = backingname.split(" ");
		System.out.println("Splited: " + values[0] + "  " + values[1]); // accountno,
																		// accounttype

		accountno = values[0];
		accounttype = values[1];
		return SUCCESS;
	}

	public String withdrawForm() {
		System.out.println("withdrawForm");
		// System.out.println("selected accountno" +backingname);
		// String[] values= backingname.split(" ");
		// System.out.println("Splited: "+values[0]+ " "+values[1]);
		// //accountno, accounttype
		//
		// accountno = values[0];
		// accounttype= values[1];
		return SUCCESS;
	}

	// AccountLog acclog = new AccountLog(0, anoamo.get("custid"),
	// anoamo.get("accountno"),
	// "", "sysdate", "deposit", "", Integer.parseInt(anoamo.get("amount")),
	// balance);
	public String deposit() {
		System.out.println(amount + accountno);
		// 입금하기 DAO > Mapper > 결과
		Map<String, String> anoamo = new HashMap<>();
		custid = (String) session.get("loginId");
		anoamo.put("custid", custid);
		anoamo.put("amount", amount);
		anoamo.put("accountno", accountno);
		AccountDAO accdao = new AccountDAO();
		accdao.deposit(anoamo);
		showAccList();
		return SUCCESS;
	}

	public String withdraw() {
		System.out.println("withdraw Action");
		System.out.println("amount: " + amount);
		System.out.println("accountno :" + accountno);
		Map<String, String> anoamo = new HashMap<>();
		custid = (String) session.get("loginId");
		anoamo.put("custid", custid);
		anoamo.put("amount", amount);
		anoamo.put("accountno", accountno);
		AccountDAO accdao = new AccountDAO();
		int result = accdao.withdraw(anoamo);
		if (result == 0) {
			System.out.println("출금실패");
			session.put("withdrawResult", result);
		} else if (result == 1) {
			System.out.println("출금 성공");
		}
		showAccList();
		return SUCCESS;
	}

	public String transferFrom() {
		System.out.println("========transferFrom Action=========");
		System.out.println("selected accountno" + backingname);
		String[] values = backingname.split(" ");
		System.out.println("Splited: " + values[0] + "  " + values[1]); // accountno,//
																		// accounttype
		accountno = values[0];
		accounttype = values[1];
		session.put("myaccountno", accountno);
		return SUCCESS;
	}

	public String myAccountList() {
		custid = (String) session.get("loginId");
		AccountDAO accdao = new AccountDAO();
		acList = accdao.listAccount(custid);
		return SUCCESS;
	}

	// 선택된 계좌번호를 가지고 간다.
	public String transfer_pop1Action() {
		System.out.println("accountsel" + getAccountsel());
		accountno = (String) session.get("myaccountno");
		return SUCCESS;
	}

	public String transfer_pop2Action() {
		System.out.println("transfer_pop2Action");
		System.out.println(accountno);
		AccountDAO accdao = new AccountDAO();
		int result = accdao.searchAccount(accountno);
		if (result == 0) {
			System.out.println("없는 계좌");
			accountsel = "0";
		} else {
			System.out.println("적용 가능 계좌");
			accountsel = "1";
		}
		return SUCCESS;
	}

	public String pop2Submit() {
		System.out.println("============pop2Submit Action==============");
		accountno = (String) session.get("myaccountno");
		return SUCCESS;
	}

	// myaccountno, accountsel,balance 받아와서 내거에서는 빼고 받는 사람거에서는 더한다.
	// 만약 내 계좌에 돈이 balance 보다 적으면 안되도록
	public String transferAction() {
		System.out.println("============transferAction");
		System.out.println(accountno + "  " + accountsel + "  " + amount);
		AccountDAO accdao = new AccountDAO();
		Map<String, String> anoamo = new HashMap<>();
		anoamo.put("amount", amount);
		anoamo.put("accountno", accountno);
		int result = accdao.withdraw(anoamo);
		if (result == 0) {
			System.out.println("잔액이 부족하여 이체할 수 없습니다. ");
		} else if (result == 1) {
			Map<String, String> anoamo1 = new HashMap<>();
			anoamo1.put("amount", amount);
			anoamo1.put("accountno", accountsel);
			accdao.deposit(anoamo1);
			System.out.println("이체가 완료되었습니다.");
		}
		custid = (String) session.get("loginId");
		int bal = accdao.checkBalance(anoamo);
		AccountLog aclog = new AccountLog(0, custid, accountno, accountsel, "", "transfer", "",
				Integer.parseInt(amount), bal);
		System.out.println(aclog);
		accdao.accountLog(aclog);

		showAccList();
		return SUCCESS;

	}

	public String showAccList() {
		AccountDAO accdao = new AccountDAO();
		custid = (String) session.get("loginId");
		acList = accdao.listAccount(custid);
		for (Account account : acList) {
			if (account.getAccounttype().equals("checking")) {// 예금
				account.setAccounttype("예금");
			} else if (account.getAccounttype().equals("saving")) {// 적금
				account.setAccounttype("적금");
			} else if (account.getAccounttype().equals("loan")) {// 대출
				account.setAccounttype("대출");
			}

		}
		
		return SUCCESS;
	}
	//accountno 셋팅
	public String tradelist(){
		System.out.println("====================tradelist ==================");
		System.out.println("selected accountno" + backingname);
		String[] values = backingname.split(" ");
		System.out.println("Splited: " + values[0] + "  " + values[1]); 
		accountno = values[0];
		accounttype = values[1];
		session.put("myaccountno", accountno);
		return SUCCESS;
	}
	//dao에서 검색해서 리스트에 담아오기 
	public String showTradelist(){
		if(startPageGroup!=0){
			System.out.println("startPageGroup :"+ startPageGroup);
			return SUCCESS;
		}
		accountno = (String) session.get("myaccountno");
		System.out.println("============showTradelist==========");
		System.out.println(accountno +" "+ startdate+" "+enddate+" "+listcheck+" "+listcheck2);
		Map<String,String> info = new HashMap<>();
		logList = null;
		info.put("accountno", accountno);
		info.put("startdate", startdate);
		info.put("enddate", enddate);
		info.put("eventtype", listcheck);
		info.put("order", listcheck2);
		AccountDAO accdao = new AccountDAO();
		logList = accdao.searchAccountLog(info);
		for (AccountLog acclist : logList) {
			acclist.splitDateTime();
		}
		int totalRecordCount = logList.size();
		setPagenavi(new PageNavigator(3,4,1, totalRecordCount)); 
		currentGroup = getPagenavi().getCurrentGroup();
		startPageGroup = getPagenavi().getStartPageGroup();
		endPageGroup = getPagenavi().getEndPageGroup();
		setPageList(new ArrayList<>()); 
		int startRecord = getPagenavi().getStartRecord();
		for (int i = startRecord ; i < startRecord+5;  i++) {
			getPageList().add(logList.get(i));
		}
		
		return SUCCESS;
	}
	
	public void secondPagelist(){
		System.out.println("=====secondPagelist====================");
		
	}
	public String loanForm (){
		System.out.println("=====loanForm==========");
		System.out.println("selected accountno" + backingname);
		String[] values = backingname.split(" ");
		System.out.println("Splited: " + values[0] + "  " + values[1]); 
		accountno = values[0];
		accounttype = values[1];
		session.put("myaccountno", accountno);
		return SUCCESS;
	}
	
	public String loan_pop(){
		System.out.println("=========loan_pop====================");
		String custid = (String) session.get("loginId");
		System.out.println(custid);
		AccountDAO accdao = new AccountDAO();
		acList = accdao.listAccount(custid);
		return SUCCESS;
	}
	//amount 만큼의 돈을 양쪽에서 빼준다. 
	public String loanAction(){
		System.out.println("======laonAction=================");
		System.out.println(accountno+amount+accountsel);
		Map< String, String> anoamo = new HashMap<String, String>();
		custid = (String) session.get("loginId");
		anoamo.put("custid", custid);
		anoamo.put("amount", amount);
		anoamo.put("accountno", accountno);
		AccountDAO accdao = new AccountDAO();
		accdao.withdraw(anoamo);
		anoamo.replace("accountno", accountsel);
		accdao.withdraw(anoamo);
		setMessage(amount+"가 상환되었습니다.");
		return SUCCESS;
	}
	/*
	 * 대출허가 accountno으로 DB에서 조회해서 N > Y 
	 */
	public String loan_allow(){
		System.out.println("loan_allow=============================");
		AccountDAO accdao = new AccountDAO();
		System.out.println(accountno);
		accdao.loan_allow(accountno);
		acList=accdao.listAccount("admin");
		return SUCCESS;
	}
	/*
	 * accountno을 받아와서 지운다. 
	 */
	public String loan_decline(){
		System.out.println("loan_decline=================");
		System.out.println(accountno);
		return SUCCESS;
	}
	
	public int getCurrentGroup() {
		return currentGroup;
	}

	public void setCurrentGroup(int currentGroup) {
		this.currentGroup = currentGroup;
	}

	public int getStartPageGroup() {
		return startPageGroup;
	}

	public void setStartPageGroup(int startPageGroup) {
		this.startPageGroup = startPageGroup;
	}

	public int getEndPageGroup() {
		return endPageGroup;
	}

	public void setEndPageGroup(int endPageGroup) {
		this.endPageGroup = endPageGroup;
	}

	public void setLogList(List<AccountLog> logList) {
		this.logList = logList;
	}

	public List getLogList() {
		return logList;
	}


	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getListcheck() {
		return listcheck;
	}

	public void setListcheck(String listcheck) {
		this.listcheck = listcheck;
	}

	public String getListcheck2() {
		return listcheck2;
	}

	public void setListcheck2(String listcheck2) {
		this.listcheck2 = listcheck2;
	}

	public AccountAction() {
		super();
	}

	public String getAccountno() {
		return accountno;
	}

	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getAccounttype() {
		return accounttype;
	}

	public void setAccounttype(String accounttype) {
		this.accounttype = accounttype;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public double getInterest() {
		return interest;
	}

	public void setInterest(double interest) {
		this.interest = interest;
	}

	public String getStartdeposit() {
		return startdeposit;
	}

	public void setStartdeposit(String startdeposit) {
		this.startdeposit = startdeposit;
	}

	public String getEnddeposit() {
		return enddeposit;
	}

	public void setEnddeposit(String enddeposit) {
		this.enddeposit = enddeposit;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}



	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public List<Account> getAcList() {
		return acList;
	}

	public void setAcList(List<Account> acList) {
		this.acList = acList;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public String getBackingname() {
		return backingname;
	}

	public void setBackingname(String backingname) {
		this.backingname = backingname;
	}

	public String getAccountsel() {
		return accountsel;
	}

	public void setAccountsel(String accountsel) {
		this.accountsel = accountsel;
	}

	public List<AccountLog> getPageList() {
		return pageList;
	}

	public void setPageList(List<AccountLog> pageList) {
		this.pageList = pageList;
	}

	public PageNavigator getPagenavi() {
		return pagenavi;
	}

	public void setPagenavi(PageNavigator pagenavi) {
		this.pagenavi = pagenavi;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
