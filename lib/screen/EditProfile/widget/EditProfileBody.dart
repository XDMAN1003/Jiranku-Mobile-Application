import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/FormTextField.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/LoginRegisterFormHeader.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/NewButton.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/ParagraphText.dart';
import 'package:fyp_project_v2/screen/Register/RegisterViewModel.dart';

import '../../view.dart';
import '../EditProfileViewModel.dart';

class EditProfileBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  void _onUpdateUser(BuildContext context, EditProfileViewModel viewmodel) async {
    viewmodel.fullName = (viewmodel.fullName == "") ? viewmodel.user.fullName: viewmodel.fullName;
    viewmodel.username = (viewmodel.username == "") ? viewmodel.user.username: viewmodel.username;
    viewmodel.email = (viewmodel.email == "") ? viewmodel.user.email: viewmodel.email;
    viewmodel.gender = (viewmodel.gender == "") ? viewmodel.user.gender: viewmodel.gender;
    viewmodel.races = (viewmodel.races == "") ? viewmodel.user.races: viewmodel.races;
    viewmodel.address = (viewmodel.address == "") ? viewmodel.user.address: viewmodel.address;
    viewmodel.password = (viewmodel.password == "") ? viewmodel.user.password: viewmodel.password;
    viewmodel.identity = (viewmodel.identity == "") ? viewmodel.user.identity: viewmodel.identity;
    viewmodel.userID = (viewmodel.userID == "") ? viewmodel.user.userID: viewmodel.userID;
    viewmodel.invitationCode = (viewmodel.invitationCode == "") ? viewmodel.user.invitationCode: viewmodel.invitationCode;
    final User? _user = await viewmodel.updateUser();
    if (_user != null) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
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
      viewmodel: EditProfileViewModel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) {
        //viewmodel.preference = "TTT";
        return SingleChildScrollView(
          child: Column(children: [
            Column(children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    //padding: EdgeInsets.fromLTRB(10, 20.0, 10, 20.0),
                    child: ClipRRect(
                      child: Opacity(
                          opacity: 0.95,
                          child: Image.asset(
                            "asset/editProfile.jpg",
                            fit: BoxFit.cover,
                          )),
                      //borderRadius: BorderRadius.circular(16),
                    ),
                    height: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 18,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  Positioned(
                      bottom: -20.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[50],
                        backgroundImage: AssetImage((viewmodel.user.gender == "Male")
                            ? "asset/man.png"
                            : "asset/woman.png"),
                        radius: 50.0,
                      )),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "${viewmodel.user.userID} | ${viewmodel.user.identity}",
                style: TextStyle(fontFamily: "Acme"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormTextField(
                        label: "Email",
                        initialValue: viewmodel.user.email,
                        onChange: (val) => viewmodel.email = val,
                        validator: (val) => !(isEmail(val))
                            ? "\u26A0 Enter a valid an email address"
                            : null,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        initialValue: viewmodel.user.password,
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
                        initialValue: viewmodel.user.password,
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
                            ? "Password and Confirm Password not match"
                            : null,
                        onChanged: (value) => viewmodel.confirmPassword = value,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FormTextField(
                        label: "Full Name",
                        initialValue: viewmodel.user.fullName,
                        onChange: (val) => viewmodel.fullName = val,
                        validator: (val) =>
                            (val.length < 1) ? "Enter a valid full name" : null,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FormTextField(
                        label: "Username",
                        initialValue: viewmodel.user.username,
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
                          initialValue: viewmodel.user.gender,
                          onChanged: (val) => viewmodel.gender = val),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildDropDown(
                          label: "Races",
                          initialValue: viewmodel.user.races,
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
                          _buildCheckBox(viewmodel, "Local News", 0),
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
                        initialValue: viewmodel.user.address,
                        validator: (val) =>
                            (val.length < 1) ? "Enter a valid address" : null,
                        onChange: (val) => viewmodel.address = val,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UpdateCancelButton(
                              context: context,
                              label: "UPDATE",
                              onPress: () =>
                                  _showProfile(context, viewmodel: viewmodel),
                              color: Colors.lightBlue[200]),
                          UpdateCancelButton(
                              context: context,
                              label: "CANCEL",
                              onPress: () {
                                Navigator.pop(context);
                              },
                              color: Colors.red[400])
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ])
          ]),
        );
      },
    );
  }

  MaterialButton UpdateCancelButton({context, label, onPress, color}) {
    return MaterialButton(
        height: 60.0,
        minWidth: (MediaQuery.of(context).size.width - 40.0) / 2,
        onPressed: onPress,
        color: color,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          "$label",
          style: TextStyle(
              fontSize: 20.0, color: Color(0XFFFFFFF0), fontFamily: "Acme"),
        ));
  }

