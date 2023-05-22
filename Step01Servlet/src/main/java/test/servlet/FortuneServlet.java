package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 3. 어떤 경로 요청을 처리할 것인지 경로 설정(반드시 /로 시작되어야한다.)
//@WebServlet을 import한다
// 서버가 스타트 된 이후에 오늘의 운세보기를 처음 눌렀을 때 이 객체가 생성(new())이 된다.
@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	// 1. HttpServlet 클래스 상속
	// 2. 부모 메소드 재정의
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//요청과 응답을 할 메소드가 생성됨. -> 여기 안에서 코딩을 한다.
		
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		//클라이언트에게 문자열을 응답할 수 있는 객체의 참조값을 얻어내기(이 메소드로 부터)
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset = 'utf-8'>");
		pw.println("<title>오늘의 운세 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");

		//오늘의 운세 5개를 미리 준비해 둔다.
		String[] fortunes = {"동쪽으로 가면 귀인을 만나요",
						"오늘은 집에만 계세요",
						"너무 멀리가지 마세요",
						"오늘은 뭘 해도 되는 날이에요",
						"로또가 당첨되요"};
		//Random 객체를 생성해서
		Random ran = new Random();
		//0~4사이의 랜덤한 정수를 얻어내서
		int ranNum = ran.nextInt(5);
		pw.println("<p>"+fortunes[ranNum]+" </p>");
//		pw.println("<p>동쪽으로 가면 귀인을 만나요</p>"); //이 문자열 한줄이 클라이언트의 웹브라우저로 감.(클라이언트가 요청한 경로)
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	
	}
/*
 * Apache Tomcat서버는 클라이언트가 최초 /fortune 요청을 헤 오면
 * 
 * 1. 객체를 (한번만) 생성해서
 * HttpServlet = new FortuenServlet();
 * 
 * 2.service() 메소드를 호출 해준다.
 * 
 * 두번째 요청부터 /fortune을 요청을 해오면
 * 위에서 생성한 객체의 //service 메소드를 호출해준다.
 * service(,);
 * 
 * 
 * 
 */
}
