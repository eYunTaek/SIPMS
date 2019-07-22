package springweb.a02_vo;

// springweb.a02_vo.A02_Team
public class A02_Team {
	
	private int tno,empno,pjno,lno,sales,wno,indistage,allstage,cost,stage;
	private String position,pjtitle,comname,area,winfo,submi,comple,ename,stdte,eddte;
	private String fname,sbmdte;
	private int showPercent,cnt;
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
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
	public int getShowPercent() {
		return showPercent;
	}
	public void setShowPercent(int showPercent) {
		this.showPercent = showPercent;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getSbmdte() {
		return sbmdte;
	}
	public void setSbmdte(String sbmdte) {
		this.sbmdte = sbmdte;
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
	public int getStage() {
		return stage;
	}
	public void setStage(int stage) {
		this.stage = stage;
	}
	public A02_Team() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getAllstage() {
		return allstage;
	}
	public void setAllstage(int allstage) {
		this.allstage = allstage;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getComname() {
		return comname;
	}
	public void setComname(String comname) {
		this.comname = comname;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public A02_Team(int tno, int pjno, int lno, int sales) {
		super();
		this.tno = tno;
		this.pjno = pjno;
		this.lno = lno;
		this.sales = sales;
	}
	public A02_Team(int tno, int empno, int wno, int indistage, String position) {
		super();
		this.tno = tno;
		this.empno = empno;
		this.wno = wno;
		this.indistage = indistage;
		this.position = position;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getPjno() {
		return pjno;
	}
	public void setPjno(int pjno) {
		this.pjno = pjno;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public int getIndistage() {
		return indistage;
	}
	public void setIndistage(int indistage) {
		this.indistage = indistage;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getWinfo() {
		return winfo;
	}
	public void setWinfo(String winfo) {
		this.winfo = winfo;
	}
	public String getPjtitle() {
		return pjtitle;
	}
	public void setPjtitle(String pjtitle) {
		this.pjtitle = pjtitle;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	
} 
