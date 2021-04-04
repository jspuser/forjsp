package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

import dto.Order_detail;
import dto.Product;
import dto.Review;
import dto.User;

public class ReviewDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	
	// 다른 페이지에 dao 객체 생성
	private static ReviewDao instance = new ReviewDao();
	
		public static ReviewDao getinstance() {
			return instance;
		}
	
	// 생성자
	public ReviewDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs_weekend?serverTimezone=UTC", "root", "1234");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	
	public int setreview( Review review) {
		
		String SQL = "insert into review values(?,?,?,?,?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, review.getDetail_id());
			pstmt.setString(2, review.getDetail_productid());
			pstmt.setString(3, review.getId());
			pstmt.setString(4, review.getReview());
			pstmt.setInt(5, review.getReview_rate());
			
			pstmt.executeUpdate();
			
			return 1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	
	// 주문 id에 해당하는 상세정보 호출
	public ArrayList<Review> getreviews(String productid){
		
		String SQL = "SELECT * FROM review where detail_productid=?";
		
		ArrayList<Review> list = new ArrayList<Review>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, productid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Review review = new Review();
				
				review.setDetail_id(rs.getInt(1));
				review.setDetail_productid(rs.getString(2));
				review.setId(rs.getString(3));
				review.setReview(rs.getString(4));
				review.setReview_rate(rs.getInt(5));
				
				list.add(review);
				
			}
			return list;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	public Order_detail getdetail(int detailID) {
		String SQL = "SELECT * FROM porder_detail where detail_id = ?";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, detailID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Order_detail detail = new Order_detail();
				
				detail.setDetail_id(rs.getInt(1));
				detail.setDetail_order_id(rs.getInt(2));
				detail.setDetail_productid(rs.getString(3));
				detail.setDetail_quantity(rs.getInt(4));
				
				return detail;
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	/*
	public int prepare(String reason, int detailID) {
		String SQL = "SELECT * FROM porder_detail where detail_id=?  ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, detailID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Order_detail detail = new Order_detail();
				
				detail.setDetail_id(rs.getInt(1));
				detail.setDetail_order_id(rs.getInt(2));
				detail.setDetail_productid(rs.getString(3));
				detail.setDetail_quantity(rs.getInt(1));
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}
	*/
	
	
	
}
