package springweb.a02_vo;

public class A06_Search {

	/* 사원 검색 */
	String empno;
	String ename;
	/* 프로젝트 진행팀 검색 */
	String tno;
	String pjtitle;
	private int count;
	// 2. 1페이지당 출력할 데이터 건수
	private int pageSize;
	// 3. 총 페이지 수
	private int pageCount;
	// 4. 현재 클릭한 페이지 번호
	private int curPage;
	// 5. 시작 번호
	private int start;
	// 6. 머자막 번호
	private int end;
	// # block 처리 속성
	// 1. block의 크기
	private int blockSize;
	// 2. block의 시작 번호
	private int startBlock;
	// 3. block의 마지막 번호
	private int endBlock;
	// 4. 시작 페이지 번호
	private int startPage;
	// 5. 마지막 페이지 번호
	private int endPage;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getPjtitle() {
		return pjtitle;
	}
	public void setPjtitle(String pjtitle) {
		this.pjtitle = pjtitle;
	}
	
}
