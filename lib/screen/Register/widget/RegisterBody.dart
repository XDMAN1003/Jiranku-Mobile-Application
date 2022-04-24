import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/FormTextField.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/LoginRegisterFormHeader.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/NewButton.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/ParagraphText.dart';
import 'package:fyp_project_v2/screen/Register/RegisterViewModel.dart';

import '../../view.dart';

class RegisterBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  void _onSignUp(BuildContext context, RegisterViewModel viewmodel) async {
    final User? _user = await viewmodel.registration();
    print(_user);
    if (_user != null) Navigator.pop(context, _user);
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
      viewmodel: RegisterViewModel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) {
        //viewmodel.preference = "TTT";
        return SingleChildScrollView(
          child: Column(children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0.0),
              child: Column(children: [
                SizedBox(
                  height: 10.0,
                ),
                LoginRegisterFormHeader(
                  firstTitle: "Register",
                  secondTitle: "Create a new account",
                ),
                SizedBox(
                  height: 10.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormTextField(
                        label: "Email",
                        initialValue: "brother0330@gmail.com",
                        onChange: (val) => viewmodel.email = val,
                        validator: (val) => !(isEmail(val))
                            ? "\u26A0 Enter a valid an email address"
                            : null,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        initialValue: "123456",
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
                        onChanged: (value) {
                          viewmodel.password = value;
                          print(viewmodel.password);
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        initialValue: "123456",
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
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
                        validator: (val) => !(viewmodel.password == val)
                            ? "${viewmodel.password}"
                            : null,
                        onChanged: (value) => viewmodel.confirmPassword = value,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FormTextField(
                        label: "Full Name",
                        initialValue: "Lim Bao Ren",
                        onChange: (val) => viewmodel.fullName == val,
                        validator: (val) =>
                            (val.length < 1) ? "Enter a valid full name" : null,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FormTextField(
                        label: "Username",
                        initialValue: "XDMAN",
                        onChange: (val) => viewmodel.username = val,
                        validator: (val) =>
                            (val.length < 1) ? "Enter a valid username" : null,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      _buildDropDown(
                          label: "Gender",
                          items: ["Male", "Female"],
                          onChanged: (val) => viewmodel.gender = val),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildDropDown(
                          label: "Races",
                          items: ["Malay", "Chinese", "Indian", "Others"],
                          onChanged: (val) => viewmodel.races = val),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("Field of Interest",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5.0,
                      ),

                      //["Local Business", "Job Seek", "COVID-19 News", "Property"].map<Text>((e) => Text(e)).toList(),
                      Row(
                        children: [
                          _buildCheckBox(viewmodel, "Local Business", 0),
                          _buildCheckBox(viewmodel, "Job Seek", 1),
                        ],
                      ),
                      Row(
                        children: [
                          _buildCheckBox(viewmodel, "COVID-19 News", 2),
                          _buildCheckBox(viewmodel, "Property", 3),
                        ],
                      ),
                      Row(
                        children: [
                          _buildCheckBox(viewmodel, "Food Shop", 4),
                          _buildCheckBox(viewmodel, "Seek for Help", 5),
                        ],
                      ),
                      Row(
                        children: [
                          _buildCheckBox(viewmodel, "Local Business", 6),
                          _buildCheckBox(viewmodel, "Fashion", 7),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      FormTextField(
                        label: "Address 1",
                        initialValue:
                            "706A, Jalan Jasmin 6, 00000 Sungai Tawar",
                        validator: (val) =>
                            (val.length < 1) ? "Enter a valid address" : null,
                        onChange: (val) => viewmodel.address = val,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      NewButton(
                        label: "Sign Up",
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('''Checking for the user biodata: \n 
                                        Email: ${viewmodel.email}\n 
                                        Password: ${viewmodel.password}\n
                                        Confirm Password: ${viewmodel.confirmPassword}\n
                                        Address: ${viewmodel.address}\n
                                        Full Name: ${viewmodel.fullName}\n
                                        Username: ${viewmodel.username}\n
                                        Gender: ${viewmodel.gender}\n
                                        Races: ${viewmodel.races}\n
                                        Preference: ${viewmodel.preference}\n
                                        ''')),
                            );
                            final _result = await viewmodel.registration();
                            if (_result != null) {
                              Navigator.pop(context, _result);
                            }
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ParagraphText(
                              title: "Already Have Account?", size: 15.0),
                          TextButton(
                              onPressed: () => Navigator.pop(context, null),
                              child: ParagraphText(
                                title: "Sign In",
                                size: 15.0,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                )
              ]),
            )
          ]),
        );
      },
    );
  }

  Expanded _buildCheckBox(viewmodel, label, index) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Checkbox(
            value:
                (viewmodel.preference.substring((index), (index + 1)) == "T"),
            onChanged: (bool? value) {
              print(viewmodel.preference.substring((index), (index + 1)));
              (value!)
                  ? viewmodel.preference =
                      replaceCharAt(viewmodel.preference, index, "T")
                  : viewmodel.preference =
                      replaceCharAt(viewmodel.preference, index, "F");
            },
          ),
          Text(
            "$label",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  DropdownButtonFormField _buildDropDown({label, items, onChanged}) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      value: items[0],
      items: items.map<DropdownMenuItem>((item) {
        return DropdownMenuItem(
          child: Text('${item}'),
          value: item,
        );
      }).toList(),
      validator: (val) => (val == null) ? "$label must be selected" : null,
      onChanged: onChanged,
    );
  }
}
