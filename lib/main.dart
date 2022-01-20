import 'package:flutter/material.dart';
import 'package:patterns_provider/pages/create_post_page.dart';
import 'package:patterns_provider/pages/home_page.dart';
import 'package:patterns_provider/pages/update_post_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id : (context) => HomePage(),
        CreatePost.id : (context) => CreatePost(),
        UpdatePost.id1 :(context) => UpdatePost(body: '', title: '', id: null,),
      },
    );
  }
}