package springweb.a03_data.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_vo.A03_Project;
import springweb.a03_data.dao.A03_ProjectDao;

@Service
public class A03_ProjectService {

	@Autowired(required=false)
	private A03_ProjectDao dao;
	
	public ArrayList<A03_Project> prjList() {
		return dao.prjList();
	}
	
	public void prjInsert(A03_Project ins) {
		dao.prjInsert(ins);
	}
	public void pjnoUpdate(A03_Project ins) {
		dao.pjnoUpdate(ins);
	}
	
	public A03_Project prjDetail(int pjno) {
		return dao.prjDetail(pjno);
	}
	
	public void prjUpdate(A03_Project upt) {
		dao.prjUpdate(upt);
	}
	
	public void prjDelete(int pjno) {
		dao.prjDelete(pjno);
	}

	public ArrayList<A03_Project> manageCalPrjList(){
		ArrayList<A03_Project> plist = new ArrayList<A03_Project>();
		A03_Project pj = null;
		String[] Colors = {"#fc9209","#4ea852","#e73d39","#9932b1","#1bbfd3","#4e73df","#feb0c9","#f6d8c1","#3dff92","#ff7a85"};
		String textColor = "white";
		for(int i=0;i<dao.manageCalPrjList().size();i++) {
			pj = new A03_Project(dao.manageCalPrjList().get(i).getTitle(),dao.manageCalPrjList().get(i).getStdte(),dao.manageCalPrjList().get(i).getEddte(),Colors[i],textColor);
			plist.add(pj);
		}
		return plist;
	}
	public ArrayList<A03_Project> indiCalPrjList(int empno){
		ArrayList<A03_Project> plist = new ArrayList<A03_Project>();
		dao.indiCalPrjList(empno);
		A03_Project pj = null;
		String[] Colors = {"#fc9209","#4ea852","#e73d39","#9932b1","#1bbfd3","#4e73df","#feb0c9","#f6d8c1","#3dff92","#ff7a85"};
		String textColor = "white";
		for(int i=0;i<dao.indiCalPrjList(empno).size();i++) {
			pj = new A03_Project(dao.indiCalPrjList(empno).get(i).getTitle(),dao.indiCalPrjList(empno).get(i).getStdte(),dao.indiCalPrjList(empno).get(i).getEddte(),Colors[i],textColor);
			plist.add(pj);
		}
		return plist;
	}
	
	//차트
	public ArrayList<A03_Project> chartData() {
		ArrayList<A03_Project> cdlist = new ArrayList<A03_Project>();
		A03_Project cd = null;
		for(int i=0; i<dao.chartData().size(); i++) {
			cd = new A03_Project(dao.chartData().get(i).getLabels(), dao.chartData().get(i).getData());
			cdlist.add(cd);
		}
		return cdlist;
	}
	// 팀별 매출통계
	public ArrayList<A03_Project> teamStats(){
		ArrayList<A03_Project> dlist = new ArrayList<A03_Project>();
		A03_Project d = null;
		String[] backColors = {"#fc9209","#4ea852","#e73d39","#9932b1","#1bbfd3","#4e73df","#feb0c9","#f6d8c1","#3dff92","#ff7a85"};
		String[] hoverBackColors = {"#dd9209","#4e9752","#cd3d39","#7132b1","#1ba3d3","#2e59d9","#fe8dc9","#e4d8c1","#3de892","#ff6385"};
		for(int i=0;i<dao.teamStats().size();i++) {
			d = new A03_Project(dao.teamStats().get(i).getLabels(),dao.teamStats().get(i).getData(),backColors[i],hoverBackColors[i]);
			dlist.add(d);
		}
		return dlist;
	}
}
