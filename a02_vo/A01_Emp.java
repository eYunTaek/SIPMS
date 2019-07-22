package springweb.a02_vo;

import java.util.Date;

public class A01_Emp {
	private int empno,wno,stage;
	private String ename,pass,civilno,phone,posi,winfo,submi,comple,fname;
	private double sal;
	private Date hiredate;
	private String regdate,pjdo,permi,position;
	//mno,empno,gno,content,sdte,revstatus
	private int mno;
	private int gno;
	private String title,content;
	private Date sdte;
	private String revstatus;
	private int msgCnt;
	private String stdte,eddte;
	private String sbmdte, pjtitle, allstage;
	private int pjno, tno;

	public int getMsgCnt() {
		return msgCnt;
	}
	public void setMsgCnt(int msgCnt) {
		this.msgCnt = msgCnt;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSdte() {
		return sdte;
	}
	public void setSdte(Date sdte) {
		this.sdte = sdte;
	}
	public String getRevstatus() {
		return revstatus;
	}
	public void setRevstatus(String revstatus) {
		this.revstatus = revstatus;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public int getStage() {
		return stage;
	}
	public void setStage(int stage) {
		this.stage = stage;
	}
	public String getWinfo() {
		return winfo;
	}
	public void setWinfo(String winfo) {
		this.winfo = winfo;
	}
	public String getSubmi() {
		return submi;
	}
	public void setSubmi(String submi) {
		this.submi = submi;
	}
	public String getComple() {
		return comple;
	}
	public void setComple(String comple) {
		this.comple = comple;
	}
	public String getStdte() {
		return stdte;
	}
	public void setStdte(String stdte) {
		this.stdte = stdte;
	}
	public String getEddte() {
		return eddte;
	}
	public void setEddte(String eddte) {
		this.eddte = eddte;
	}
	
	public A01_Emp(int wno, String fname) {
		super();
		this.wno = wno;
		this.fname = fname;
	}
	public A01_Emp() {
		super();
		// TODO Auto-generated constructor stub
	}
	public A01_Emp(int empno, String ename, String pass, String civilno, String phone, String posi, double sal,
			Date hiredate, String regdate, String pjdo, String permi) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.pass = pass;
		this.civilno = civilno;
		this.phone = phone;
		this.posi = posi;
		this.sal = sal;
		this.hiredate = hiredate;
		this.regdate = regdate;
		this.pjdo = pjdo;
		this.permi = permi;
	}
	
	
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getCivilno() {
		return civilno;
	}
	public void setCivilno(String civilno) {
		this.civilno = civilno;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPosi() {
		return posi;
	}
	public void setPosi(String posi) {
		this.posi = posi;
	}
	public double getSal() {
		return sal;
	}
	public void setSal(double sal) {
		this.sal = sal;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPjdo() {
		return pjdo;
	}
	public void setPjdo(String pjdo) {
		this.pjdo = pjdo;
	}
	public String getPermi() {
		return permi;
	}
	public void setPermi(String permi) {
		this.permi = permi;
	}
	public String getSbmdte() {
		return sbmdte;
	}
	public void setSbmdte(String sbmdte) {
		this.sbmdte = sbmdte;
	}
	public String getPjtitle() {
		return pjtitle;
	}
	public void setPjtitle(String pjtitle) {
		this.pjtitle = pjtitle;
	}
	public String getAllstage() {
		return allstage;
	}
	public void setAllstage(String allstage) {
		this.allstage = allstage;
	}
	public int getPjno() {
		return pjno;
	}
	public void setPjno(int pjno) {
		this.pjno = pjno;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	
	
}
