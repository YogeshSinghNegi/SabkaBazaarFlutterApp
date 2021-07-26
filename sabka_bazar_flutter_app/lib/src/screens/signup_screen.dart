import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_text_field.dart';
import 'package:sabka_bazar_flutter_app/src/components/copyright_widget.dart';
import 'package:sabka_bazar_flutter_app/src/components/my_app_bar.dart';
import 'package:sabka_bazar_flutter_app/src/components/unfilled_app_button.dart';
import 'package:sabka_bazar_flutter_app/src/extensions/string_extension.dart';
import 'package:sabka_bazar_flutter_app/src/screens/home_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const String routName = "/signup";

  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _firstNameErrorText = '';
  String _lastNameErrorText = '';
  String _emailErrorText = '';
  String _passwordErrorText = '';
  String _confirmPasswordErrorText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameController.text = '';
    _lastNameController.text = '';
    _emailController.text = '';
    _passwordController.text = '';
    _confirmPasswordController.text = '';
    _firstNameErrorText = '';
    _lastNameErrorText = '';
    _emailErrorText = '';
    _passwordErrorText = '';
    _confirmPasswordErrorText = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                      controller: _firstNameController,
                      errorText: _firstNameErrorText,
                      onTextChange: () =>
                          setState(() => _firstNameErrorText = ''),
                    ),
                    AppTextField(
                      labelText: "Last Name",
                      hintText: "Enter your Last Name",
                      keyboardType: TextInputType.name,
                      controller: _lastNameController,
                      errorText: _lastNameErrorText,
                      onTextChange: () =>
                          setState(() => _lastNameErrorText = ''),
                    ),
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
                    AppTextField(
                      labelText: "Confirm Password",
                      hintText: "Enter your Confirm password",
                      isSecureText: true,
                      controller: _confirmPasswordController,
                      errorText: _confirmPasswordErrorText,
                      onTextChange: () =>
                          setState(() => _confirmPasswordErrorText = ''),
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

  bool _isLoginValid() {
    int validCount = 0;
    String firstNameText = _firstNameController.text.trim();
    String lastNameText = _lastNameController.text.trim();
    String emailText = _emailController.text.trim();
    String passwordText = _passwordController.text.trim();
    String confirmPasswordText = _confirmPasswordController.text.trim();

    setState(() {
      _firstNameErrorText = '';
      _lastNameErrorText = '';
      _emailErrorText = '';
      _passwordErrorText = '';
      _confirmPasswordErrorText = '';

      // Validation for first name
      if (firstNameText.length > 0 && firstNameText.length < 21)
        validCount++;
      else if (firstNameText.isEmpty)
        _firstNameErrorText = 'First Name cannot be empty';
      else
        _firstNameErrorText =
            'First Name length should be 1-20 characters long';

      // Validation for last name
      if (lastNameText.length > 0 && lastNameText.length < 21)
        validCount++;
      else if (lastNameText.isEmpty)
        _lastNameErrorText = 'Last Name cannot be empty';
      else
        _lastNameErrorText = 'Last Name length should be 1-20 characters long';

      // Validation for email
      if (emailText.isValidEmail())
        validCount++;
      else if (emailText.isEmpty)
        _emailErrorText = 'Email cannot be empty';
      else
        _emailErrorText = 'Enter valid email';

      // Validation for password
      if (passwordText.length > 5 && passwordText.length < 21)
        validCount++;
      else if (passwordText.isEmpty)
        _passwordErrorText = 'Password cannot be empty';
      else
        _passwordErrorText = 'Password length should be 6-20 characters long';

      // Validation for confirm password
      if (confirmPasswordText.length > 5 && confirmPasswordText.length < 21)
        validCount++;
      else if (confirmPasswordText.isEmpty)
        _confirmPasswordErrorText = 'Confirm Password cannot be empty';
      else
        _confirmPasswordErrorText =
            'Confirm Password length should be 6-20 characters long';

      // Validation for password matching with confirm password
      if (validCount == 5) {
        if (passwordText == confirmPasswordText)
          validCount++;
        else
          _confirmPasswordErrorText =
              'Password & Confirm Password does not match';
      }
    });
    return validCount == 6;
  }

  void _loginBtnTapped() {
    Navigator.of(context).pushReplacementNamed(LoginScreen.routName);
  }

  void _signupBtnTapped() {
    if (_isLoginValid())
      Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
  }
}
