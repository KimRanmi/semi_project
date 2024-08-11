package com.cm.user_page.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.cm.user_page.service.MsgService;

@WebServlet("/user/deleteReceivedMsg")
public class ReceivedMsgDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReceivedMsgDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String messageNoStr = request.getParameter("messageNos");
//		int messageNo = Integer.parseInt(messageNoStr);
//		
//		int result = new MsgService().deleteReceivedMsg(messageNo);
//		
//		
//		if(result > 0) {
//			response.sendRedirect("/receivedMsg/list");
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String messageNos = request.getParameter("messageNos");
		
		// JSON 문자열을 JSON 배열로 파싱
	    JSONParser parser = new JSONParser();
	    try {
	        JSONArray messageNosArray = (JSONArray) parser.parse(messageNos);
	        // 정수 배열로 변환
	        int[] messageNoArrayInt = new int[messageNosArray.size()];
	        for (int i = 0; i < messageNosArray.size(); i++) {
	            messageNoArrayInt[i] = Integer.parseInt((String) messageNosArray.get(i));
	        }

	        // MsgService의 deleteReceivedMsg 메서드를 호출하여 여러 메시지 삭제
	        int[] results = new MsgService().deleteReceivedMsg(messageNoArrayInt);

	        // 삭제 결과에 따라 처리
	        boolean isSuccess = true;
	        for (int result : results) {
	            if (result <= 0) {
	                isSuccess = false;
	                break;
	            }
	        }

	        if (isSuccess) {
	            // 모든 메시지가 성공적으로 삭제되었을 경우, 리스트 페이지로 리다이렉트
	            response.sendRedirect("/receivedMsg/list");
	        } else {
	            // 삭제 중 오류가 발생한 경우
	            response.getWriter().write("삭제 중 오류가 발생했습니다.");
	        }
	    } catch (ParseException | NumberFormatException e) {
	        // JSON 파싱 오류 또는 정수로의 변환 중 오류 발생한 경우
	        response.getWriter().write("메시지 번호를 올바르게 입력해주세요.");
	    }
	}

}
