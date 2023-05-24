package kr.go.haman.controller.notice;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.haman.dto.Notice;
import kr.go.haman.model.NoticeDAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/NoticeInsert.do")
public class NoticeInsertCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sid");
		Notice notice = new Notice();
		NoticeDAO notdao = new NoticeDAO();
		String savePath = "/data/notice";
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		String file1 =null;
		String file2 =null;
		String file3 =null;
		
		
		try{
		MultipartRequest multi = new MultipartRequest(request,uploadFilePath,10485760,"UTF-8",new DefaultFileRenamePolicy());
		notice.setId(id);
		notice.setTitle(multi.getParameter("title"));
		notice.setContent(multi.getParameter("content"));
		notice.setName(multi.getParameter("name"));
		file1=multi.getFilesystemName("file1");
		file2=multi.getFilesystemName("file2");
		file3=multi.getFilesystemName("file3");
		
		if(file1!=null){
			notice.setFile1("data/notice/"+file1);
		}
		if(file2!=null){
			notice.setFile2("data/notice/"+file2);
		}
		if(file3!=null){
			notice.setFile3("data/notice/"+file3);
		}
		
		}catch(Exception e){
			System.out.println("예외발생"+e);
		}
		notdao.insertNotice(notice);
		
		response.sendRedirect("GoNoticeList.do");
	}
}
