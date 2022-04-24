import 'package:flutter/material.dart';
import 'package:fyp_project_v2/app/route.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/Home/widget/AuthoritiesBody.dart';
import 'package:fyp_project_v2/screen/Home/widget/HomeBody.dart';
import 'package:fyp_project_v2/screen/Home/widget/JirankuAppBar.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/ParagraphText.dart';
import 'package:fyp_project_v2/screen/Home/HomeViewModel.dart';
import 'package:fyp_project_v2/screen/Home/widget/SplashScreen.dart';

import '../view.dart';
import 'NewsHomeViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: View(
          viewmodel: HomeViewmodel(),
          progressBuilder: (context, viewmodel) => Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(child: CircularProgressIndicator()),
          ),
          builder: (context, mainViewmodel, progressBuilder) {
            //print(mainViewmodel.isUserSignedIn);
             final _newsViewmodel =
                  NewsHomeScreenViewModel(homeViewmodel: mainViewmodel);
            if (mainViewmodel.isUserSignedIn) {
              dynamic AppBarList = [
                JirankuAppBar(title: "Jiranku", viewmodel: mainViewmodel),

              ];
              dynamic childrenBody = [
                  AuthoritiesBody(),
                  HomeBody(
                  viewmodel: _newsViewmodel,
                ),
              ];
              return Scaffold(
                appBar:
                    JirankuAppBar(title: "Jiranku", viewmodel: mainViewmodel),
                body: childrenBody[mainViewmodel.selectedIndex],
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.grey[200],
                  unselectedItemColor: Colors.grey[500],
                  selectedItemColor: Colors.black,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      activeIcon: Icon(Icons.account_balance),
                      icon: Icon(Icons.account_balance_outlined),
                      label: "Authorities",
                      //backgroundColor: Colors.pink,
                    ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(Icons.article_outlined),
                    //   activeIcon: Icon(Icons.article),
                    //   label: "News",
                    //   //backgroundColor: Colors.red,
                    // ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(Icons.home),
                      icon: Icon(Icons.home_outlined),
                      label: "Home",
                      //backgroundColor: Colors.green,
                    ),
                    // BottomNavigationBarItem(
                    //   activeIcon: Icon(Icons.local_mall),
                    //   icon: Icon(Icons.local_mall_outlined),
                    //   label: "Product",
                    //   //backgroundColor: Colors.purple,
                    // ),
                    // BottomNavigationBarItem(
                    //   activeIcon: Icon(Icons.account_circle),
                    //   icon: Icon(Icons.account_circle_outlined),
                    //   label: "Profile",
                    //   //backgroundColor: Colors.pink,
                    // ),
                  ],
                  currentIndex: mainViewmodel.selectedIndex,
                  onTap: (index) => mainViewmodel.selectedIndex = index,
                ),
              );
            }
            return SplashScreen(viewmodel: mainViewmodel);
          },
        ),
      ),
    );
  }
}
