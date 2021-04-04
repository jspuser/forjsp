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
	
	
	
	// �ٸ� �������� dao ��ü ����
	private static ProductDao instance = new ProductDao();
	
		public static ProductDao getinstance() {
			return instance;
		}
	
	// ������
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
			// SQL �ۼ�
		String SQL = "SELECT * FROM market where productID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ProductID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	// ���� ������ null ����
				
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
	
	// �޼ҵ� : ��� ��ǰ ȣ��
	public ArrayList<Product> getallProducts(){
		
		ArrayList<Product> listProducts = new ArrayList<Product>();
		
			String SQL = "SELECT * FROM market";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
					// ���� : �˻� ����� ���ڵ�[ ���̺� ���δ��� ]
				while(rs.next()) {	// ���� ����� null �϶����� �ݺ�
					
					// �Ѱ��� ���ڵ��� ��� �ʵ带 �� ��ü�� ����
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
					
					listProducts.add(product);	// ��ü ����Ʈ ���
				}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			
			
		return listProducts;
	}
	
	public ArrayList<Product> getsearchedProducts(String key, String keyword){	// �˻� ��ǰ �ҷ�����
		
		ArrayList<Product> listProducts = new ArrayList<Product>();
		
			String SQL = "SELECT * FROM market where "+key+" like '%"+keyword+"%'";
													// �˻����� �ʵ忡 ���Ե� �ʵ� ã��
													// �ʵ�� like '%�˻���%'
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
					// ���� : �˻� ����� ���ڵ�[ ���̺� ���δ��� ]
				while(rs.next()) {	// ���� ����� null �϶����� �ݺ�
					
					// �Ѱ��� ���ڵ��� ��� �ʵ带 �� ��ü�� ����
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
					
					listProducts.add(product);	// ��ü ����Ʈ ���
				}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			
			
		return listProducts;
	}
	

	// �޼ҵ� : ��ǰ �߰�
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
	
	// �ֹ���ȣ�� ȣ���ϴ� �޼ҵ�
	
	
	
	
}
