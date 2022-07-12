package model2.mvcboard;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view.do")
public class ViewController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        // 게시물 불러오기
        MVCBoardDAO dao = new MVCBoardDAO();
        String idx = req.getParameter("idx");

        Cookie viewCookie=null;
		Cookie[] cookies=req.getCookies();
		
		System.out.println("cookie : "+cookies);
		
        if(cookies !=null) {
			for (int i = 0; i < cookies.length; i++) {

                //만들어진 쿠키들을 확인하며, 만약 들어온 적 있다면 생성되었을 쿠키가 있는지 확인
				if(cookies[i].getName().equals("|"+idx+"|")) {
					System.out.println("if문 쿠키 이름 : "+cookies[i].getName());
				
                //찾은 쿠키를 변수에 저장
					viewCookie=cookies[i];
				}
			}
			
		}else {
			System.out.println("cookies 확인 로직 : 쿠키가 없습니다.");
		}


		//만들어진 쿠키가 없음을 확인
		if(viewCookie==null) {
        
          	System.out.println("viewCookie 확인 로직 : 쿠키 없당");
			
            try {
            
            	//이 페이지에 왔다는 증거용(?) 쿠키 생성
				Cookie newCookie=new Cookie("|"+idx+"|","readCount");
				resp.addCookie(newCookie);
                
                //쿠키가 없으니 증가 로직 진행
				dao.updateVisitCount(idx);  // 조회수 1 증가
                
			} catch (Exception e) {
				System.out.println("쿠키 넣을때 오류 나나? : "+e.getMessage());
				e.getStackTrace();

			}
		
        //만들어진 쿠키가 있으면 증가로직 진행하지 않음
		}else {
			System.out.println("viewCookie 확인 로직 : 쿠키 있음");
			String value=viewCookie.getValue();
			System.out.println("viewCookie 확인 로직 : 쿠키 value : "+value);
		}
		
		MVCBoardDTO dto = dao.selectView(idx);
        dao.close();

        // 줄바꿈 처리
        dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));

        // 게시물(dto) 저장 후 뷰로 포워드
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/View.jsp").forward(req, resp);

    }
    
}
