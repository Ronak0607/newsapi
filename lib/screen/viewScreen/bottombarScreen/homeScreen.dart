import 'package:flutter/material.dart';
import 'package:newsapi/screen/viewScreen/TabBar_screen/SportNews.dart';
import 'package:newsapi/screen/viewScreen/TabBar_screen/buisnessNews.dart';
import 'package:newsapi/screen/viewScreen/TabBar_screen/healthNews.dart';
import 'package:newsapi/screen/viewScreen/TabBar_screen/indiaNews.dart';
import 'package:newsapi/screen/viewScreen/TabBar_screen/topNews.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Color(0xff676767),
                    indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(50), // Creates border
                        color: Colors.blue),
                    isScrollable: true,
                    tabs: [
                      Tab(
                        child: Text(
                          "TOP NEWS",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                          child: Text(
                        "INDIA",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Tab(
                          child: Text(
                        "HEALTH",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Tab(
                          child: Text(
                        "SPORTS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Tab(
                          child: Text(
                        "BUSINESS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ]),
                SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: TabBarView(children: [
                    topNews(),
                    indiaNews(),
                    healthNews(),
                    buisnessNews(),
                    sportNews(),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
