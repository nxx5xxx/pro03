package kr.go.haman.controller.photog;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.haman.dto.Photog;
import kr.go.haman.dto.User1;
import kr.go.haman.model.PhotogDAO;
import kr.go.haman.model.User1DAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/PhotoUpdate.do")
public class PhotoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		Photog pt = new Photog();
		PhotogDAO ptd = new PhotogDAO();
		
		int pnosw=0;
		String file1=null;
		String file2=null;
		
		String savePath = "/data/photog";
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		try {
			MultipartRequest multi = new MultipartRequest(request,uploadFilePath,10485760,"UTF-8",new DefaultFileRenamePolicy());
			/*System.out.println(multi.getParameter("title"));
			System.out.println(multi.getParameter("content"));
			System.out.println(user.getId());
			System.out.println(user.getName());*/
			pt.setPno(multi.getParameter("pno")); 
			pt.setTitle(multi.getParameter("title"));
			pt.setContent(multi.getParameter("content"));
			file1=multi.getFilesystemName("file1");
			file2=multi.getFilesystemName("file2");
			System.out.println(file1);
			System.out.println(file2);
			if(file1!=null){
				pt.setFile1("data/photog/"+file1);
				pnosw = pnosw + 1;
			}
			if(file2!=null){
				pt.setFile2("data/photog/"+file2);
				pnosw = pnosw + 10;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ptd.updatePhotog(pt, pnosw);
		
		response.sendRedirect("PhotoList.do");
		
		
	}

}
