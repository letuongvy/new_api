import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_api/services/implement/article_services.dart';
import 'package:new_api/ui/new_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color(0xFFf2f2f2),
        primaryColor: Color(0xFF00A6E4),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF0E2656),
        ),
      ),
      home: NewScreen(articleApi: ArticleServices()),
    );
  }
}


    