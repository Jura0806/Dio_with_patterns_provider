
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/pages/home_page.dart';
import 'package:patterns_provider/services/http_service.dart';

class CreatePostView extends ChangeNotifier {
  Random random = new Random();
  bool isLoading = false;


  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  Future<bool> createPostList(BuildContext context, String title, String body) async {
    isLoading = true;
    notifyListeners();

    var response =
        await Network.POST(Network.API_CREATE, Network.paramsCreate(
            Post(
                userId: random.nextInt(10),
                id: random.nextInt(100),
                title: title,
                body: body
            )
        ));

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
      // return response;
    }
    isLoading = false;
    notifyListeners();

    print("CreatePost => $response");
    return response != null;
  }
}
