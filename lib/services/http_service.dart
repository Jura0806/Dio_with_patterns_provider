

import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:patterns_provider/models/post_model.dart';

class Network{

  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  // http APIs //

  static String API_LIST = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/";  //{id}

  // http requests //

  static Future<List<dynamic>?> GET(String api, Map<String, String> paramsEmpty) async {
    try{
      var uri = Uri.https(BASE, api,paramsEmpty);
      Response response  =  await Dio().get(uri.toString());
      if(response.statusCode == 200){
        return response.data;
      }
     return null;
    }catch(e){
      print("ERROR: $e");
    }
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    try{
      Dio dio = Dio();
      var uri = Uri.https(BASE, api,params);
      Response response  =  await dio.post(uri.toString(), data: params);
      if(response.statusCode == 200 || response.statusCode == 201){
        return response.data.toString();
      }
      return null;
    }catch(e){
      print("ERROR: $e");
    }
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
   try{
     Dio dio = Dio();
     var uri = Uri.https(BASE, api,params);
     Response response  =  await dio.put(uri.toString(), data: params);
     if(response.statusCode == 200){
       return response.data.toString();
     }
     return 'Request failed with status: ${response.statusCode}.';
   }catch(e){
     print("ERROR:$e");
   }
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
   try{
     Dio dio = Dio();
     var uri = Uri.https(BASE, api,params);
     Response response  =  await dio.delete(uri.toString());
     if(response.statusCode == 200){
       return response.data;
     }
     return 'Request failed with status: ${response.statusCode}.';
   }catch(e){
     print(e);
   }
  }

  // http Params //

  static Map<String, String>  paramsEmpty(){
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String,String> paramsCreate(Post post){
    Map<String, String> params = new Map();
    params.addAll({
      "title": post.title,
      "body": post.body,
      "userId": post.userId.toString(),
    });
    return params;
  }

  static Map<String,String> paramsUpdate(Post post){
    Map<String, String> params = new Map();
    params.addAll({
      "id" : post.id.toString(),
      "title": post.title,
      "body": post.body,
      "userId": post.userId.toString(),
    });
    return params;
  }

  static List<Post> parsePostList(List<dynamic> response){
    List<Post> data =[];
    response.forEach((element) {
      Post post = Post(id: element["id"], userId: element["userId"], title: element['title'], body: element["body"]);
      data.add(post);
    });
    return data;
  }
}
