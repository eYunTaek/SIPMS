package springweb.a03_data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import springweb.a02_vo.A01_Emp;
import springweb.a02_vo.A02_Team;
import springweb.a02_vo.A06_Search;

@Repository
public interface A02_TeamDao {
	public ArrayList<A01_Emp> teamMemberList (A01_Emp emp);
	public ArrayList<A02_Team> getTeam(int empno);
	public A02_Team getPrj(int empno);
	public A02_Team teamWorkGrant(int empno);
	public A02_Team winfo(int empno);
	public void workGrant(A02_Team work);
	public void teamDetailupt(A02_Team upt);
	public void workDel(int wno); // 업무 삭제
	public void workDel2(int wno);
	public A02_Team getWork(int wno); // 업무 정보
	public void workUpt(A02_Team upt);
	
	// 팀 목록 조회
	public ArrayList<A02_Team> teamList(A06_Search sch);
	// 팀 상세
	public ArrayList<A02_Team> teamDetail(int tno);
	// 팀이 가지고있는 프젝 정보
	public A02_Team tprj(int tno);
	// 프로젝트 정보
	public A02_Team prjInfo(int tno);
	// 팀 추가
	public void addMem(A02_Team addm);
	// 프로젝트 여부 수정
	public void uptPjdo(int empno);
	// 파일 정보 조회
	public A02_Team fileManage(int wno);
	// 업무 정보
	public ArrayList<A02_Team> showWork(int empno);
	// 프로젝트진행률(%처리)
	public A02_Team showPercent(int pjno);
	
	public void crtTeam(int tno);
	public ArrayList<A02_Team> tlist();
	public void delPrj(int tno);
	public void delTeam(int tno);
	
}
