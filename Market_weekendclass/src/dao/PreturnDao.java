package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

import dto.Order_detail;
import dto.Preturn;
import dto.Product;
import dto.User;

public class PreturnDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	
	// 다른 페이지에 dao 객체 생성
	private static PreturnDao instance = new PreturnDao();
	
		public static PreturnDao getinstance() {
			return instance;
		}
	
	// 생성자
	public PreturnDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs_weekend?serverTimezone=UTC", "root", "1234");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	
	public int setreturn( Preturn preturn) {
		
		String SQL = "insert into preturn values(?,?,?,?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, preturn.getDetail_id());
			pstmt.setString(2, preturn.getDetail_productid());
			pstmt.setInt(3, preturn.getDetail_quantity());
			pstmt.setString(4, preturn.getReason());
			
			pstmt.executeUpdate();
			
			return 1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	
	// 주문 id에 해당하는 상세정보 호출
	public ArrayList<Order_detail> getdetails(int orderid){
		
		String SQL = "SELECT * FROM porder_detail where detail_order_id=?";
		
		ArrayList<Order_detail> list = new ArrayList<Order_detail>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, orderid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Order_detail detail = new Order_detail();
				
				detail.setDetail_id(rs.getInt(1));
				detail.setDetail_order_id(rs.getInt(2));
				detail.setDetail_productid(rs.getString(3));
				detail.setDetail_quantity(rs.getInt(1));
				
				list.add(detail);
				
			}
			return list;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	
	
	
}
