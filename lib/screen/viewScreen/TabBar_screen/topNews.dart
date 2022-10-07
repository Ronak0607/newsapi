import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../homeProvider/homeProvider.dart';
import '../../newsModel/NewsModel.dart';

class topNews extends StatefulWidget {
  const topNews({Key? key}) : super(key: key);

  @override
  State<topNews> createState() => _topNewsState();
}

class _topNewsState extends State<topNews> {
  homeProvider? homeProvidertrue;
  homeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {
    homeProvidertrue = Provider.of<homeProvider>(context, listen: true);
    homeProviderfalse = Provider.of<homeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffe1ebff),
          body: FutureBuilder<NewsModel>(
            future: homeProviderfalse!.apiCalling(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                NewsModel newsModel = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView.builder(
                      itemCount: newsModel.articles!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, 'details',arguments: newsModel.articles![index].url);

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 250,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 240,
                                      width: 240,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Text(
                                            "${newsModel.articles![index].title}",
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                            maxLines: 4,
                                          ),

                                          Text(
                                            "${newsModel.articles![index].description}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff727272)),
                                            maxLines: 5,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      child: Image.network(
                                          "${newsModel.articles![index].urlToImage}",
                                          fit: BoxFit.cover),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
