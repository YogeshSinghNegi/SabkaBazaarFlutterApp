class CategoryModel {
  String? id;
  String? categoryId;
  String? name;
  String? key;
  String? description;
  bool? enabled;
  int? order;
  String? imageUrl;

  CategoryModel({
    this.name,
    this.categoryId,
    this.id,
    this.key,
    this.description,
    this.enabled,
    this.order,
    this.imageUrl,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'] == null
        ? '5b6899953d1a866534f516e2'
        : json['categoryId'];
    name = json['name'];
    key = json['key'];
    description = json['description'];
    enabled = json['enabled'];
    order = json['order'];
    imageUrl =
        json['imageUrl'] == null ? 'assets/images/logo.png' : json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['name'] = this.name;
    data['key'] = this.key;
    data['description'] = this.description;
    data['enabled'] = this.enabled;
    data['order'] = this.order;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
