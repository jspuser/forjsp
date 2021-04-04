package dto;

public class Order_detail {
	private Integer detail_id;
	private Integer detail_order_id;
	private String detail_productid;
	private Integer detail_quantity;
	
	public Integer getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(Integer detail_id) {
		this.detail_id = detail_id;
	}
	public Integer getDetail_order_id() {
		return detail_order_id;
	}
	public void setDetail_order_id(Integer detail_order_id) {
		this.detail_order_id = detail_order_id;
	}
	public String getDetail_productid() {
		return detail_productid;
	}
	public void setDetail_productid(String detail_productid) {
		this.detail_productid = detail_productid;
	}
	public Integer getDetail_quantity() {
		return detail_quantity;
	}
	public void setDetail_quantity(Integer detail_quantity) {
		this.detail_quantity = detail_quantity;
	}
	
}
