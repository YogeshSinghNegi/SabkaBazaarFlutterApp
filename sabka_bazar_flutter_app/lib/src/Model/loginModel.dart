class LoginModel {
  String? response;
  String? responseMessage;
  int? cartCount;

  LoginModel({
    this.response,
    this.responseMessage,
    this.cartCount,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    responseMessage = json['responseMessage'];
    cartCount = json['cartCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['responseMessage'] = this.responseMessage;
    data['cartCount'] = this.cartCount;
    return data;
  }
}
