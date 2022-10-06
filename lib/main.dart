import 'package:flutter/material.dart';
import 'package:newsapi/screen/homeProvider/homeProvider.dart';
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
        },
      ),
    )
  );
}