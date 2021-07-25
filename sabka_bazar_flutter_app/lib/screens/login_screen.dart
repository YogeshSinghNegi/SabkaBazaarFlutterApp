import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/components/app_text_field.dart';
import 'package:sabka_bazar_flutter_app/components/copyright_widget.dart';
import 'package:sabka_bazar_flutter_app/components/my_app_bar.dart';
import 'package:sabka_bazar_flutter_app/components/unfilled_app_button.dart';
import 'package:sabka_bazar_flutter_app/extensions/string_extension.dart';
import 'package:sabka_bazar_flutter_app/screens/home_screen.dart';
import 'package:sabka_bazar_flutter_app/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text = '';
    _passwordController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(isHideCartButton: true),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: (MediaQuery.of(context).size.height) / 8),
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
                        'Get access to your Orders, Wishlist and Recommendations.',
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
                      controller: _emailController,
                    ),
                    AppTextField(
                      labelText: "Password",
                      hintText: "Enter your password",
                      isSecureText: true,
                      controller: _passwordController,
                    ),
                    SizedBox(height: 30),
                    AppButton(
                      buttonText: "Login",
                      onPressed: () => _loginBtnTapped(),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'OR',
                      style: TextStyle(
                        // fontFamily: 'SourceSansPro',
                        // fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        // letterSpacing: 2.5,
                        // color: Colors.teal[100],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Do not have an account?',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 20),
                        UnfilledAppButton(
                          buttonText: 'Signup',
                          onPressed: () => _signupBtnTapped(),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          CopyrightWidget(),
        ],
      ),
    );
  }

  bool _isLoginValid() {
    var isValid = false;
    if (_emailController.text.trim().isValidEmail()) isValid = true;
    if (_passwordController.text.trim().length > 5) isValid = true;
    return isValid;
  }

  void _loginBtnTapped() {
    if (_isLoginValid())
      Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
  }

  void _signupBtnTapped() {
    Navigator.of(context).pushReplacementNamed(SignupScreen.routName);
  }
}
