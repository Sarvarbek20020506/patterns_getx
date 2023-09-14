import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';
import '../services/log_servise.dart';

class CreateController extends GetxController{
  var isLoading = false.obs;
  var items = [].obs;


  void apiPostCreate() async {
    isLoading.value = true;
    try {
      final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post as Post ));
      isLoading.value = false;
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
  }

  void apiPostList()async{

      isLoading.value = true;

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
      isLoading.value = false;
      if(response !=null){
        items.value = Network.parsePostList(response);
      }else{
        items.value =[];
      }


  }

}