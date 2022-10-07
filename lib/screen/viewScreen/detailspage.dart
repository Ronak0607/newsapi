import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class detailsPage extends StatefulWidget {
  const detailsPage({Key? key}) : super(key: key);

  @override
  State<detailsPage> createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  @override
  Widget build(BuildContext context) {

     dynamic getdata = ModalRoute.of(context)!.settings.arguments;

    return SafeArea(child: Scaffold(
      body: WebView(
        initialUrl: "${getdata}",
      ),
    ));
  }
}
