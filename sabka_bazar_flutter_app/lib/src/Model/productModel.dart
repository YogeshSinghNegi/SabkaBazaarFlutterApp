class ProductModel {
  String? id;
  String? name;
  String? description;
  String? imageURL;
  int? price;
  int? stock;
  String? category;
  String? sku;

  ProductModel(
      {this.id,
      this.name,
      this.description,
      this.imageURL,
      this.price,
      this.stock,
      this.category,
      this.sku});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageURL = json['imageURL'];
    price = json['price'];
    stock = json['stock'];
    category = json['category'];
    sku = json['sku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageURL'] = this.imageURL;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['category'] = this.category;
    data['sku'] = this.sku;
    return data;
  }
}
