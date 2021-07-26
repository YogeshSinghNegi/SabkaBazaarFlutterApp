class CartModel {
  String? productId;
  String? name;
  String? description;
  String? imageURL;
  int? price;
  int? stock;
  String? category;
  String? sku;
  int? qty;

  CartModel(
      {
        this.productId,
        this.name,
        this.description,
        this.imageURL,
        this.price,
        this.stock,
        this.category,
        this.sku,
        this.qty
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageURL = json['imageURL'];
    price = json['price'];
    stock = json['stock'];
    category = json['category'];
    sku = json['sku'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageURL'] = this.imageURL;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['category'] = this.category;
    data['sku'] = this.sku;
    data['qty'] = this.qty;
    return data;
  }
}
