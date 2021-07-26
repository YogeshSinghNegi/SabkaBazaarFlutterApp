class OfferModel {
  String? bannerImageUrl;
  String? bannerImageAlt;
  String? isActive;
  int? order;
  String? id;

  OfferModel(
      {this.bannerImageUrl,
      this.bannerImageAlt,
      this.isActive,
      this.order,
      this.id});

  OfferModel.fromJson(Map<String, dynamic> json) {
    bannerImageUrl = json['bannerImageUrl'];
    bannerImageAlt = json['bannerImageAlt'];
    isActive = json['isActive'];
    order = json['order'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bannerImageUrl'] = this.bannerImageUrl;
    data['bannerImageAlt'] = this.bannerImageAlt;
    data['isActive'] = this.isActive;
    data['order'] = this.order;
    data['id'] = this.id;
    return data;
  }
}
