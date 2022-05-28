import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/NewButton.dart';
import 'package:fyp_project_v2/screen/Home/HomeViewModel.dart';

class SplashScreen extends StatelessWidget {
  //const SplashScreen({ Key? key }) : super(key: key);
  final HomeViewmodel _viewmodel;
  SplashScreen({viewmodel}) : _viewmodel = viewmodel;

  List images = ["2.png", "3.png", "4.png"];

  void _onPressLoginButton(context) async {
    final _user = await Navigator.pushNamed(context, '/login');
    //print("User (Splash): ${_user}");
    if (_user != null) {
      _viewmodel.user = (_user as User?)!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("asset/splash/" + images[index]))),
                      //image: AssetImage("asset/splash/2.png"))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 120.0),
                  Column(
                    children: List.generate(3, (indexDot) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: (index == indexDot) ? 25: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (index == indexDot) ? Color(0XFFFFD458) : Color(0XFFFFD458).withOpacity(0.6)),
                      );
                    }),
                  ),
                  SizedBox(height: 420.0,),
                  NewButton(
                    label: "Login / Register",
                    onPress: () => _onPressLoginButton(context),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
