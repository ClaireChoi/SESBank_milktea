package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.AccountDAO;
import dao.CustomerDAO;
import vo.Account;
import vo.Customer;

public class CustomerAction extends ActionSupport implements SessionAware{
	private Customer customer;
	private String custid;
	private String password;
	private String email;
	private String name;
	private String division;
	private String passwordcheck;
	private String idno;
	private String address;
	private boolean duplicated;
	private Map<String, Object> session ;
	private CustomerDAO cusdao;
	private boolean admin =true;
	private List<Account> acList;
	private Account account;
	private String message ="";

	public boolean getAdmin() {
		return admin;
	}

	public String execute() {
		System.out.println("execute method 실행");
		return SUCCESS;
	}

	public CustomerAction() {
		super();
	}

	public String insertCustomer() {
		System.out.println("insertCustomer 실행");
		customer = new Customer(custid, password, email, name, division, idno, address);
		System.out.println(customer);
		cusdao = new CustomerDAO();
		cusdao.insertCustomer(customer);

		return SUCCESS;
	}

	public String idCheck() {
		// db에서 있는지 확인
		System.out.println("custid:  " + custid);
		System.out.println("idCheck 메소드");

		cusdao = new CustomerDAO();
		customer = cusdao.selectCustomer(custid);
		System.out.println(customer);

		return SUCCESS;
	}


	public String login() {
		System.out.println("login action 실행");
		cusdao = new CustomerDAO();
		AccountDAO accdao = new AccountDAO();
	if(custid.equals("admin")&&password.equals("admin")){
			System.out.println("admin login");
			session.put("admin", admin);
			acList=accdao.listAccount(custid);
			return "admin";
		}
		customer = cusdao.selectCustomer(custid);
		if(customer==null){ 
			 setMessage("아이디와 비밀번호가 잘못되었습니다.");
			return "error";}
		System.out.println("=========="+customer+"==="+customer.getPassword());
		if(customer.getPassword().equals(password)){
			System.out.println("login성공");
			//회원이 보유한 계좌정보 가져오기 
			acList= accdao.listAccount(custid);
			for (Account account : acList) {
				if(account.getAccounttype().equals("checking")){//예
					account.setAccounttype("예금");
				}else if(account.getAccounttype().equals("saving")){//적
					account.setAccounttype("적금");
				}else if(account.getAccounttype().equals("loan")){//대출
					account.setAccounttype("대출");
				}
				
			}
			System.out.println("acList :"+acList);
			session.put("loginId", customer.getCustid());
			session.put("loginpw", customer.getPassword());
			session.put("idno", customer.getIdno());
			session.put("customer", customer);
			System.out.println(customer.getCustid());
		}else{
			return "login";
		}
	
		//System.out.println(customer);
		return SUCCESS;
	}

	public String logout() {
		System.out.println("logout action");
		session.clear();
		return SUCCESS;
	}

	public String selectCustomer() {
		System.out.println("selectCustomer method");
		idno=(String)session.get("idno");
		custid=(String) session.get("loginId");
		return SUCCESS;
	}

	public String updateCustomer() {
		System.out.println("updateCustomerAction ");
		custid=(String)session.get("loginId");
		idno=(String)session.get("idno");
		customer = new Customer(custid, password, email, name, division, idno, address);
		System.out.println(customer);
		cusdao = new CustomerDAO();
		int cnt = cusdao.updateCustomer(customer);
		if(cnt>0) System.out.println("update 성공");
		return SUCCESS;
	}
	// setter&getter
	/*
	 * name and email 가져와서 DB에 일치하는 데이터가 있으면 id 를 가져와서 보낸다. 
	 */
	public String findId(){
		System.out.println("findId method");
		System.out.println(name+email);
		Customer c = new Customer();
		c.setName(name);
		c.setEmail(email);
		cusdao = new CustomerDAO();
		customer = cusdao.find(c);
		System.out.println(customer);
		return SUCCESS;
	}
	public CustomerDAO getDao() {
		return null;
	}

	public void setDao(CustomerDAO cusdao) {
		this.cusdao = cusdao;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isDuplicated() {
		return duplicated;
	}

	public void setDuplicated(boolean duplicated) {
		this.duplicated = duplicated;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	public String getPasswordcheck() {
		return passwordcheck;
	}

	public void setPasswordcheck(String passwordcheck) {
		this.passwordcheck = passwordcheck;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdno() {
		return idno;
	}

	public void setIdno(String idno) {
		this.idno = idno;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public CustomerDAO getCusdao() {
		return cusdao;
	}

	public void setCusdao(CustomerDAO cusdao) {
		this.cusdao = cusdao;
	}
	public CustomerAction(Customer customer, String custid, String password, boolean duplicated,
			Map<String, Object> session) {
		super();
		this.customer = customer;
		this.custid = custid;
		this.password = password;
		this.duplicated = duplicated;
		this.session = session;
	}

	public List getAcList() {
		return acList;
	}

	public void setAcList(List acList) {
		this.acList = acList;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
