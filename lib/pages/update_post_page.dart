import 'package:flutter/material.dart';
import 'package:patterns_provider/view_models/update_post_view.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class UpdatePost extends StatefulWidget {
  final  String title;
  final String  body;
  final int? id;
  const UpdatePost({Key? key, required this.title, required this.body, required this.id}) : super(key: key);
  static String id1 = "update_page";
  @override
  _UpdatePostState createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {

  UpdatePostView updatePostView = new UpdatePostView();


  @override
  void initState() {
    super.initState();
   updatePostView.titleController.text = widget.title;
   updatePostView.bodyController.text = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Post"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => updatePostView,
        child: Consumer<UpdatePostView>(
          builder: (ctx, model, index) => Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(child: texField(labelText: "Title", controller: updatePostView.titleController)),
                    SizedBox(
                      height: 30,
                    ),
                    Container(child: texField(labelText: "Body", controller: updatePostView.bodyController)),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size.fromHeight(40)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                      onPressed: () async {
                        updatePostView.updatePostList(context);
                      },
                      child: Text(
                        "Add",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              updatePostView.isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
  Widget texField({labelText, controller}) {
    return TextField(
      decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );
  }
}
