import 'package:flutter/material.dart';
import 'package:newsapi/screen/homeProvider/homeProvider.dart';
import 'package:newsapi/screen/newsModel/NewsModel.dart';
import 'package:newsapi/screen/viewScreen/bottombarScreen/homeScreen.dart';
import 'package:newsapi/screen/viewScreen/bottombarScreen/profileScreen.dart';
import 'package:newsapi/screen/viewScreen/bottombarScreen/videoScreen.dart';
import 'package:provider/provider.dart';

class viewScreen extends StatefulWidget {
  const viewScreen({Key? key}) : super(key: key);

  @override
  State<viewScreen> createState() => _viewScreenState();
}

class _viewScreenState extends State<viewScreen> {
  homeProvider? homeProvidertrue;
  homeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {
    homeProvidertrue = Provider.of<homeProvider>(context, listen: true);
    homeProviderfalse = Provider.of<homeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("News", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Color(0xff000000),
        body: IndexedStack(
          index: homeProvidertrue!.i,
          children: [
            homeScreen(),
            profileScreen(),
            videoScreen()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.play_circle),label: "Video"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          ],
          currentIndex: homeProvidertrue!.i,
          onTap: (index){
            homeProvidertrue!.bottomindex(index);
          },
        ),
      ),
    );
  }
}
