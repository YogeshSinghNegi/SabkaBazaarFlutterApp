import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_text_field.dart';
import 'package:sabka_bazar_flutter_app/src/components/copyright_widget.dart';
import 'package:sabka_bazar_flutter_app/src/components/my_app_bar.dart';
import 'package:sabka_bazar_flutter_app/src/components/show_alert_dialog.dart';
import 'package:sabka_bazar_flutter_app/src/components/unfilled_app_button.dart';
import 'package:sabka_bazar_flutter_app/src/screens/home_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/signup_screen.dart';
import 'package:sabka_bazar_flutter_app/src/validation/field_validation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _emailErrorText = '';
  String _passwordErrorText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text = '';
    _passwordController.text = '';
    _emailErrorText = '';
    _passwordErrorText = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                      errorText: _emailErrorText,
                      onTextChange: () => setState(() => _emailErrorText = ''),
                    ),
                    AppTextField(
                      labelText: "Password",
                      hintText: "Enter your password",
                      isSecureText: true,
                      controller: _passwordController,
                      errorText: _passwordErrorText,
                      onTextChange: () =>
                          setState(() => _passwordErrorText = ''),
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
    int validCount = 0;
    String emailText = _emailController.text.trim();
    String passwordText = _passwordController.text.trim();

    setState(() {
      _emailErrorText = '';
      _passwordErrorText = '';

      // Validation for email
      ValidationResult emailResult = FieldValidation.validateEmail(emailText);
      _emailErrorText = emailResult.message;
      if (emailResult.isValid) validCount++;

      // Validation for password
      ValidationResult passwordResult =
          FieldValidation.validatePassword(passwordText);
      _passwordErrorText = passwordResult.message;
      if (passwordResult.isValid) validCount++;
    });
    return validCount == 2;
  }

  Future<void> _saveUserDataInPreferences() async {
    //TODO: this is how we can save information is user default after successful login/signup
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // int counter = (prefs.getInt('counter') ?? 0) + 1;
    // print('Pressed $counter times.');
    // await prefs.setInt('counter', counter);
  }

  void _loginBtnTapped() {
    if (_isLoginValid()) {
      //TODO: Hit Login API here
      _saveUserDataInPreferences();

      //TODO: to show custom dialog
      showMyDialog(context, 'title', [
        Text('text1')
      ], [
        TextButton(
          child: Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
          },
        ),
      ]);
    }
  }

  void _signupBtnTapped() {
    Navigator.of(context).pushReplacementNamed(SignupScreen.routName);
  }
}
