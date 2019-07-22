package springweb.a03_data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import springweb.a02_vo.A01_Emp;
import springweb.a02_vo.A05_Message;
import springweb.a02_vo.A06_Search;

@Repository
public interface A01_EmpDao {
	public A01_Emp login(A01_Emp emp);
	
	// 사원 수
	public int empCnt(A06_Search sch); 
	// 사원 목록(페이징)
	public ArrayList<A01_Emp> empList(A06_Search sch);
	// 사원 목록(메세지)
	public ArrayList<A01_Emp> msgEmpList(A01_Emp sch);
	// 사원 등록
	public void insertEmp(A01_Emp ins);
	// 사원정보 조회
	public A01_Emp getEmp(int empno);
	// 사원정보 수정
	public void updateEmp(A01_Emp upt);
	public void uptLno(A01_Emp upt);
	public void uptPosi(A01_Emp upt);
	// 사원 삭제
	public void deleteEmp(int empno);
	// 사원 (나의 업무 종료일만 뽑기, D-day용)
	public A01_Emp getmywork2(int empno);
	// 사원 (나의 업무 보기)
	public ArrayList<A01_Emp> getmywork(int empno);
	// 사원 (나의 업무 수정)Y
	public void updatemywork(int wno);
	// 사원 (나의 업무 수정)N
	public void updatemywork2(int wno);
	// 내정보 보기
	public A01_Emp empinfo(int empno);
	// 팀원 목록 보기 - 팀장
	public ArrayList<A01_Emp> teamMemberList (A01_Emp emp);
	// 팀에 추가할 멤버 목록
	public ArrayList<A01_Emp> addMemList();
	// 사원 개인 업무 파일 업로드
	public void uploadFile(A01_Emp file);
	// 사원 개인 업무 파일 삭제
	public void deleteFile(int wno);
	public int totCnt(A05_Message msg); // 메세지 카운트
	// 메세지 리스트 조회
	public ArrayList<A01_Emp> messageList(A05_Message msg);
	// 메세지 내용 조회
	public A01_Emp messageDetail(int mno);
	// 안읽은 메세지 카운트
	public int messageCount(int empno);
	// 메세지 수신 여부 업데이트
	public void messageStatus(int mno);
	// 메세지 보내기
	public void messageSend(A01_Emp snd);
	// 메세지 삭제
	public void messageDelete(int mno);
	// (관리자) 프로젝트 정보
	public A01_Emp prjInfo(int tno);
	// 팀장 이름 뽑아보기
	public A01_Emp getLeaderName(int pjno);
}