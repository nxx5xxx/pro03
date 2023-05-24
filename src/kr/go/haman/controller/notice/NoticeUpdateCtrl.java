package kr.go.haman.controller.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Notice;
import kr.go.haman.model.NoticeDAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/NoticeUpdate.do")
public class NoticeUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		String nno = "";
		Notice notice = new Notice();
		NoticeDAO notdao = new NoticeDAO();
		
		int filesw = 0;
		
		String savePath = "/data/notice";
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		
		String file1 = null;
		String file2 = null;
		String file3 = null;
		
		try {
			MultipartRequest multi = new MultipartRequest(request,uploadFilePath,10485760,"UTF-8",new DefaultFileRenamePolicy());
			nno = multi.getParameter("nno");
			notice.setNno(nno);
			notice.setName(multi.getParameter("name"));
			notice.setTitle(multi.getParameter("title"));
			notice.setContent(multi.getParameter("content"));
			file1=multi.getFilesystemName("file1");
			file2=multi.getFilesystemName("file2");
			file3=multi.getFilesystemName("file3");
			if(file1!=null){
				notice.setFile1(file1);
				filesw = filesw + 100;
			}
			if(file2!=null){
				notice.setFile2(file2);
				filesw = filesw + 10;
			}
			if(file3!=null){
				notice.setFile3(file3);
				filesw = filesw + 1;
			}
			notdao.updateNotice(notice, filesw);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher view =request.getRequestDispatcher("GoNoticeDetail.do?nno="+nno);
		view.forward(request, response);
		
		
		
	}

}
