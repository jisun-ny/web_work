package test.guest.dto;

/*
 * Dto는 카테고리 별(주제별) 하나 만들어야한다!
 * 테이블당 하나면 테이블을 조인하면 말이 안됨! 
 */
public class GuestDto {
	/*
	 * Dto 필드 선언하기
	 *  -필드의 type과 필드명정하기
	 */
	
	//필드
	private int num;
	private String writer;
	private String content;
	private String pwd;
	private String regdate; /*regdate는 오라클 date타입이지만 string으로 받는다.*/
	
	//생성자
	public GuestDto() {} /*디폴트 생성자 까먹지 말고 만들기!!*/

	public GuestDto(int num, String writer, String content, String pwd, String regdate) {
		super();
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.pwd = pwd;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	};
	
	
}
