import 'package:flutter/material.dart';
import 'package:fyp_project_v2/app/route.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/FormTextField.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/LoginRegisterFormHeader.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/NewButton.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/ParagraphText.dart';
import 'package:fyp_project_v2/screen/view.dart';

import '../LoginViewModel.dart';

class Body extends StatelessWidget {
  //const LoginForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  void _onLogin(BuildContext context, LoginViewmodel viewmodel) async {
    final User? _user = await viewmodel.authenticate();
    print(_user);
    if (_user != null) {
      Navigator.pop(context, _user);
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Your email and/or password do not match.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }
  }

  void _onFakeLogin(BuildContext context, LoginViewmodel viewmodel) async {
    final User? _user = await viewmodel.authenticate1();
    print(_user);
    if (_user != null) Navigator.pop(context, _user);
  }

  void _onCancel(BuildContext context, LoginViewmodel viewmodel) {
    viewmodel.showErrorMessage = false;
    Navigator.pop(context, null);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    bool isEmail(val) {
      return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(val);
    }

    return View(
      viewmodel: LoginViewmodel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) => SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 2 / 3 + 5,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0.0),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight / 6 - 40.0,
                  ),
                  LoginRegisterFormHeader(
                    firstTitle: "Sign In",
                    secondTitle: "Welcome back to Jiranku application",
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormTextField(
                          label: "Email",
                          onChange: (val) => viewmodel.email = val,
                          validator: (val) => !(isEmail(val))
                              ? "\u26A0 Enter a valid an email address"
                              : null,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () => viewmodel.showPassword =
                                  !viewmodel.showPassword,
                              icon: (viewmodel.showPassword)
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off_outlined),
                            ),
                          ),
                          obscureText: !viewmodel.showPassword,
                          onChanged: (value) => viewmodel.password = value,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        NewButton(
                          label: "Sign In",
                          onPress: () => {
                            if (_formKey.currentState!.validate())
                              {_onLogin(context, viewmodel)}
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ParagraphText(
                          title: "Don't have an account?", size: 15.0),
                      TextButton(
                          onPressed: () async {
                            dynamic regUser = await Navigator.pushNamed(
                                  context, registerScreen);
                            if(regUser != null) Navigator.pop(context, regUser);
                          }
                             ,
                          child: ParagraphText(
                            title: "Sign Up",
                            size: 15.0,
                          )),
                    ],
                  ),
                  TextButton(
                      onPressed: () => _onFakeLogin(context, viewmodel),
                      child: Text("Auto Login")),
                ],
              ),
            ),
            LoginFormFooter(screenHeight)
          ],
        ),
      ),
    );
  }

  Container LoginFormFooter(double screenHeight) {
    return Container(
      width: double.infinity,
      height: screenHeight * 1 / 3 - 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("asset/Malaysia.png"),
        ),
      ),
    );
  }
}
