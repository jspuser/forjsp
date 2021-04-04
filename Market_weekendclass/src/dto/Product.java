package dto;

public class Product {
	
	private String productID;	// ��ǰ���̵�
	private String pname;		// ��ǰ��
	private Integer pprice;		// ��ǰ����
	private String description;	// ��ǰ����
	private String manufacturer;// ��ǰ ������
	private String category; 	// ��ǰ �з�
	private Integer pinstock; 	//��ǰ ����
	private String conditions;	// ����ǰ or ������ǰ
	private String filename;	// ��ǰ �̹���
	private Integer activation;	// ��ǰ Ȱ��ȭ ����
	private Integer quantity;	// īƮ�� ���� ����
	
	
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Integer getPprice() {
		return pprice;
	}
	public void setPprice(Integer pprice) {
		this.pprice = pprice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getPinstock() {
		return pinstock;
	}
	public void setPinstock(Integer pinstock) {
		this.pinstock = pinstock;
	}
	public String getconditions() {
		return conditions;
	}
	public void setconditions(String conditions) {
		this.conditions = conditions;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Integer getActivation() {
		return activation;
	}
	public void setActivation(Integer activation) {
		this.activation = activation;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	
	public Product() {
		
	}
	public Product(String productID, String pname, Integer pprice) {
		this.productID = productID;
		this.pname = pname;
		this.pprice = pprice;
	}
}
