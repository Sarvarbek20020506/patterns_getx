import 'package:get/get.dart';
import '../../services/http_service.dart';
import '../models/post_model.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var items = [].obs;

  Future apiPostList() async {
    isLoading.value = true;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    isLoading.value = false;
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
  }


  Future apiPostDelete(Post post)async{
    isLoading.value = true;
    var response = await Network.DEL(Network.API_DEL+post.id.toString(), Network.paramsEmpty());
    if(response != null){
      apiPostList();
    }else{
      items.value= [];
    }
    isLoading.value = false;
  }
}