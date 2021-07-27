import 'dart:async';

import 'package:rxdart/rxdart.dart' show PublishSubject;
import 'package:sabka_bazar_flutter_app/src/Model/loginModel.dart';
import 'package:sabka_bazar_flutter_app/src/resources/repositry.dart';

class LoginSignupBloc {
  final _repository = Repository();
  final _loginFetcher = PublishSubject<LoginModel>();

  Stream<LoginModel> get hitLogin => _loginFetcher.stream;

  Future<LoginModel> hitLoginSignup(Map<String, String> params) async {
    LoginModel loginModel = await _repository.hitLogin(params);
    _loginFetcher.sink.add(loginModel);
    return loginModel;
  }

  dispose() {
    _loginFetcher.close();
  }
}
