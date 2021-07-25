import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_text_field.dart';
import 'package:sabka_bazar_flutter_app/src/components/copyright_widget.dart';
import 'package:sabka_bazar_flutter_app/src/components/my_app_bar.dart';
import 'package:sabka_bazar_flutter_app/src/components/unfilled_app_button.dart';
import 'package:sabka_bazar_flutter_app/src/screens/home_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const String routName = "/signup";

  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                    SizedBox(height: 40),
                    Text(
                      'Signup',
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
                        'We do not share your personal details with anyone.',
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
                    SizedBox(height: 20),
                    AppTextField(
                      labelText: "First Name",
                      hintText: "Enter your First Name",
                      keyboardType: TextInputType.name,
                    ),
                    AppTextField(
                      labelText: "Last Name",
                      hintText: "Enter your Last Name",
                      keyboardType: TextInputType.name,
                    ),
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
                    AppTextField(
                      labelText: "Confirm Password",
                      hintText: "Enter your Confirm password",
                      isSecureText: true,
                    ),
                    SizedBox(height: 30),
                    AppButton(
                      buttonText: "Signup",
                      onPressed: () => _signupBtnTapped(),
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
                          'Already have an account?',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 20),
                        UnfilledAppButton(
                          buttonText: 'Login',
                          onPressed: () => _loginBtnTapped(),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
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

  void _loginBtnTapped() {
    Navigator.of(context).pushReplacementNamed(LoginScreen.routName);
  }

  void _signupBtnTapped() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
  }
}
