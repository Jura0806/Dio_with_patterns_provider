import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/pages/home_page.dart';
import 'package:patterns_provider/pages/update_post_page.dart';
import 'package:patterns_provider/services/http_service.dart';

class UpdatePostView extends ChangeNotifier {

    UpdatePost? updatePost ;

  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  bool isLoading = false;
  Random random = new Random();

    void updatePostList(BuildContext context) async {
      Post post = Post(title: titleController.text, body: bodyController.text, userId: random.nextInt(10));
        isLoading = true;
        notifyListeners();

      var response =
      await Network.PUT(Network.API_UPDATE+ 1.toString(), Network.paramsUpdate(post));
      print(response);

        if(response != null){
          Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
        }
        isLoading = false;
        notifyListeners();
      print("CreatePost => $response");
    }

}
