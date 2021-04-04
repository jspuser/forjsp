package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Product;

public class ProductDao {
	
	private Connection conn;
	private ResultSet rs;
	
	
	
	// 다른 페이지에 dao 객체 생성
	private static ProductDao instance = new ProductDao();
	
		public static ProductDao getinstance() {
			return instance;
		}
	
	// 생성자
	public ProductDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs_weekend?serverTimezone=UTC", "root", "1234");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	public Product getProduct( String ProductID) {
		
		Product product = null;
			// SQL 작성
		String SQL = "SELECT * FROM market where productID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ProductID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	// 쿼리 시작은 null 부터
				
				product = new Product();
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
				
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return product;
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
	
	public ArrayList<Product> getsearchedProducts(String key, String keyword){	// 검색 제품 불러오기
		
		ArrayList<Product> listProducts = new ArrayList<Product>();
		
			String SQL = "SELECT * FROM market where "+key+" like '%"+keyword+"%'";
													// 검색값이 필드에 포함된 필드 찾기
													// 필드명 like '%검색값%'
			
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
	public int setProduct(Product product) {
		
		String SQL = "insert into market values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, product.getProductID());
			pstmt.setString(2, product.getPname());
			pstmt.setInt(3, product.getPprice());
			pstmt.setString(4, product.getDescription());
			pstmt.setString(5, product.getManufacturer());
			pstmt.setString(6, product.getCategory());
			pstmt.setInt(7, product.getPinstock());
			pstmt.setString(8, product.getconditions());
			pstmt.setString(9, product.getFilename());
			pstmt.setInt(10, product.getActivation());
			
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
			pstmt.setInt(1, 2);
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
	
	// 주문번호를 호출하는 메소드
	
	
	
	
}
