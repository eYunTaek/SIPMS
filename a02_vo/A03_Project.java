package springweb.a02_vo;

public class A03_Project {
	
	private int pjno;
	private int tno;
	private String pjtitle;
	private String comname;
	private String area;
	private String stdte;
	private String eddte;
	private int cost;
	private int allstage;
	private String title;
	private String start,end;
	private String labels;
	private int data;
	private String backColors;
	private String hoverBackColors;
	private String color;
	private String textColor;
	private int stage;
	private String comple;
	
	public A03_Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	public A03_Project(int pjno, int tno, String pjtitle, String comname, String area, String stdte, String eddte,
			int cost, int allstage, int stage, String comple) {
		super();
		this.pjno = pjno;
		this.tno = tno;
		this.pjtitle = pjtitle;
		this.comname = comname;
		this.area = area;
		this.stdte = stdte;
		this.eddte = eddte;
		this.cost = cost;
		this.allstage = allstage;
		this.stage = stage;
		this.comple = comple;
	}
	public A03_Project(String title, String start, String end) {
		super();
		this.title = title;
		this.start = start;
		this.end = end;
	}
	public A03_Project(String labels, int data) {
		super();
		this.labels = labels;
		this.data = data;
	}
	
	public A03_Project(String labels, int data, String backColors, String hoverBackColors) {
		super();
		this.labels = labels;
		this.data = data;
		this.backColors = backColors;
		this.hoverBackColors = hoverBackColors;
	}
	
	public A03_Project(String title, String start, String end, String color, String textColor) {
		super();
		this.title = title;
		this.start = start;
		this.end = end;
		this.color = color;
		this.textColor = textColor;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
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
	public String getPjtitle() {
		return pjtitle;
	}
	public void setPjtitle(String pjtitle) {
		this.pjtitle = pjtitle;
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
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getAllstage() {
		return allstage;
	}
	public void setAllstage(int allstage) {
		this.allstage = allstage;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getLabels() {
		return labels;
	}
	public void setLabels(String labels) {
		this.labels = labels;
	}
	public int getData() {
		return data;
	}
	public void setData(int data) {
		this.data = data;
	}
	public String getBackColors() {
		return backColors;
	}
	public void setBackColors(String backColors) {
		this.backColors = backColors;
	}
	public String getHoverBackColors() {
		return hoverBackColors;
	}
	public void setHoverBackColors(String hoverBackColors) {
		this.hoverBackColors = hoverBackColors;
	}
	public int getStage() {
		return stage;
	}
	public void setStage(int stage) {
		this.stage = stage;
	}
	public String getComple() {
		return comple;
	}
	public void setComple(String comple) {
		this.comple = comple;
	}
	
}
