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

  static Map<String, dynamic> toSingUpJson(
    String firstName,
    String lastName,
    String email,
    String password,
  ) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    data['firstname'] = firstName;
    data['lastname'] = lastName;
    return data;
  }

  static Map<String, dynamic> toLoginJson(
    String email,
    String password,
  ) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
