package kr.go.haman.controller.complain;

import java.io.IOException;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.go.haman.dto.Complain;
import kr.go.haman.model.ComplainDAO;


@WebServlet("/ReplyInsert.do")
public class ReplyInsertCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ucno = "";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Complain comp = new Complain();
		ComplainDAO compdao = new ComplainDAO();
		String savePath = "/data/complain";
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		try{
			MultipartRequest multi = new MultipartRequest(request,uploadFilePath,10485760,"UTF-8",new DefaultFileRenamePolicy());
			ucno = multi.getParameter("cno");
			System.out.println(ucno+"replyInsert에서의 cno값");
			String id = multi.getParameter("sid");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String name = multi.getParameter("name");
			String company = multi.getParameter("company");
			String addr =multi.getParameter("addr");
			String tel = multi.getParameter("tel");
			String file1 = multi.getFilesystemName("file1");

			
			comp.setId(id);
			comp.setTitle(title);
			comp.setContent(content);
			comp.setName(name);
			comp.setCompany(company);
			comp.setAddr(addr);
			comp.setTel(tel);
			System.out.println(file1);
			comp.setFile1(file1);


			}catch(Exception e){
				System.out.println("예외발생"+e);
			}
		compdao.insertReply(comp, ucno);;
		
		
		response.sendRedirect("GoComplainList.do");
	}

}
