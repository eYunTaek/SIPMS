package springweb.a02_vo;

import org.springframework.web.multipart.MultipartFile;

public class A04_Filevo {
	private String fname;
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	private String name;
	private MultipartFile[] report;
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public MultipartFile[] getReport() {
		return report;
	}

	public void setReport(MultipartFile[] report) {
		this.report = report;
	}

	
}
