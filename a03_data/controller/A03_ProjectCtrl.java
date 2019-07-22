package springweb.a03_data.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_vo.A01_Emp;
import springweb.a02_vo.A03_Project;
import springweb.a03_data.service.A02_TeamService;
import springweb.a03_data.service.A03_ProjectService;

@Controller
@RequestMapping("/prj.do")
public class A03_ProjectCtrl {

	@Autowired(required=false)
	private A03_ProjectService service;
	@Autowired(required=false)
	private A02_TeamService service2;
	
	@RequestMapping(params="method=list")
	public String prjList(HttpServletRequest request, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				d.addAttribute("plist", service.prjList());
				page = "manage_prjList";
			}
		}
		return "a01_start\\"+page;
	}
	@RequestMapping(params="method=prjForm")
	public String prjForm(HttpServletRequest request,Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				page = "manage_prjForm";
				d.addAttribute("tnlist", service2.tlist());
			}
		}
		return "a01_start\\"+page;
	}
	@RequestMapping(params="method=insert")
	public String prjInsert(A03_Project ins,Model d) {
		String page;
		System.out.println("팀번호 "+ins.getTno());
		System.out.println("프젝 번호"+ service2.tprj(ins.getTno()).getPjno());
		if(service2.tprj(ins.getTno()).getPjno() == 0) {
			service.prjInsert(ins);
			service.pjnoUpdate(ins);
			page = "list";
		}else {
			d.addAttribute("fail", "실패");
			page = "prjForm";
		}
		return "forward:/prj.do?method="+page;
	}
	@RequestMapping(params="method=detail")
	public String prjDetail(HttpServletRequest request, int pjno, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				d.addAttribute("prj01", service.prjDetail(pjno));
				page = "manage_prjDetail";
			}
		}
		return "a01_start\\"+page;
	}
	@RequestMapping(params="method=update")
	public String prjUpdate(A03_Project upt) {
		service.prjUpdate(upt);
		return "redirect:/prj.do?method=list";
	}
	@RequestMapping(params="method=delete")
	public String prjDelete(int pjno) {
		service.prjDelete(pjno);
		return "redirect:/prj.do?method=list";
	}
	
	@RequestMapping(params="method=manageCalendar") // 전체 프로젝트 캘린더 조회
	public String manageCalendar(Model d) {
		d.addAttribute("plist", service.manageCalPrjList());
		return "pageJsonReport";
	}
	@RequestMapping(params="method=indiCalendar") // 개인 프로젝트 캘린더 조회
	public String indiCalendar(Model d,HttpServletRequest request) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		d.addAttribute("plist", service.indiCalPrjList(mem.getEmpno()));
		return "pageJsonReport";
	}
	// 차트
	@RequestMapping(params="method=chartData")
	public String chartData(Model d) {
		d.addAttribute("cdlist", service.chartData());
		return "pageJsonReport";
	}

	// 팀별 매출통계
	@RequestMapping(params="method=teamStats")
	public String teamStats(Model d) {
		//labels,data,backgroundColor,hoverBackgroundColor
		d.addAttribute("slist", service.teamStats());
		return "pageJsonReport";
	}

}
