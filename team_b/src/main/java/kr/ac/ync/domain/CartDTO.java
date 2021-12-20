package kr.ac.ync.domain;

public class CartDTO {
		private Long cart_num;
	    private String USERID;
	    private Long game_num; 
	    private int QUANTITY;

	    private String title;
	    private String platform;
	    private int price;
	    private double sale_price;
	    private int salePrice;
	    private int totalPrice;

	    public void initSaleTotal() {
			this.salePrice = (int) (this.price * (1-this.sale_price));
			this.totalPrice = this.salePrice*this.QUANTITY;
		}

		public Long getCart_num() {
			return cart_num;
		}

		public void setCart_num(Long cart_num) {
			this.cart_num = cart_num;
		}

		public String getUSERID() {
			return USERID;
		}

		public void setUSERID(String uSERID) {
			USERID = uSERID;
		}

		public Long getGame_num() {
			return game_num;
		}

		public void setGame_num(Long game_num) {
			this.game_num = game_num;
		}

		public int getQUANTITY() {
			return QUANTITY;
		}

		public void setQUANTITY(int qUANTITY) {
			QUANTITY = qUANTITY;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public int getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}

		public double getSale_price() {
			return sale_price;
		}

		public void setSale_price(double sale_price) {
			this.sale_price = sale_price;
		}

		public int getSalePrice() {
			return salePrice;
		}

		public void setSalePrice(int salePrice) {
			this.salePrice = salePrice;
		}

		public int getTotalPrice() {
			return totalPrice;
		}

		public void setTotalPrice(int totalPrice) {
			this.totalPrice = totalPrice;
		}

		@Override
		public String toString() {
			return "CartDTO ["
					+ "cart_num=" + cart_num + 
					", USERID=" + USERID + 
					", game_num=" + game_num + 
					", QUANTITY=" + QUANTITY +
					", title=" + title + 
					", price=" + price + 
					", platform=" + platform + 
					", sale_price=" + sale_price + 
					", salePrice=" + salePrice + 
					", totalPrice=" + totalPrice 
					+ "]";
		}

		public String getPlatform() {
			return platform;
		}

		public void setPlatform(String platform) {
			this.platform = platform;
		}
		

	    
}
