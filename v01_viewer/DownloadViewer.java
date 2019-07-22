package springweb.v01_viewer;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
// springweb.v01_viewer.DownloadViewer
public class DownloadViewer extends AbstractView{
	// 기본 파일다운로등 경로명 가져오기..
	@Value("${upload}")
	private String upload;
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String fname = (String)model.get("downloadFile");
		File file = new File(upload+fname);
		//System.out.println("전체파일명:"+file.getPath());
		//System.out.println("파일명:"+file.getName());
		//System.out.println("파일의 길이:"+(int)file.length());
		response.setContentType("application/download; charset=utf-8;");
		response.setContentLength((int)file.length());
		fname = URLEncoder.encode(fname,"utf-8").replaceAll("\\+", " ");
		response.setHeader("Content-Disposition", "attachment;filename=\""+fname+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = response.getOutputStream();
		FileInputStream fis = new FileInputStream(file);
		FileCopyUtils.copy(fis, out);
		out.flush();
	}
	
}









