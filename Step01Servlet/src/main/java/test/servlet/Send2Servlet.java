package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send2")
public class Send2Servlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg = req.getParameter("msg");//msg라는 파라미터로 전달되는 문자열을 가져오기
		//콘솔창에 출력해보기
		System.out.println("msg:"+msg);
		//응답 인코딩 설정
		//post방식 전송할 때는 요청 인코딩 설정을 해 주어야 한글이 깨지지 않는다! **필수**
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		//클라이언트에게 문자열을 응답할 수 있는 객체의 참조값을 얻어내기(이 메소드로 부터)
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset = 'utf-8'>");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>메세지 잘 받았어 클라이언트2야!</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();

	}
}