Expanded _buildCheckBox(viewmodel, label, index) {
    dynamic user_preference = viewmodel.preference.substring((index), (index + 1));
    //dynamic initial_preference = viewmodel.user.preference.substring((index), (index + 1));
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Text(user_preference),
          Checkbox(
            value:
                (user_preference == "T") ,
            onChanged: (bool? value) {
              print(user_preference);
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
  
dynamic _showProfile(context, {viewmodel}) {
    // viewmodel.fullName = (viewmodel.fullName == "") ? viewmodel.user.fullName: viewmodel.fullName;
    // viewmodel.username = (viewmodel.username == "") ? viewmodel.user.username: viewmodel.username;
    // viewmodel.email = (viewmodel.email == "") ? viewmodel.user.email: viewmodel.email;
    // viewmodel.gender = (viewmodel.gender == "") ? viewmodel.user.gender: viewmodel.gender;
    // viewmodel.races = (viewmodel.races == "") ? viewmodel.user.races: viewmodel.races;
    // viewmodel.address = (viewmodel.address == "") ? viewmodel.user.address: viewmodel.address;
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: ClipRRect(
                        child: Opacity(
                            opacity: 0.5,
                            child: Image.asset(
                              "asset/profile.png",
                              fit: BoxFit.cover,
                            )),
                        //borderRadius: BorderRadius.circular(16),
                      ),
                      height: MediaQuery.of(context).size.height / 4 + 60.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 18,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ], borderRadius: BorderRadius.circular(16)),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      width: double.maxFinite,
                      child: MaterialButton(
                              height: 60.0,
                              onPressed: () => _onUpdateUser(context, viewmodel),
                              color: Colors.lightBlue[200],
                              elevation: 0,
                              minWidth: 156.30,
                              child: Text(
                                "CONFIRM",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0XFFFFFFF0),
                                    fontFamily: "Acme"),
                              )),
                    ),
                     Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      width: double.maxFinite,
                      child: MaterialButton(
                              height: 60.0,
                              onPressed: () => Navigator.pop(context),
                              color: Colors.red[400],
                              elevation: 0,
                              minWidth: 156.30,
                              child: Text(
                                "CANCEL",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0XFFFFFFF0),
                                    fontFamily: "Acme"),
                              )),
                    ),
                    
                
                  ],
                ),
                Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.disabled_by_default,
                        color: Colors.grey[800],
                      ),
                      onPressed: () => Navigator.pop(context),
                    )),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardText(
                            label: "Name", size: 12.0, color: Colors.grey[600]),
                        CardText(
                            label:
                                "${(viewmodel.fullName == "") ? viewmodel.user.fullName: viewmodel.fullName} (${(viewmodel.username == "") ? viewmodel.user.username: viewmodel.username})",
                            size: 18.0,
                            color: Colors.grey[800]),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardText(
                                label: "Gender",
                                size: 12.0,
                                color: Colors.grey[600]),
                            SizedBox(
                              width: 50.0,
                            ),
                            Expanded(
                              child: CardText(
                                  label: "Races",
                                  size: 12.0,
                                  color: Colors.grey[600]),
                              flex: 3,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardText(
                                label: (viewmodel.gender == "") ? viewmodel.user.gender: viewmodel.gender,
                                size: 18.0,
                                color: Colors.grey[800]),
                            SizedBox(
                              width: 50.0,
                            ),
                            Expanded(
                              child: CardText(
                                  label: (viewmodel.races == "") ? viewmodel.user.races: viewmodel.races,
                                  size: 18.0,
                                  color: Colors.grey[800]),
                              flex: 3,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        CardText(
                            label: "Email",
                            size: 12.0,
                            color: Colors.grey[600]),
                        CardText(
                            label: (viewmodel.email == "") ? viewmodel.user.email: viewmodel.email,
                            size: 18.0,
                            color: Colors.grey[800]),
                        SizedBox(
                          height: 5.0,
                        ),
                        CardText(
                            label: "Preference",
                            size: 12.0,
                            color: Colors.grey[600]),
                        Row(
                          children: [
                            (viewmodel.preference.substring((0), (0 + 1)) ==
                                    "T")
                                ? Icon(
                                    Icons.article,
                                    size: 30.0,
                                    color: Colors.grey[800],
                                  )
                                : Icon(
                                    Icons.article_outlined,
                                    size: 30.0,
                                    color: Colors.grey[400],
                                  ),
                            (viewmodel.preference.substring((1), (1 + 1)) ==
                                    "T")
                                ? Icon(
                                    Icons.work,
                                    size: 30.0,
                                    color: Colors.grey[800],
                                  )
                                : Icon(
                                    Icons.work_outlined,
                                    size: 30.0,
                                    color: Colors.grey[400],
                                  ),
                            (viewmodel.preference.substring((2), (2 + 1)) ==
                                    "T")
                                ? Icon(
                                    Icons.coronavirus,
                                    size: 30.0,
                                    color: Colors.grey[800],
                                  )
                                : Icon(
                                    Icons.coronavirus_outlined,
                                    size: 30.0,
                                    color: Colors.grey[400],
                                  ),
                            (viewmodel.preference.substring((3), (3 + 1)) ==
                                    "T")
                                ? Icon(
                                    Icons.home,
                                    size: 30.0,
                                    color: Colors.grey[800],
                                  )
                                : Icon(
                                    Icons.home_outlined,
                                    size: 30.0,
                                    color: Colors.grey[400],
                                  ),
                            (viewmodel.preference.substring((4), (4 + 1)) ==
                                    "T")
                                ? Icon(
                                    Icons.restaurant_menu,
                                    size: 30.0,
                                    color: Colors.grey[800],
                                  )
                                : Icon(
                                    Icons.restaurant_menu_outlined,
                                    size: 30.0,
                                    color: Colors.grey[400],
                                  ),
                            (viewmodel.preference.substring((5), (5 + 1)) ==
                                    "T")
                                ? Icon(
                                    Icons.handyman,
                                    size: 30.0,
                                    color: Colors.grey[800],
                                  )
                                : Icon(
                                    Icons.handyman_outlined,
                                    size: 30.0,
                                    color: Colors.grey[400],
                                  ),
                            (viewmodel.preference.substring((6), (6 + 1)) ==
                                    "T")
                                ? Icon(
                                    Icons.business,
                                    size: 30.0,
                                    color: Colors.grey[800],
                                  )
                                : Icon(
                                    Icons.business_outlined,
                                    size: 30.0,
                                    color: Colors.grey[400],
                                  ),
                            (viewmodel.preference.substring((7), (7 + 1)) ==
                                    "T")
                                ? Icon(
                                    Icons.checkroom,
                                    size: 30.0,
                                    color: Colors.grey[800],
                                  )
                                : Icon(
                                    Icons.checkroom_outlined,
                                    size: 30.0,
                                    color: Colors.grey[400],
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        CardText(
                            label: "Address",
                            size: 12.0,
                            color: Colors.grey[600]),
                        CardText(
                            label: (viewmodel.address == "") ? viewmodel.user.address: viewmodel.address,
                            size: 18.0,
                            color: Colors.grey[800]),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
  }

DropdownButtonFormField _buildDropDown(
      {label, items, onChanged, initialValue}) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      value: initialValue,
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

Text CardText({label, size, color, isLabel = false}) => Text(
        label,
        style: TextStyle(
            fontFamily: "Acme",
            fontSize: size,
            color: color,
            fontWeight: (isLabel) ? FontWeight.bold : FontWeight.w300),
      );
}
