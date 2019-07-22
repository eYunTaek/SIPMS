package springweb.a03_data.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_vo.A01_Emp;
import springweb.a02_vo.A05_Message;
import springweb.a02_vo.A06_Search;
import springweb.a03_data.dao.A01_EmpDao;

@Service
public class A01_EmpService {
	@Autowired(required=false)
	private A01_EmpDao dao;
	public A01_Emp login(A01_Emp emp) {
		return dao.login(emp);
	}
	
	// 사원 목록(페이징)
	public ArrayList<A01_Emp> empList(A06_Search sch) {
		sch.setCount(dao.empCnt(sch));
		// 2. 화면에 한번에 보여줄 데이터 건수
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		System.out.println("총 데이터 건 수 : "+sch.getCount());
		// 3. 총 페이지 수
		System.out.println("총 페이지 수 : "+(int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		// 4. 현재 클릭한 페이지 정보
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		System.out.println("현재 클릭한 페이지 번호: "+sch.getCurPage());
		// 현재 페이지 번호,
		// 페이지 당 보일 데이터 건수
		// 화면에 나타날 데이터 rownum(start, end)
		// 마지막 번호 ? sch.getCurPage()*sch.getCount()
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		System.out.println("시작 번호 : "+sch.getStart());
		System.out.println("마지막 번호 : "+sch.getEnd());
		// 페이지 block 처리
		// 1) vo 속성 설정(화면호출 필요) : blockSize(한번에 보일 block의 크기)
		// 		startBlock : 시작 번호, endBlock 마지막 block번호
		// 2) 블럭 시작 번호와 마지막 번호를 저장 처리
		// 3) view단에서 처리
		//		previous [6][7][8][9][10] next
		// # 속성값 설정
		// 1. 초기 block size(합넌에 보일 block 크기)설정
		sch.setBlockSize(5);
		// 2. blocknum(블럭의 번호를 통해서 시작/마지막 번호를 가져오게 한다)
		//		블럭의 번호는 현재 페이지/블럭의 크기
		// previous가 나타날 조건 : 시작 블럭번호가 블럭의 크기보다 클 때
		// next가 나타날 조건 : 마지막 블럭번호가 총 페이지 수 보다 작을 때
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		// 마지막 번호는 블럭의 번호*블럭의 크기
		// 단, 마지막 블럭번호는 전체페이지 크기보다 작아야 한다
		int endBlock = blocknum*sch.getBlockSize();
		// 마지막 블럭번호는 예외로 전체 페이지 수 보다 클 때 
		sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		System.out.println("시작 block번호 : "+sch.getStartBlock());
		System.out.println("마지막 block번호 : "+sch.getEndBlock());
		// 시작페이지 ,마지막페이지 등록
		sch.setStartPage(1);
		sch.setEndPage(sch.getPageCount());
		return dao.empList(sch);
	}
	// 사원 목록(메세지)
	public ArrayList<A01_Emp> msgEmpList(A01_Emp sch){
		return dao.msgEmpList(sch);
	}
	// 사원 등록
	public void insertEmp(A01_Emp ins) {
		dao.insertEmp(ins);
	}
	// 사원정보 조회
	public A01_Emp getEmp(int empno) {
		return dao.getEmp(empno);
	}
	// 사원정보 수정
	public void updateEmp(A01_Emp upt) {
		dao.updateEmp(upt);
	}
	public void uptLno(A01_Emp upt) {
		dao.uptLno(upt);
	}
	public void uptPosi(A01_Emp upt) {
		dao.uptPosi(upt);
	}
	// 사원 삭제
	public void deleteEmp(int empno) {
		dao.deleteEmp(empno);
	}
	// 사원 (나의 업무 보기)
	public ArrayList<A01_Emp> getmywork(int empno) {
		return dao.getmywork(empno);
	}
	// 사원 (나의 업무 종료일만 뽑기, D-day용)
	public A01_Emp getmywork2(int empno) {
		return dao.getmywork2(empno);
	}
	// 사원 (나의 업무 수정)Y
	public void updatemywork(int wno) {
		dao.updatemywork(wno);
	}
	// 사원 (나의 업무 수정)N
	public void updatemywork2(int wno) {
		dao.updatemywork2(wno);
	}
	// 내 정보 보기
	public A01_Emp empinfo(int empno) {
		return dao.empinfo(empno);
	}
	public ArrayList<A01_Emp> teamMemberList(A01_Emp emp){
		return dao.teamMemberList(emp);
	}
	
	// 팀에 추가할 사원 목록
	public ArrayList<A01_Emp> addMemList() {
		return dao.addMemList();
	}
	// 사원 개인 업무 파일 업로드
	public void uploadFile(A01_Emp file) {
		 dao.uploadFile(file);
		}
	// 사원 개입 업무 파일 삭제
	public void deleteFile(int wno) {
		dao.deleteFile(wno);
	}
	// 메세지 리스트 조회
	public ArrayList<A01_Emp> messageList(A05_Message msg){
		// 1. 데이터 총 건수
		msg.setCount(dao.totCnt(msg));
		// 2. 화면에 한번에 보여줄 데이터 건수
		if(msg.getPageSize()==0) {
			msg.setPageSize(5);
		}
		System.out.println("총 데이터 건 수 : "+msg.getCount());
		// 3. 총 페이지 수
		System.out.println("총 페이지 수 : "+(int)Math.ceil(msg.getCount()/(double)msg.getPageSize()));
		msg.setPageCount((int)Math.ceil(msg.getCount()/(double)msg.getPageSize()));
		// 4. 현재 클릭한 페이지 정보
		if(msg.getCurPage()==0) {
			msg.setCurPage(1);
		}
		System.out.println("현재 클릭한 페이지 번호: "+msg.getCurPage());
		// 현재 페이지 번호,
		// 페이지 당 보일 데이터 건수
		// 화면에 나타날 데이터 rownum(start, end)
		// 마지막 번호 ? sch.getCurPage()*sch.getCount()
		msg.setStart((msg.getCurPage()-1)*msg.getPageSize()+1);
		msg.setEnd(msg.getCurPage()*msg.getPageSize());
		System.out.println("시작 번호 : "+msg.getStart());
		System.out.println("마지막 번호 : "+msg.getEnd());
		// 페이지 block 처리
		// 1) vo 속성 설정(화면호출 필요) : blockSize(한번에 보일 block의 크기)
		// 		startBlock : 시작 번호, endBlock 마지막 block번호
		// 2) 블럭 시작 번호와 마지막 번호를 저장 처리
		// 3) view단에서 처리
		//		previous [6][7][8][9][10] next
		// # 속성값 설정
		// 1. 초기 block size(합넌에 보일 block 크기)설정
		msg.setBlockSize(5);
		// 2. blocknum(블럭의 번호를 통해서 시작/마지막 번호를 가져오게 한다)
		//		블럭의 번호는 현재 페이지/블럭의 크기
		// previous가 나타날 조건 : 시작 블럭번호가 블럭의 크기보다 클 때
		// next가 나타날 조건 : 마지막 블럭번호가 총 페이지 수 보다 작을 때
		int blocknum = (int)Math.ceil(msg.getCurPage()/(double)msg.getBlockSize());
		// 마지막 번호는 블럭의 번호*블럭의 크기
		// 단, 마지막 블럭번호는 전체페이지 크기보다 작아야 한다
		int endBlock = blocknum*msg.getBlockSize();
		// 마지막 블럭번호는 예외로 전체 페이지 수 보다 클 때 
		msg.setEndBlock(endBlock>msg.getPageCount()?msg.getPageCount():endBlock);
		msg.setStartBlock((blocknum-1)*msg.getBlockSize()+1);
		System.out.println("시작 block번호 : "+msg.getStartBlock());
		System.out.println("마지막 block번호 : "+msg.getEndBlock());
		// 시작페이지 ,마지막페이지 등록
		msg.setStartPage(1);
		msg.setEndPage(msg.getPageCount());
		return dao.messageList(msg);
	}
	// 메세지 내용 조회
	public A01_Emp messageDetail(int mno) {
		dao.messageStatus(mno);
		return dao.messageDetail(mno);
	}
	// 안읽은 메세지 카운트
	public int messageCount(int empno) {
		return dao.messageCount(empno);
	}
	// 메세지 보내기
	public void messageSend(A01_Emp snd) {
		dao.messageSend(snd);
	}
	// 메세지 삭제
	public void messageDelete(int mno) {
		dao.messageDelete(mno);
	}
	
	// (관리자) 프로젝트 정보
	public A01_Emp prjInfo(int tno) {
		return dao.prjInfo(tno);
	}
	// 팀장 이름 뽑아보기
	public A01_Emp getLeaderName(int pjno) {
		return dao.getLeaderName(pjno);
	}
}
