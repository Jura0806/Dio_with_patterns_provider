import 'package:flutter/material.dart';
import 'package:patterns_provider/pages/create_post_page.dart';
import 'package:patterns_provider/view_models/view_model.dart';
import 'package:patterns_provider/views/item_of_post.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 HomeViewModel homeViewModel = new HomeViewModel();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
        ),
        body: ChangeNotifierProvider(
          create: (context) => homeViewModel,
          child: Consumer<HomeViewModel>(
            builder: (ctx, model, index) => Stack(
              children: [
                ListView.builder(
                  itemCount: homeViewModel.items.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPost(homeViewModel, homeViewModel.items[index], context);
                  },
                ),
                homeViewModel.isLoading
                    ? Center(
                     child: CircularProgressIndicator(),
                )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePost()));
          },
          child: Icon(Icons.add),
        )
    );
  }
}
