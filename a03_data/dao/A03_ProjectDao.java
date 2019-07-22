package springweb.a03_data.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import springweb.a02_vo.A03_Project;

@Repository
public interface A03_ProjectDao {

	public ArrayList<A03_Project> prjList();
	
	public void prjInsert(A03_Project ins);
	public void pjnoUpdate(A03_Project ins);
	
	public A03_Project prjDetail(int pjno);
	
	public void prjUpdate(A03_Project upt);
	
	public void prjDelete(int pjno);
	
	public ArrayList<A03_Project> manageCalPrjList();
	public ArrayList<A03_Project> indiCalPrjList(int empno);
	
	// 차트
	public ArrayList<A03_Project> chartData();
	// 팀매출통계
	public ArrayList<A03_Project> teamStats();
}
