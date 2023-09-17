package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class UserDAO {

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";
	private static final String jdbcClass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;
	private UserDTO uDto;

	
	public UserDAO() {
		try {
			Class.forName(jdbcClass);
			} catch (Exception e) {
			e.printStackTrace();// 발생한 오류가 무엇인지 출력해줌.
		}
		
		// jdbc Connection 관리 -> ConnectionPool이 관리
		try {
			pool = ConnectionPool.getInstance(url, user, password, 3, 5, true, 500);
		} catch (SQLException e) {
			// throws를 하면 웹쪽에서 처리해야하기 때문에 데이터 모델 단인 EmpService에서 처리해야함.
			e.printStackTrace();
		} // pool은 공유자원

	}
		
	
	public void setuDto(UserDTO uDto) {
		this.uDto = uDto;
	}



	//로그인 기능
	public int login() throws SQLException,ClassNotFoundException {
//		Connection conn = pool.getConnection();
//		String sql = "select userID, userPWD from bbs_user where userID = ?"; // ? : 메서드 호출로 받아오는 인자값이 들어감.
//		PreparedStatement pstmt = conn.prepareStatement(sql); //prepareStatement를 사용하면 sql 인젝션 같은 해킹 기법으로부터 방어할 수 있음.
//		
//		System.out.println(sql);
//		pstmt.setString(1, uDto.getUserID());
//		
//		ResultSet rs = pstmt.executeQuery(); //sql문을 실행한 후의 결과값을 rs에 저장
//		
//		int result = 0;
//		if(rs.next()) {
//			if(rs.getString(2).equals(uDto.getUserPWD())) {
//				result = 1;
//				rs.close();
//				pstmt.close();
//				pool.releaseConnection(conn);
//				return result; //로그인 성공
//			}else {
//				result = 0;
//				rs.close();
//				pstmt.close();
//				pool.releaseConnection(conn);
//				return result; // 비밀번호 틀림.
//			}
//		}else {
//				result = -2;
//				rs.close();
//				pstmt.close();
//				pool.releaseConnection(conn);
//				return result; // -1은 아이디가 없음. 
//			}
		
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement(); //prepareStatement를 사용하면 sql 인젝션 같은 해킹 기법으로부터 방어할 수 있음.
		String sql = "select userID, userPWD from bbs_user where userID = '"+uDto.getUserID()+"'"; // ? : 메서드 호출로 받아오는 인자값이 들어감.
		
		System.out.println(sql);
		
		ResultSet rs = stmt.executeQuery(sql); //sql문을 실행한 후의 결과값을 rs에 저장
		
		int result = 0;
		if(rs.next()) {
			if(rs.getString("userPWD").equals(uDto.getUserPWD())) {
				result = 1;
				rs.close();
				stmt.close();
				pool.releaseConnection(conn);
				return result; //로그인 성공
			}else {
				result = 0;
				rs.close();
				stmt.close();
				pool.releaseConnection(conn);
				return result; // 비밀번호 틀림.
			}
		}else {
				result = -2;
				rs.close();
				stmt.close();
				pool.releaseConnection(conn);
				return result; // -1은 아이디가 없음. 
			}

		
	
	}
	
}
