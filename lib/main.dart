import 'package:flutter/material.dart';
import 'package:newsapi/screen/homeProvider/homeProvider.dart';
import 'package:newsapi/screen/viewScreen/TabBar_screen/SportNews.dart';
import 'package:newsapi/screen/viewScreen/TabBar_screen/buisnessNews.dart';
import 'package:newsapi/screen/viewScreen/TabBar_screen/healthNews.dart';
import 'package:newsapi/screen/viewScreen/TabBar_screen/indiaNews.dart';
import 'package:newsapi/screen/viewScreen/TabBar_screen/topNews.dart';
import 'package:newsapi/screen/viewScreen/bottombarScreen/homeScreen.dart';
import 'package:newsapi/screen/viewScreen/bottombarScreen/profileScreen.dart';
import 'package:newsapi/screen/viewScreen/bottombarScreen/videoScreen.dart';
import 'package:newsapi/screen/viewScreen/detailspage.dart';
import 'package:newsapi/screen/viewScreen/viewScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => homeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>viewScreen(),
          'homescreen':(context)=>homeScreen(),
          'profilescreen':(context)=>profileScreen(),
          'videoscreen':(context)=>videoScreen(),
          'topnews':(context)=>topNews(),
          'sportnews':(context)=>sportNews(),
          'indianews':(context)=>indiaNews(),
          'healthnews':(context)=>healthNews(),
          'buisnessnews':(context)=>buisnessNews(),
          'details':(context)=>detailsPage(),
        },
      ),
    )
  );
}