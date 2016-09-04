package vo;

public class AccountLog {
private int logid;
private String custid;
private String accountno;
private String transferno;
private String eventdate;
private String eventtype;
private String eventrecord;
private int amount;
private int balance;
private String eventtime;
public AccountLog() {
	super();
}
public AccountLog(int logid, String custid, String accountno, String transferno, String eventdate, String eventtype,
		String eventrecord, int amount, int balance) {
	super();
	this.logid = logid;
	this.custid = custid;
	this.accountno = accountno;
	this.transferno = transferno;
	this.eventdate = eventdate;
	this.eventtype = eventtype;
	this.eventrecord = eventrecord;
	this.amount = amount;
	this.balance = balance;
}

public void splitDateTime(){
	String[] values = eventdate.split(" ");
	eventdate = values[0];
	eventtime = values[1];
}

@Override
public String toString() {
	return "AccountLog [logid=" + logid + ", custid=" + custid + ", accountno=" + accountno + ", transferno="
			+ transferno + ", eventdate=" + eventdate + ", eventtype=" + eventtype + ", eventrecord=" + eventrecord
			+ ", amount=" + amount + "]";
}
public int getLogid() {
	return logid;
}
public void setLogid(int logid) {
	this.logid = logid;
}
public String getCustid() {
	return custid;
}
public void setCustid(String custid) {
	this.custid = custid;
}
public String getAccountno() {
	return accountno;
}
public void setAccountno(String accountno) {
	this.accountno = accountno;
}
public String getTransferno() {
	return transferno;
}
public void setTransferno(String transferno) {
	this.transferno = transferno;
}
public String getEventdate() {
	return eventdate;
}
public void setEventdate(String eventdate) {
	this.eventdate = eventdate;
}
public String getEventtype() {
	return eventtype;
}
public void setEventtype(String eventtype) {
	this.eventtype = eventtype;
}
public String getEventrecord() {
	return eventrecord;
}
public void setEventrecord(String eventrecord) {
	this.eventrecord = eventrecord;
}
public int getAmount() {
	return amount;
}
public void setAmount(int amount) {
	this.amount = amount;
}
public int getBalance() {
	return balance;
}
public void setBalance(int balance) {
	this.balance = balance;
}
public String getEventtime() {
	return eventtime;
}
public void setEventtime(String eventtime) {
	this.eventtime = eventtime;
}
}
