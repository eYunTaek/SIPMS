package springweb.a03_data.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_vo.A01_Emp;
import springweb.a02_vo.A02_Team;
import springweb.a02_vo.A06_Search;
import springweb.a03_data.dao.A02_TeamDao;

@Service
public class A02_TeamService {
	@Autowired(required=false)
	private A02_TeamDao dao;
	public ArrayList<A01_Emp> teamMemberList (A01_Emp emp){
		return dao.teamMemberList(emp);
	}
	public ArrayList<A02_Team> getTeam(int empno) {
		return dao.getTeam(empno);
	}
	public A02_Team getPrj(int empno) {
		return dao.getPrj(empno);
	}
	public A02_Team teamWorkGrant(int empno) {
	
		return dao.teamWorkGrant(empno);
	}
	public A02_Team winfo(int empno) {
		return dao.winfo(empno);
	}
	public void workGrant(A02_Team work) {
		dao.workGrant(work);
	}
	public void teamDetailupt(A02_Team upt) {
		dao.teamDetailupt(upt);
	}
	public void workDel(int wno) { // 업무 삭제
		dao.workDel2(wno);
		dao.workDel(wno);
	}
	public void workUpt(A02_Team upt) { // 팀원 업무 수정
		dao.workUpt(upt);
	}
	public A02_Team getWork(int wno) {
		return dao.getWork(wno);
	}
	// 팀 목록 조회
	public ArrayList<A02_Team> teamList(A06_Search sch) {
		return dao.teamList(sch);
	}
	// 팀 상세
	public ArrayList<A02_Team> teamDetail(int tno) {
		return dao.teamDetail(tno);
	}
	// 프로젝트 정보
	public A02_Team prjInfo(int tno) {
		return dao.prjInfo(tno);
	}
	// 팀원 추가
	public void addMem(A02_Team addm) {
		dao.addMem(addm);
	}
	// 팀이 가지고있는 프젝 정보
	public A02_Team tprj(int tno) {
		return dao.tprj(tno);
	}
	// 프로젝트 여부 수정
	public void uptPjdo(int empno) {
		dao.uptPjdo(empno);
	}
	// 파일 정보 조회
	public A02_Team fileManage(int wno) {
		return dao.fileManage(wno);
	}
	// 업무 정보
	public ArrayList<A02_Team> showWork(int empno) {
		return dao.showWork(empno);
	}
	// 프로젝트진행률(%처리)
	public A02_Team showPercent(int pjno) {
		return dao.showPercent(pjno);
	}
	
	public void crtTeam(int tno) {
		dao.crtTeam(tno);
	}
	public ArrayList<A02_Team> tlist() {
		return dao.tlist();
	}
	public void delPrj(int tno) {
		dao.delPrj(tno);
	}
	public void delTeam(int tno) {
		dao.delTeam(tno);
	}
	
}
