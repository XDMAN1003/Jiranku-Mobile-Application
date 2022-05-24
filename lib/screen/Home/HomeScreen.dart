import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/ParagraphText.dart';
import 'package:fyp_project_v2/screen/Home/HomeViewModel.dart';
import '../view.dart';
import 'NewsHomeViewModel.dart';
import 'homie/Authority/AuthoritiesAppBar.dart';
import 'homie/Authority/AuthoritiesBody.dart';
import 'homie/Home/HomeBody.dart';
import 'homie/Home/JirankuAppBar.dart';
import 'homie/News/NewAppBar.dart';
import 'homie/Profile/ProfileAppBar.dart';
import 'homie/Profile/ProfileBody.dart';
import 'homie/SplashScreen.dart';

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
                AuthoritiesAppBar(),
                NewsAppBar(viewmodel: mainViewmodel),
                JirankuAppBar(viewmodel: mainViewmodel),
                AuthoritiesAppBar(),
                ProfileAppBar(viewmodel: mainViewmodel,),
                
              ];
              dynamic childrenBody = [
                AuthoritiesBody(),
                HomeBody(
                  viewmodel: _newsViewmodel,
                ),
                HomeBody(
                  viewmodel: _newsViewmodel,
                ),
                HomeBody(
                  viewmodel: _newsViewmodel,
                ),
                ProfileBody(viewmodel: mainViewmodel,),
              ];
              return Scaffold(
                appBar: AppBarList[mainViewmodel.selectedIndex],
                body: childrenBody[mainViewmodel.selectedIndex],
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.white,
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
                    BottomNavigationBarItem(
                      icon: Icon(Icons.article_outlined),
                      activeIcon: Icon(Icons.article),
                      label: "News",
                      //backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(Icons.home),
                      icon: Icon(Icons.home_outlined),
                      label: "Home",
                      //backgroundColor: Colors.green,
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(Icons.local_mall),
                      icon: Icon(Icons.local_mall_outlined),
                      label: "Product",
                      //backgroundColor: Colors.purple,
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Icon(Icons.account_circle),
                      icon: Icon(Icons.account_circle_outlined),
                      label: "Profile",
                      //backgroundColor: Colors.pink,
                    ),
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
