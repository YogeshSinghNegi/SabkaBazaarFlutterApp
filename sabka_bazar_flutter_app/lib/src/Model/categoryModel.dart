class categoryModel {
  String? id;
  String? name;
  String? key;
  String? description;
  bool? enabled;
  int? order;
  String? imageUrl;

  categoryModel(
      {this.name,
      this.id,
      this.key,
      this.description,
      this.enabled,
      this.order,
      this.imageUrl});

  categoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    key = json['key'];
    description = json['description'];
    enabled = json['enabled'];
    order = json['order'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['key'] = this.key;
    data['description'] = this.description;
    data['enabled'] = this.enabled;
    data['order'] = this.order;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
