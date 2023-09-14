import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';
import '../services/log_servise.dart';

class CreateController extends GetxController{
  var isLoading = false;
  var items = [];


  void apiPostCreate() async {
    isLoading = true;
    update();
    try {
      final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post as Post ));
      isLoading = false;
      update();
      if (response != null) {
        LogService.w(response);
        Post.fromJson(jsonDecode(response.toString())) as List<Post>;
        LogService.d("ishladi");
      } else {
        LogService.e("api ishlamadi");
      }
    } catch (e) {
      LogService.e("Xatolik: $e");
    }
    update();
  }

  void apiPostList()async{

      isLoading = true;
      update();

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
      isLoading = false;
      if(response !=null){
        items = Network.parsePostList(response);
      }else{
        items =[];
      }
      update();
  }

}