package lk.ijse.aadassignment1ecommerce.DTO;

public class CartDTO {
    private int cartId;
    private int userId;
    private int productId;
    private int qty;

    public CartDTO() {
    }

    public CartDTO(int cartId, int userId, int productId, int qty) {
        this.cartId = cartId;
        this.userId = userId;
        this.productId = productId;
        this.qty = qty;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    @Override
    public String toString() {
        return "CartDTO{" +
                "cartId=" + cartId +
                ", userId=" + userId +
                ", productId=" + productId +
                ", qty=" + qty +
                '}';
    }
}
