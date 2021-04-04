package dto;

public class Review {
	private Integer detail_id;
	private String detail_productid;
	private String id;
	private String review;
	private Integer review_rate;
	
	public Integer getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(Integer detail_id) {
		this.detail_id = detail_id;
	}
	public String getDetail_productid() {
		return detail_productid;
	}
	public void setDetail_productid(String detail_productid) {
		this.detail_productid = detail_productid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Integer getReview_rate() {
		return review_rate;
	}
	public void setReview_rate(Integer review_rate) {
		this.review_rate = review_rate;
	}

	
}
