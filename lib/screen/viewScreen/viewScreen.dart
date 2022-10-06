import 'package:flutter/material.dart';
import 'package:newsapi/screen/homeProvider/homeProvider.dart';
import 'package:newsapi/screen/newsModel/NewsModel.dart';
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
    homeProvidertrue = Provider.of<homeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("News"),
          ),
          body: FutureBuilder<NewsModel>(
            future: homeProviderfalse!.apiCalling(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                Text("${snapshot.error}");
              }
              else if (snapshot.hasData) {
                NewsModel newsModel = snapshot.data!;
                return ListView.builder(itemCount: newsModel.articles!.length,
                    itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                  );
                    });
              }
              return Center(child: CircularProgressIndicator());
            },)),
    );
  }
}
