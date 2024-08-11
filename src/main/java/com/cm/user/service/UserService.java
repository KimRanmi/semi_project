package com.cm.user.service;

import static com.cm.common.sql.JDBCTemplate.*;

import java.sql.Connection;

import com.cm.user.dao.UserDao;
import com.cm.user.vo.User;

public class UserService {
	 private UserDao ud = new UserDao();
	 
	 // 회원가입
	public int createUser(User u) {
	
		Connection conn = getConnection();
		
		// 디버깅 출력
		int result = 0;
		try {
            result = ud.createUser(u, conn);
            if(result > 0) {
                commit(conn);
            } else {
                rollback(conn);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn);
        }
        
        return result;
    }
	
	
	// 아이디 중복 체크
	
	public int check(String id) {
		Connection conn = getConnection();
		int result = new UserDao().check(id,conn);
		close(conn);
		return result;
	}
	
	// 닉네임 중복 체크
	public int checkNick(String nick) {
		Connection conn = getConnection();
		int result = new UserDao().checkNick(nick,conn);
		close(conn);
		return result;
	}
	
	// 로그인
	public User getUserInfo(String id,String pw) {
		Connection conn = getConnection();
		User user  = new UserDao().getUserInfo(id,pw,conn);
		close(conn);
		return user;
	}
	
	// 아이디 찾기
	public String findUserIdByNickAndEmail(String nick, String email) {
	    Connection conn = getConnection();
	    String userId = ud.findUserIdByNickAndEmail(nick, email, conn);
	    close(conn);
	    return userId;
	}
	
	// 비밀번호 찾기
	public User findUserPw(String id, String nick, String question, String answer) {
	    Connection conn = getConnection();
	    User user = ud.findUserPw(id, nick, question, answer, conn);
	    close(conn);
	    return user;
	}
	

	// 회원탈퇴
	
	public boolean deleteUser(String id,String pw) {
		Connection conn = getConnection();
		boolean isDeleted = ud.deleteUser(id, pw, conn); // UserDao의 인스턴스 변수 사용
        close(conn);
        return isDeleted;
	}
	
	// 회원정보 수정
	
	public boolean updateUserEmail(String user_id, String email) {
		Connection conn = getConnection();
		boolean isupdated= ud.updateUserEmail(user_id, email, conn);
		System.out.println("UserService updateUserEmail result: " + isupdated);
		close(conn);
		return isupdated;
	}

	// 프로필에서 보여지는 정보 가져오기
	
	public User getUserProfile(int userNo) {
        Connection conn = getConnection();
        User user = ud.getUserProfile(userNo, conn);
        close(conn);
        return user;
    }
	
	
	// 프로필 설정 후 변경하기
	
	public boolean updateUserProfile(int userNo,String nick, String text) {
        Connection conn = getConnection();
        boolean isUpdated = ud.updateUserProfile(userNo,nick, text, conn);
        close(conn);
        return isUpdated;
    }

	// 닉네임 중복 확인 메서드 추가
    public boolean checkNicknameAvailability(String nickname) {
        Connection conn = getConnection();
        boolean isAvailable = ud.isNicknameAvailable(nickname, conn);
        close(conn);
        return isAvailable;
    }
	
	
	
	
	
	
	
	
}
