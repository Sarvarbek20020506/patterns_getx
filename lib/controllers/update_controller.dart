import 'dart:convert';

import 'package:get/get.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';
import '../services/log_servise.dart';

class UpdateController extends GetxController {
  var isLoading = false.obs;
  var items = [].obs;

  void apiPostUpdate(Post post) async {
    isLoading.value = true;
    Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post)).then((response) => {
              LogService.i(response.toString()),
              if (response != null){
                  Post.fromJson(jsonDecode(response.toString())) as List<Post>,
                  isLoading.value = false,
                }else{
                  items.value = [],
                  isLoading.value = false,
                }
            });
  }

  void apiPostList() async {
    isLoading.value = true;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

    isLoading.value = false;
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
  }
}
