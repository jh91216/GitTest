package com.anything.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	
	
	// 공통으로 사용하는 변수
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		// 공통으로 사용하는 디비연결동작
		private Connection getCon() throws Exception {
			
			// 커넥션풀을 사용한 디비연결
			// 0. 프로젝트에 필요한 API설치 (WEB-INF/lib/설치)
			//  commons-collections4-4.4.jar
			//  commons-dbcp2-2.9.0.jar
			//  commons-pool2-2.11.1.jar
			// 1. 드라이버 로드, 디비연결 호출
			// => WebContent/META-INF/context.xml  파일 생성
			// 2. WebContent/WEB-INF/web.xml 파일을 수정
			// => context.xml 파일의 정보를 기록
			// 3. DAO 파일에서 연결정보 처리
			
			// Context(프로젝트) 객체 생성(javax.naming)
			Context initCTX = new InitialContext();
			
			//프로젝트 안에 디비연결에 필요한 정보 가져오기
			// => context.xml 파일의 정보를 읽어와서 DataSource파일의 형태로
			// 변경해서 저장해놓기
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqldb");
			
			// 연결정보를 사용해서 디비연결
			con = ds.getConnection();
			
			return con;
			
		}
		
		// 공통으로 사용하는 디비 자원해제 동작
		public void closeDB() {
				try {
					if(rs != null)	rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		
		//회원가입메서드
		//insertMember(mdto)
		public void insertMember(MemberDTO mdto) {
			try {
				con=getCon();
				
				//sql & pstmt
				sql = "insert into anything_member(id,pass,name,jumin1,jumin2,gender,age,email,reg_date,address1,address2,address3) "
						+ "values(?,?,?,?,?,?,?,?,now(),?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				
				//?
				pstmt.setString(1, mdto.getId());
			    pstmt.setString(2, mdto.getPass());
			    pstmt.setString(3, mdto.getName());
			    pstmt.setString(4, mdto.getJumin1());
			    pstmt.setString(5, mdto.getJumin2());
			    pstmt.setString(6, mdto.getGender());
			    pstmt.setInt(7, mdto.getAge());
			    pstmt.setString(8, mdto.getEmail());
			    pstmt.setString(9, mdto.getAddress1());
			    pstmt.setString(10, mdto.getAddress2());
			    pstmt.setString(11, mdto.getAddress3());
			    
			    //sql실행
			    pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		//insertMember(mdto)
		
		
		//loginCheck(id,pass)
		public int loginCheck(String id, String pass) {
			int result=-1;
			
			try {
				con=getCon();
				
				//sql&pstmt
				sql="select pass from anything_member where id=?";
				pstmt=con.prepareStatement(sql);
				
				//?
				pstmt.setString(1, id);
				
				//sql 실행
				rs= pstmt.executeQuery();
				
				// 아이디가 없는 경우 (-1)리턴
				// 아이디가 있지만, 비밀번호 오류 (0)리턴
				// 아이디 있으면서, 비밀번호도 맞는 경우 (1)리턴
				//최종결과 리턴
				if(rs.next()) {
					if(pass.equals(rs.getString("pass"))) {
						//회원정보가 있으면서 비밀번호 동일
						result=1;
					}else {
						//회원정보가 있으면서, 비밀번호 다름
						result=0;
					}
				}else {
					//회원정보 없음
					result=-1;
				}
				System.out.println("실행결과 : "+result);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return result;
		}
		//loginCheck(id,pass)
		
		//getMember(id)
		public MemberDTO getMember(String id) {
			MemberDTO mdto = null;
			
			try {
				con= getCon();
				//sql &pstmt
				// sql - 전달받은 아이디에 해당하는 회원정보 모두 가져오기
				sql = "select * from anything_member where id = ?";
				
				pstmt=con.prepareStatement(sql);
				
				//?
				pstmt.setString(1, id);
				
				//sql실행
				rs=pstmt.executeQuery();
				
				//데이터 처리
				if(rs.next()) {
					//데이터가 있음 -> 회원정보를 저장
					mdto = new MemberDTO();
					mdto.setId(rs.getString("id"));
					mdto.setPass(rs.getString("pass"));
					mdto.setName(rs.getString("name"));
					mdto.setAge(rs.getInt("age"));
					mdto.setJumin1(rs.getString("jumin1"));
					mdto.setJumin2(rs.getString("jumin2"));
					mdto.setGender(rs.getString("gender"));
					mdto.setEmail(rs.getString("email"));
					mdto.setReg_date(rs.getDate("reg_date"));
					mdto.setAddress1(rs.getString("address1"));
					mdto.setAddress2(rs.getString("address2"));
					mdto.setAddress3(rs.getString("address3"));
				}
				
				System.out.println("회원정보 : "+ mdto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return mdto;
			
		}
		//getMember(id)
		
		//updateMember(mdto)
		public int updateMember(MemberDTO mdto) {
			int result = -1;
			
			try {
				con=getCon();
				
				//sql&pstmt
				sql = "select pass from anything_member where id=?";
				pstmt = con.prepareStatement(sql);
				
				//?
				pstmt.setString(1, mdto.getId());
				
				//pstmt 실행
				rs= pstmt.executeQuery();
				
				//데이터처리
				if(rs.next()) {	//데이터가 있을때
					if(mdto.getPass().equals(rs.getString("pass"))) { //본인확인
						//sql(update) & pstmt
						sql = "update anything_member set name=?, email=?, address1=?, address2=?, address3=? where id=?";
						pstmt =con.prepareStatement(sql);
						
						//?
						pstmt.setString(1, mdto.getName());
						pstmt.setString(2, mdto.getEmail());
						pstmt.setString(3, mdto.getAddress1());
						pstmt.setString(4, mdto.getAddress2());
						pstmt.setString(5, mdto.getAddress3());
						pstmt.setString(6, mdto.getId());
						
						//sql 실행
						result=pstmt.executeUpdate();
						System.out.println("회원정보 수정완료!!");
						//result=1;
					}else {
						//비밀번호 오류
						result=0;
					}
					
				}else {
					//데이터 없을때
					result=-1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return result;
		}
		//updateMember(mdto)
		
		//deleteMember(id,pass)
		public int deleteMember(String id, String pass) {
			int result=-1;
			
			try {
				con=getCon();
				
				//sql(select) &pstmt
				sql = "select pass from anything_member where id=?";
				pstmt=con.prepareStatement(sql);
				
				//?
				pstmt.setString(1, id);
				
				//pstmt 실행
				rs= pstmt.executeQuery();
				
				//데이터 처리
				if(rs.next()) { //데이터 있을때
					if(pass.equals(rs.getString("pass"))) {	//본인확인					
						//3. sql 작성(update) & pstmt 객체 생성
						sql = "delete from anything_member where id=?";
						pstmt= con.prepareStatement(sql);
						
						//?
						pstmt.setString(1, id);
						
						// 4. sql 실행
						result = pstmt.executeUpdate();
						// -> sql구문이 실행했을때 영향을 준 row수 리턴, where구문을 안쓰면 return 값이 데이터수만큼
						
						System.out.println("회원삭제완료!");
						//result = 1;
					}else {
						//비밀번호 오류
						result = 0;
					}
					
				}else {
					//데이터 없을때
					result = -1;
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}	
			
			
			return result;
		}
		//deleteMember(id,pass)
		
		// getMemberList()
		//public ArrayList<MemberBean> getMemberList(){
		public ArrayList getMemberList(){
			// 가변길이 배열

			ArrayList memberList = new ArrayList();
			
			try {
				
				con = getCon();
				//  sql 작성 & pstmt 객체생성
				sql ="select * from anything_member where id!='admin'"; //admin을 제외한  회원목록
				pstmt= con.prepareStatement(sql);
				// 4. sql 실행
				rs = pstmt.executeQuery();
				// 5. 데이터 처리
				while(rs.next()) {
					//회원 1명의 정보 => MemberDTO 저장
					MemberDTO mdto = new MemberDTO();
					mdto.setAge(rs.getInt("age"));
					mdto.setEmail(rs.getString("email"));
					mdto.setGender(rs.getString("gender"));
					mdto.setId(rs.getString("id"));
					mdto.setName(rs.getString("name"));
					mdto.setPass(rs.getString("pass"));
					mdto.setReg_date(rs.getDate("reg_date"));
					mdto.setAddress1(rs.getString("address1"));
					mdto.setAddress2(rs.getString("address2"));
					mdto.setAddress3(rs.getString("address3"));
					mdto.setJumin1(rs.getString("jumin1"));
					mdto.setJumin2(rs.getString("jumin2"));
					
					//MemberBean 의 정보를 Arraylist 1칸에 저장
					memberList.add(mdto);
				}
				System.out.println("회원 목록 저장완료!");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return memberList;
			
		}
		//duplecateID(id)
		public int duplecateID(String id) {
			int cnt=0;
			try {
				con= getCon();
				sql= "select count(id) as cnt from anything_member where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					cnt=rs.getInt("cnt");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				closeDB();
			}
			return cnt;
		}
		//duplecateID(id)

		//duplecateEmail(email)
		public int duplecateEmail(String email) {
			int cnt=0;
			try {
				con= getCon();
				sql= "select count(email) as cnt from anything_member where email=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					cnt=rs.getInt("cnt");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				closeDB();
			}
			return cnt;
		}
		//duplecateEmail(email)
		
//		//searchID(id)
//		public boolean searchID(String id) {
//			boolean result =false;
//			try {
//				con =getCon();
//				
//				sql= "select id from anything_member where id=?";
//				pstmt =con.prepareStatement(sql);
//				pstmt.setString(1, id);
//				
//				rs=pstmt.executeQuery();
//				while(rs.next()) {
//					result=true;
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}finally {
//				closeDB();
//			}
//			return result;
//		}
//		//confirmId(id)
		
		
		
		
		
}
