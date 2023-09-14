import 'dart:convert';

import 'package:get/get.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';
import '../services/log_servise.dart';

class UpdateController extends GetxController {
  var isLoading = false;
  var items = [];

  void apiPostUpdate(Post post) async {
    isLoading = true;
    update();
    Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post)).then((response) => {
              LogService.i(response.toString()),
              if (response != null){
                  Post.fromJson(jsonDecode(response.toString())) as List<Post>,
                  isLoading = false,
                }else{
                  items = [],
                  isLoading = false,
                update(),
                }

            }
        );
  }

  void apiPostList() async {
    isLoading = true;
    update();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

    isLoading = false;
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items= [];
      update();
    }
  }
}
