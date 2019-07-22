package springweb.a03_data.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.a02_vo.A01_Emp;
import springweb.a02_vo.A02_Team;
import springweb.a02_vo.A06_Search;
import springweb.a03_data.service.A01_EmpService;
import springweb.a03_data.service.A02_TeamService;
@Controller
@RequestMapping("/team.do")
public class A02_TeamCtrl {
	@Autowired(required=false)
	private A02_TeamService service;
	@Autowired(required=false)
	private A01_EmpService service2;
	@RequestMapping(params = "method=teamMember") // 팀원 리스트 보여주기 - 팀장
	public String teamMember(HttpServletRequest request, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("팀장")) {
				System.out.println("사원번호 :"+mem.getEmpno() );
				page = "teamMember";
				d.addAttribute("tmlist",service.teamMemberList(mem));
			}
		}
		return "a01_start\\"+page;
	}
	// 나의 팀 프로젝트 보기(사원)
	@RequestMapping(params = "method=empPrj")
	public String getTeam(HttpServletRequest request, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("사원")) {
				System.out.println("사원번호 :"+mem.getEmpno() );
				page = "emp_prj";
				d.addAttribute("myprj",service.getPrj(mem.getEmpno()));
				d.addAttribute("showPercent",service.showPercent(mem.getEmpno()));
			}
		}
		return "a01_start\\"+page;
	}
	
	@RequestMapping(params = "method=teamWorkGrant") // - 팀원 업무 부여(폼) - 팀장
	public String teamWorkGrant(HttpServletRequest request, @RequestParam("empno") int empno, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		System.out.println("사원번호 :"+empno );
		if(mem != null) {
			if(mem.getPermi().equals("팀장")) {
				page = "teamWorkGrant";
				d.addAttribute("work", service.teamWorkGrant(empno));
			}
		}
		return "a01_start\\"+page;
	}
	@RequestMapping(params = "method=workGrant") // - 팀원 업무 부여
	public String workGrant(A02_Team work) {
		System.out.println("사원번호 :"+work.getEmpno() );
		service.workGrant(work);
		service.teamDetailupt(work);
		return "forward:/team.do?method=teamWorkGrant";
	}
	@RequestMapping(params = "method=workList") // 팀원 업무 리스트 조회
	public String workList(HttpServletRequest request,@RequestParam("empno") int empno, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("팀장")) {
				System.out.println("사원번호 :"+mem.getEmpno() );
				page = "workList";
				d.addAttribute("work", service.teamWorkGrant(empno));
				d.addAttribute("wlist", service.getTeam(empno));
			}
		}
		return "a01_start\\"+page;
	}
	@RequestMapping(params = "method=fileManage") // 업무 파일 조회
	public String fileManage(HttpServletRequest request,@RequestParam("wno") int wno, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("팀장")) {
				System.out.println("사원번호 :"+mem.getEmpno() );
				page = "teamFileManage";
				d.addAttribute("file", service.fileManage(wno));
			}
		}
		return "a01_start\\"+page;
	}
	@RequestMapping(params = "method=workDel") // 업무 삭제
	public String workDel(@RequestParam("wno") int wno) {
		service2.deleteFile(wno);
		String fileName = "C:\\z01_web\\workspace\\project04\\WebContent\\i01_upload\\"+service.getWork(wno).getFname();
		//System.out.println(fileName);
		File file = new File(fileName);
		file.delete();
		service.workDel(wno);
		return "forward:/team.do?method=workList";
	}
	@RequestMapping(params="method=workUpt") // 팀원 업무 수정
	public String workUpt(A02_Team upt) {
		System.out.println("업무번호 : "+upt.getWno());
		System.out.println("업무내용 : "+upt.getWinfo());
		System.out.println("시작일 : "+upt.getStdte());
		System.out.println("마감일 : "+upt.getEddte());
		System.out.println("제출여부 : "+upt.getSubmi());
		System.out.println("마감여부 : "+upt.getComple());
		System.out.println("사원 번호 : "+upt.getEmpno());
		service.workUpt(upt);
		return "forward:/team.do?method=workList";
	}
	
	
	// 팀 목록 조회
	@RequestMapping(params="method=teamList")
	public String teamList(HttpServletRequest request, @ModelAttribute("sch") A06_Search sch, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				d.addAttribute("teamList", service.teamList(sch));
				page = "manage_teamList";
			}
		}
		return "a01_start\\"+page;
	}
	// 팀 상세
	@RequestMapping(params="method=teamDetail")
	public String teamDetail(HttpServletRequest request, int tno, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				d.addAttribute("prjInfo", service.prjInfo(tno));
				d.addAttribute("teamDt", service.teamDetail(tno));
				page = "manage_teamDetail";
			}
		}
		return "a01_start\\"+page;
	}
	// 팀에 멤버 추가
	@RequestMapping(params="method=addMem")
	public String addMem(A02_Team addm) {
		service.addMem(addm);
		service.uptPjdo(addm.getEmpno());
		return "redirect:/main.do?method=memList&tno="+addm.getTno();
	}
	
	@RequestMapping(params="method=leaderPrj") // 팀장의 내 프로젝트 조회
	public String leaderPrj(HttpServletRequest request, Model d){
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("팀장")) {
				System.out.println("사원번호 :"+mem.getEmpno() );
				page = "leader_myPrj";
				d.addAttribute("myprj",service.getPrj(mem.getEmpno()));
				d.addAttribute("showPercent",service.showPercent(mem.getEmpno()));
			}
		}
		return "a01_start\\"+page;
	}

	@RequestMapping(params="method=crtTeam")
	public String crtTeam(int tno) {
		service.crtTeam(tno);
		return "forward:/team.do?method=tlist";
	}
	@RequestMapping(params="method=tlist")
	public String tlist(HttpServletRequest request, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				d.addAttribute("tlist", service.tlist());
				page = "manage_tlist";
			}
		}
		return "a01_start\\"+page;
	}
	@RequestMapping(params="method=addMem2")
	public String addMem2(A02_Team addm) {
		service.addMem(addm);
		service.uptPjdo(addm.getEmpno());
		return "redirect:/team.do?method=tlist";
	}
	@RequestMapping(params="method=delTeam")
	public String delTeam(int tno) {
		service.delPrj(tno);
		service.delTeam(tno);
		return "redirect:/team.do?method=tlist";
	}
	
}
