import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/components/app_text_field.dart';
import 'package:sabka_bazar_flutter_app/components/copyright_widget.dart';
import 'package:sabka_bazar_flutter_app/components/my_app_bar.dart';
import 'package:sabka_bazar_flutter_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Text(
            'Login',
            style: TextStyle(
              // fontFamily: 'Pacifico',
              fontSize: 30.0,
              // color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              'Get access to your Orders, Wishlist and Recommendations',
              textAlign: TextAlign.center,
              style: TextStyle(
                  // fontFamily: 'SourceSansPro',
                  // fontWeight: FontWeight.bold,
                  // fontSize: 20.0,
                  // letterSpacing: 2.5,
                  // color: Colors.teal[100],
                  ),
            ),
          ),
          SizedBox(height: 30),
          AppTextField(
            labelText: "Email",
            hintText: "Enter your Email",
            keyboardType: TextInputType.emailAddress,
          ),
          AppTextField(
            labelText: "Password",
            hintText: "Enter your password",
            isSecureText: true,
          ),
          SizedBox(height: 30),
          AppButton(
            buttonText: "Login",
            onPressed: () => _loginBtnTapped(),
          ),
          Expanded(
            child: Container(),
          ),
          CopyrightWidget(),
        ],
      ),
    );
  }

  void _loginBtnTapped() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
  }
}
