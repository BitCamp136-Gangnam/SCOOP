package kr.or.scoop.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dto.FileDrive;
import net.sf.json.JSONArray;

@Controller
public class FileController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("/fileDownload.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("File 왔냐?");
		System.out.println(request.getParameter("fileName"));
		String realPath = "C:/SmartWeb/FinalProjectEclipse/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SCOOP_Project/upload/";
		String p = "upload";
		String f = request.getParameter("fileName");
		
		String fname = new String(f.getBytes("euc-kr"), "8859_1");
		System.out.println(fname);
		response.setHeader("Content-Disposition", "attachment;filename=" + fname + ";");
		// 파일명 전송
		// 파일 내용전송
		String fullpath = request.getServletContext().getRealPath(p + "/" + f);
		System.out.println(fullpath);
		FileInputStream fin = new FileInputStream(fullpath);
		// 출력 도구 얻기 :response.getOutputStream()
		ServletOutputStream sout = response.getOutputStream();
		byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
		int size = 0;
		while ((size = fin.read(buf, 0, buf.length)) != -1) // buffer 에 1024byte
		// 담고
		{ // 마지막 남아있는 byte 담고 그다음 없으면 탈출
			sout.write(buf, 0, size); // 1kbyte씩 출력
		}
		fin.close();
		sout.close();
	}
	@RequestMapping("/fileChange.do")
	public String fileChange(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception {
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		String email = (String)session.getAttribute("email");
		int tseq = Integer.parseInt(request.getParameter("tseq"));
		System.out.println(email);
		System.out.println(tseq);
		if(tseq == 0) {
			List<FileDrive> filedrive = memberdao.getFileDrive(email);
			JSONArray jsonlist = JSONArray.fromObject(filedrive);
			model.addAttribute("ajax",jsonlist);
		}else {
			List<FileDrive> filedrive = memberdao.getFileProject(email, tseq);
			JSONArray jsonlist = JSONArray.fromObject(filedrive);
			model.addAttribute("ajax",jsonlist);
		}
		return "ajax/ajax";
	}
	
}
