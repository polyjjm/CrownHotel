package kr.co.crown.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

@Controller
public class AdminMainController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/adminMain")
	public ModelAndView adminMain(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		String pwdStatus = "N";
		ses.setAttribute("pwdStatus", pwdStatus);
		
		
		
		
		ModelAndView mav =new ModelAndView();
		AdminRsvDAOImp dao = sqlSession.getMapper(AdminRsvDAOImp.class);
		AdminSalesVO vo = new AdminSalesVO();
		vo = dao.adminSales();

		mav.addObject("vo1",vo);
		mav.setViewName("admin/adminMain");
		return mav;
	}
	
	@RequestMapping("/adminLogout")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return "home";
	}
	
	//ckeditor 이미지 업로드 컨트롤러
	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) {

		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String path = request.getSession().getServletContext().getRealPath("/ckupload/");

		File folder = new File(path);
		if (!folder.exists()) {
			try {
				folder.mkdir();// 폴더 안만들었을시 폴더 생성
			} catch (Exception e) {
				System.out.println("파일 저장 폴더를 생성하는데 실패함." + e.getMessage());
				e.printStackTrace();
			}
		} else {
			System.out.println("폴더가 이미 존재해서 따로 안만들어도 됨.");
		}

		try {

			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			//같은 이름 처리
			
			String newFileName = changFileName(path,fileName);
			
			
			String uploadPath = path + newFileName;// 저장경로
			System.out.println(uploadPath);
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);

			printWriter = response.getWriter();
			String fileUrl = "/crown/ckupload/" + newFileName;// url경로

			JsonObject json = new JsonObject();
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", newFileName);
			json.addProperty("url", fileUrl);
			printWriter.println(json);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}
	//같은 이름 처리
	public String changFileName(String path, String fname) {
		System.out.println("path : "+path);
		System.out.println("fname : "+fname);
		File f = new File(path, fname);
		if(f.exists()) {
			System.out.println("���� ���ϸ��� ���� �Ҷ�");
			for(int renameNum=1;;renameNum++) {
				String orgFilename = fname.substring(0, fname.lastIndexOf("."));
				String orgExt = fname.substring(fname.lastIndexOf(".")+1);
				System.out.println("�������� �̸� : "+fname);
				f = new File(path, orgFilename + renameNum +"."+ orgExt);
				if(!f.exists()) {
					fname = orgFilename+renameNum+"."+orgExt;
					System.out.println("������ �̸� : "+fname);
					return fname;
				}
			}
		}
		return fname;
	}
	
	
	
}
