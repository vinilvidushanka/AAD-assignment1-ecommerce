package lk.ijse.aadassignment1ecommerce.DTO;

public class ItemDTO {
    private int id;
    private String name;
    private String description;
    private double price;
    private int categoryId;
    private int stock;
    private String url;

    public ItemDTO() {
    }

    public ItemDTO(int id, String name, String description, double price, int categoryId, int stock, String url) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.categoryId = categoryId;
        this.stock = stock;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "ItemDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", categoryId=" + categoryId +
                ", stock=" + stock +
                ", url='" + url + '\'' +
                '}';
    }
}
