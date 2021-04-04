package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Product;
import dto.User;

public class UserDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	
	// 다른 페이지에 dao 객체 생성
	private static UserDao instance = new UserDao();
	
		public static UserDao getinstance() {
			return instance;
		}
	
	// 생성자
	public UserDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs_weekend?serverTimezone=UTC", "root", "1234");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	public int login(String ID, String Password) {
		String SQL = "SELECT password from user where ID =?";
		
		try {
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(Password)) {
					return 1;
				}
				else {
					return 0;
				}
			}
			return -1; //아이디 없음
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return -2;
				
	}
	
	
	public User getUser( String UserID) {
		
		User user = null;
			// SQL 작성
		String SQL = "SELECT * FROM user where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, UserID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	// 쿼리 시작은 null 부터
				
				user = new User();
				user.setId(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setName(rs.getString(3));
				user.setGender(rs.getString(4));
				user.setBirth(rs.getString(5));
				user.setEmail(rs.getString(6));
				user.setPhone(rs.getString(7));
				user.setAddress(rs.getString(8));
				user.setEnterday(rs.getString(9));
				user.setAdmin(rs.getInt(10));
				
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return user;
	}
	
	// 메소드 : 모든 제품 호출
	public ArrayList<Product> getallProducts(){
		
		ArrayList<Product> listProducts = new ArrayList<Product>();
		
			String SQL = "SELECT * FROM market";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
					// 쿼리 : 검색 결과의 레코드[ 테이블 가로단위 ]
				while(rs.next()) {	// 쿼리 결과가 null 일때까지 반복
					
					// 한개의 레코드의 모든 필드를 각 객체에 대입
					Product product = new Product();
					product.setProductID(rs.getString(1));
					product.setPname(rs.getString(2));
					product.setPprice(rs.getInt(3));
					product.setDescription(rs.getString(4));
					product.setManufacturer(rs.getString(5));
					product.setCategory(rs.getString(6));
					product.setPinstock(rs.getInt(7));
					product.setconditions(rs.getString(8));
					product.setFilename(rs.getString(9));
					product.setActivation(rs.getInt(10));
					
					listProducts.add(product);	// 객체 리스트 담기
				}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			
			
		return listProducts;
	}
	

	// 메소드 : 제품 추가
	public int setuser(User user) {
		
		String SQL = "insert into user values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getBirth());
			pstmt.setString(6, user.getEmail());
			pstmt.setString(7, user.getPhone());
			pstmt.setString(8, user.getAddress());
			pstmt.setString(9, user.getEnterday());
			pstmt.setInt(10, user.getAdmin());
			
			pstmt.executeUpdate();
			
			return 1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return -1;
	}
	public int modifyProduct(Product product) {
		String SQL = "UPDATE market SET pname=?, pprice=?, description=?, manufacturer=?, category=?, pinstock=?, conditions=?, filename=? where productID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, product.getPname());
			pstmt.setInt(2, product.getPprice());
			pstmt.setString(3, product.getDescription());
			pstmt.setString(4, product.getManufacturer());
			pstmt.setString(5, product.getCategory());
			pstmt.setInt(6, product.getPinstock());
			pstmt.setString(7, product.getconditions());
			pstmt.setString(8, product.getFilename());
			pstmt.setString(9, product.getProductID());
			
			
			pstmt.executeUpdate();
			
			return 1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return -1;
	}
	public int delete(String ProductID) {
		String SQL = "DELETE FROM market where productID=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ProductID);
			
			pstmt.executeUpdate();
			
			return 1;
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return -1;
	}
	public int activeupdate(String ProductID, int activecheck) {
		String SQL = "UPDATE market SET activation=? where productID=?";
		
		int activation = -1;
		
		if(activecheck == 1) {
			activation = 0;
		}
		else {
			activation = 1;
		}
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			
			pstmt.setInt(1, activation);
			pstmt.setString(2, ProductID);
			
			pstmt.executeUpdate();
			
			return 1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return -1;
	}
	public int nactive(String ProductID) {
		String SQL = "UPDATE market SET activation=? where productID=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 0);
			pstmt.setString(2, ProductID);
			
			pstmt.executeUpdate();
			
			return 1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	public int active(String ProductID) {
		String SQL = "UPDATE market SET activation=? where productID=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 1);
			pstmt.setString(2, ProductID);
			
			pstmt.executeUpdate();
			
			return 1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	
	
	
}
