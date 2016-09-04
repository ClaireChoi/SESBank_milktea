package vo;

public class Customer {
private String custid;
private String password;
private String email;
private String name;
private String idno;
private String division;
private String address;
public Customer(String custid, String password, String email, String name, String division ,String idno,
		String address) {
	super();
	this.custid = custid;
	this.password = password;
	this.email = email;
	this.name = name;
	this.idno = idno;
	this.division = division;
	this.address = address;
}
public Customer() {
	// TODO Auto-generated constructor stub
}

public String getCustid() {
	return custid;
}
@Override
public String toString() {
	return "Customer [custid=" + custid + ", password=" + password + ", email=" + email + ", name=" + name + ", idno="
			+ idno + ", division=" + division + ", address=" + address + "]";
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
}
