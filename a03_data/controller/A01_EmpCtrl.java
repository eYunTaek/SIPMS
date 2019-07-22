package springweb.a03_data.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import springweb.a02_vo.A01_Emp;
import springweb.a02_vo.A05_Message;
import springweb.a02_vo.A06_Search;
import springweb.a03_data.service.A01_EmpService;
import springweb.a03_data.service.A02_TeamService;

@Controller
@SessionAttributes("mem")
@RequestMapping("/main.do")
public class A01_EmpCtrl {
	@ModelAttribute("mem")
	public A01_Emp getMember() {
		return new A01_Emp();
	}
	@Autowired(required=false)
	private A01_EmpService service;
	@Autowired(required=false)
	private A02_TeamService service2;
	@RequestMapping(params = "method=login")
	public String loginForm() {
		return "a01_start\\login";
	}
	@RequestMapping(params = "method=permision") // 로그인
	public String login(@ModelAttribute("mem") A01_Emp login, Model d, @ModelAttribute("sch") A06_Search sch) {
		A01_Emp m = null;
		int msgcnt = 0;
		if(login.getPass()!=null) {
			// DB 처리를 통해서 데이터를 확인
			m= service.login(login);
		}
		System.out.println(m!=null?"로그인 성공":"로그인 실패");
		String page = "login";
		if(m!=null) {
			msgcnt = service.messageCount(m.getEmpno());
			if(m.getPermi().equals("관리자")) {
				login.setPermi(m.getPermi());
				login.setMsgCnt(msgcnt);
				d.addAttribute("prjList",service2.teamList(sch));
				page = "manage_main";
			}
			else if(m.getPermi().equals("팀장")) {
				login.setPermi(m.getPermi());
				login.setMsgCnt(msgcnt);
				page = "leader_main";
				d.addAttribute("myprj1",service2.getPrj(login.getEmpno()));
				d.addAttribute("myprj2",service.getmywork2(login.getEmpno()));
				d.addAttribute("showPercent",service2.showPercent(login.getEmpno()));
				if(service2.getPrj(login.getEmpno()) != null) {
					d.addAttribute("getLeaderName",service.getLeaderName(service2.getPrj(login.getEmpno()).getPjno()));
					d.addAttribute("getTeamcnt",service2.teamDetail(service2.getPrj(login.getEmpno()).getTno()).get(0).getCnt());
				}
			}else {
				login.setPermi(m.getPermi());
				login.setMsgCnt(msgcnt);
				page = "emp_main";
				d.addAttribute("myprj1",service2.getPrj(login.getEmpno()));
				d.addAttribute("myprj2",service.getmywork2(login.getEmpno()));
				d.addAttribute("showPercent",service2.showPercent(login.getEmpno()));
				if(service2.getPrj(login.getEmpno()) != null) {
					d.addAttribute("getLeaderName",service.getLeaderName(service2.getPrj(login.getEmpno()).getPjno()));
					d.addAttribute("getTeamcnt",service2.teamDetail(service2.getPrj(login.getEmpno()).getTno()).get(0).getCnt());
				}
			}
		}
		return "a01_start\\"+page;
	}
	@RequestMapping(params = "method=logOut")
	public String logOut(HttpServletRequest request) {
		HttpSession session =  request.getSession();
		session.removeAttribute("mem");
		return "a01_start\\login";
	}
	@RequestMapping(params = "method=main")
	public String main(HttpServletRequest request,Model d,@ModelAttribute("sch") A06_Search sch) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				page = "manage_main";
				d.addAttribute("prjList",service2.teamList(sch));
			}
			else if(mem.getPermi().equals("팀장")) {
				page = "leader_main";
				d.addAttribute("myprj1",service2.getPrj(mem.getEmpno()));
				d.addAttribute("myprj2",service.getmywork2(mem.getEmpno()));
				d.addAttribute("showPercent",service2.showPercent(mem.getEmpno()));
				if(service2.getPrj(mem.getEmpno()) != null) {
					d.addAttribute("getLeaderName",service.getLeaderName(service2.getPrj(mem.getEmpno()).getPjno()));
					d.addAttribute("getTeamcnt",service2.teamDetail(service2.getPrj(mem.getEmpno()).getTno()).get(0).getCnt());
				}
			}else {
				page = "emp_main";
				d.addAttribute("myprj1",service2.getPrj(mem.getEmpno()));
				d.addAttribute("myprj2",service.getmywork2(mem.getEmpno()));
				d.addAttribute("showPercent",service2.showPercent(mem.getEmpno()));
				if(service2.getPrj(mem.getEmpno()) != null) {
					d.addAttribute("getLeaderName",service.getLeaderName(service2.getPrj(mem.getEmpno()).getPjno()));
					d.addAttribute("getTeamcnt",service2.teamDetail(service2.getPrj(mem.getEmpno()).getTno()).get(0).getCnt());
				}
			}
		}
		return "a01_start\\"+page;
	}
	
	// (관리자) 사원 목록
	@RequestMapping(params = "method=empList")
	public String empList(HttpServletRequest request, @ModelAttribute("sch") A06_Search sch, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				d.addAttribute("elist", service.empList(sch));
				page = "manage_empList";
			}
		}
		return "a01_start\\"+page;
	}
	// (관리자) 사원 추가 페이지 이동
	@RequestMapping(params = "method=empForm")
	public String insertForm(HttpServletRequest request) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				page = "manage_empForm";
			}
		}
		return "a01_start\\"+page;
	}
	// (관리자) 사원 추가
	@RequestMapping(params = "method=insEmp")
	public String insertEmp(A01_Emp ins) {
		service.insertEmp(ins);
		return "redirect:/main.do?method=empList";
	}
	// (관리자) 사원정보 조회
	@RequestMapping(params = "method=empDetail")
	public String getEmp(HttpServletRequest request, int empno, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				d.addAttribute("emp01", service.getEmp(empno));
				page = "manage_empDetail";
			}
		}
		return "a01_start\\"+page;
	}
	// (관리자) 사원정보 수정
	@RequestMapping(params = "method=uptEmp")
	public String updateEmp(A01_Emp upt) {
		service.updateEmp(upt);
		if(upt.getPermi().equals("팀장")) {
			service.uptLno(upt);
		}
		service.uptPosi(upt);
		return "redirect:/main.do?method=empList";
	}
	// (관리자) 사원 삭제
	@RequestMapping(params = "method=empDel")
	public String deleteEmp(int empno) {
		service.deleteEmp(empno);
		return "redirect:/main.do?method=empList";
	}
	
	// 사원(내정보 보기)
	@RequestMapping(params = "method=empInfo")
	public String empinfo(HttpServletRequest request, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("사원")) {
				System.out.println("사원번호 :"+mem.getEmpno());
				page = "emp_info";
				d.addAttribute("empinfo", service.empinfo(mem.getEmpno()));
			}
			else if(mem.getPermi().equals("팀장")) {
				System.out.println("사원번호 :"+mem.getEmpno());
				page = "leader_info";
				d.addAttribute("empinfo", service.empinfo(mem.getEmpno()));
			}
		}
		return "a01_start\\"+page;
	}
	// 사원(팀원정보 보기)
	@RequestMapping(params = "method=empteaminfo")
	public String teamMember(HttpServletRequest request, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("사원")) {
				System.out.println("사원번호 :"+mem.getEmpno());
				page = "emp_teaminfo";
				d.addAttribute("tmlist",service2.teamMemberList(mem));
			}
		}
		return "a01_start\\"+page;
	}
	// 사원(내프로젝트 상황 - 상세보기)
	@RequestMapping(params = "method=prjDetail")
	public String getTeam(HttpServletRequest request, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("사원")) {
				System.out.println("사원번호 :"+mem.getEmpno());
				page = "emp_prjDetail";
				d.addAttribute("myprj",service.getmywork(mem.getEmpno()));
			}
		}
		return "a01_start\\"+page;
	}
	
	
	// 팀장(내프로젝트 상황 - 상세보기)
	@RequestMapping(params = "method=leaderWork")
	public String leaderWork(HttpServletRequest request, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("팀장")) {
				System.out.println("사원번호 :"+mem.getEmpno());
				page = "leader_myWork";
				d.addAttribute("myprj",service.getmywork(mem.getEmpno()));
			}
		}
		return "a01_start\\"+page;
	}
	
	// 사원 개인 업무 파일첨부하기
	@RequestMapping(params = "method=uploadFile")
	public String upload(@RequestParam("report01") MultipartFile report, 
							@RequestParam("wno") int wno,HttpServletRequest request)  {
		System.out.println("받은 파일명:"+report.getOriginalFilename());
		
		String fname = report.getOriginalFilename();
		String path = "C:\\z01_web\\workspace\\project04\\WebContent\\i01_upload\\";
		String tmpath = "C:\\z01_web\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project04\\i01_upload\\";
		
		File tepFile = new File(tmpath+fname);
		File file = new File(path+fname);
		
		A01_Emp emp = new A01_Emp(wno,fname);
		
		try {
			report.transferTo(tepFile);
			Files.copy(tepFile.toPath(), file.toPath());
			service.uploadFile(emp);
			service.updatemywork(wno);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
			//System.out.println("핵고수이윤택처리");
		}
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("팀장")) {
				System.out.println("사원번호 :"+mem.getEmpno());
				page = "method=leaderWork";
			}else if(mem.getPermi().equals("사원")) {
				System.out.println("사원번호 :"+mem.getEmpno());
				page = "method=prjDetail";
			}
		}
		return "forward:/main.do?"+page;
	}
	
	// 사원 개인 업무 파일 다운로드하기
	@RequestMapping(params="method=fileDownForm")
	public String fileDownForm() {
		
		return "WEB-INF\\view\\a01_start\\c01_uploadDown.jsp";
	}
	@RequestMapping(params="method=fileDown")
	public String fileDownForm(@RequestParam("fname") String fname, Model d) {
		//System.out.println("다운로드 파일:"+fname);
		d.addAttribute("downloadFile",fname);
		
		return "downloadViewer";
	}
	// 사원 개인 업무파일 삭제 (wno와 delfname(삭제할파일명)을 받아옵니다)
	@RequestMapping(params="method=deleteFile")
	public String delete(@RequestParam("wno") int wno , @RequestParam("delfname") String delfname,HttpServletRequest request) {
		service.deleteFile(wno);
		service.updatemywork2(wno);
		String fileName = "C:\\z01_web\\workspace\\project04\\WebContent\\i01_upload\\"+delfname;
		//System.out.println(fileName);
		File file = new File(fileName);
		file.delete();
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("팀장")) {
				System.out.println("사원번호 :"+mem.getEmpno());
				page = "method=leaderWork";
			}else if(mem.getPermi().equals("사원")) {
				System.out.println("사원번호 :"+mem.getEmpno());
				page = "method=prjDetail";
			}
		}
		
		return "forward:/main.do?"+page;
	}
	
	// (관리자) 팀에 추가할 멤버 목록
	@RequestMapping(params="method=memList")
	public String addMemList(HttpServletRequest request, int tno, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				d.addAttribute("tno", tno);
				d.addAttribute("addList", service.addMemList());
				page = "manage_teamAddList";
			}
		}
		return "a01_start\\"+page;
	}
	
	// 메세지함 리스트
	@RequestMapping(params="method=messageList")
	public String messageList(HttpServletRequest request,@ModelAttribute("msg") A05_Message msg, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("팀장") || mem.getPermi().equals("사원") || mem.getPermi().equals("관리자")) {
				System.out.println("사원번호 :"+mem.getEmpno());
				msg.setEmpno(mem.getEmpno());
				d.addAttribute("mlist", service.messageList(msg));
				page = "messageList";
			}
		}
		return "a01_start\\"+page;
	}
	// 메세지 조회
	@RequestMapping(params="method=messageDetail")
	public String messageDetail(HttpServletRequest request,@RequestParam("mno") int mno,Model d,@ModelAttribute("mem") A01_Emp login) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("팀장") || mem.getPermi().equals("사원") || mem.getPermi().equals("관리자")) {
				System.out.println("사원번호 :"+mem.getEmpno());
				d.addAttribute("msg", service.messageDetail(mno));
				int cnt = service.messageCount(mem.getEmpno());
				login.setEmpno(mem.getEmpno());
				login.setPass(mem.getPass());
				login.setPermi(mem.getPermi());
				login.setMsgCnt(cnt);
				page = "messageDetail";
			}
		}
		return "a01_start\\"+page;
	}
	// 메세지 작성페이지 이동
	@RequestMapping(params ="method=messageForm")
	public String messageForm(HttpServletRequest request,Model d,A01_Emp sch) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			d.addAttribute("elist", service.msgEmpList(sch));
			if(mem.getPermi().equals("관리자")) {
				page = "messageForm";
			}
			else if(mem.getPermi().equals("팀장")) {
				page = "messageForm";
			}else {
				page = "messageForm";
			}
		}
		return "a01_start\\"+page;
	}
	// 메세지 전송
	@RequestMapping(params="method=messageSend")
	public String messageSend(A01_Emp snd) {
		service.messageSend(snd);
		return "forward:/main.do?method=messageForm";
	}
	// 받은메세지 삭제
	@RequestMapping(params="method=messageDelete")
	public String messageDelete(@RequestParam("mno") int mno) {
		service.messageDelete(mno);
		return "forward:/main.do?method=messageList";
	}
	
	// (관리자) 팀원 추가 리스트2
	@RequestMapping(params="method=memList2")
	public String addMemList2(HttpServletRequest request, int tno, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				d.addAttribute("tno", tno);
				d.addAttribute("addList", service.addMemList());
				d.addAttribute("teamDt", service2.teamDetail(tno));
				page = "manage_tlistAdd";
			}
		}
		return "a01_start\\"+page;
	}
	// (관리자) 팀원 업무 확인
	@RequestMapping(params="method=showWork")
	public String showWork(HttpServletRequest request, int empno, int tno, Model d) {
		HttpSession session =  request.getSession();
		A01_Emp mem = (A01_Emp)session.getAttribute("mem");
		String page = "login";
		if(mem != null) {
			if(mem.getPermi().equals("관리자")) {
				d.addAttribute("prjInfo", service.prjInfo(tno));
				d.addAttribute("prjWork", service.getmywork(empno));
				page = "manage_teamWork";
			}
		}
		return "a01_start\\"+page;
	}

}
