import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/Model/loginModel.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/login_bloc.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_text_field.dart';
import 'package:sabka_bazar_flutter_app/src/components/copyright_widget.dart';
import 'package:sabka_bazar_flutter_app/src/components/my_app_bar.dart';
import 'package:sabka_bazar_flutter_app/src/components/unfilled_app_button.dart';
import 'package:sabka_bazar_flutter_app/src/resources/app_util_class.dart';
import 'package:sabka_bazar_flutter_app/src/screens/home_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/login_screen.dart';
import 'package:sabka_bazar_flutter_app/src/validation/field_validation.dart';

class SignupScreen extends StatefulWidget {
  static const String routName = "/signup";

  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _bloc = LoginSignupBloc();

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
    _bloc.dispose();
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
      ValidationResult firstNameResult =
          FieldValidation.validateFirstName(firstNameText);
      _firstNameErrorText = firstNameResult.message;
      if (firstNameResult.isValid) validCount++;

      // Validation for last name
      ValidationResult lastNameResult =
          FieldValidation.validateLastName(lastNameText);
      _lastNameErrorText = lastNameResult.message;
      if (lastNameResult.isValid) validCount++;

      // Validation for email
      ValidationResult emailResult = FieldValidation.validateEmail(emailText);
      _emailErrorText = emailResult.message;
      if (emailResult.isValid) validCount++;

      // Validation for password
      ValidationResult passwordResult =
          FieldValidation.validatePassword(passwordText);
      _passwordErrorText = passwordResult.message;
      if (passwordResult.isValid) validCount++;

      // Validation for confirm password
      ValidationResult confirmPasswordResult =
          FieldValidation.validatePassword(confirmPasswordText);
      _confirmPasswordErrorText = confirmPasswordResult.message;
      if (confirmPasswordResult.isValid) validCount++;

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

  Future<void> _signupBtnTapped() async {
    if (_isLoginValid()) {
      AppUtilClass.showSnackBar(context, 'Signing...', 10000);

      final paraData = {
        'firstname': _firstNameController.text.trim(),
        'lastname': _lastNameController.text.trim(),
        'email': _emailController.text.trim(),
        'password': _passwordController.text.trim(),
      };

      LoginModel result = await _bloc.hitSignupAPI(paraData);
      AppUtilClass.showSnackBar(context, result.responseMessage.toString(), 5);

      if (result.response.toString().toLowerCase() == 'success') {
        AppUtilClass.saveCartCount(result.cartCount ?? 0);
        Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
      }
    } else {
      AppUtilClass.showSnackBar(
          context, 'One or more field(s) is incorrect', 5);
    }
  }
}
