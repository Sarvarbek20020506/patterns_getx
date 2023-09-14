import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/update_controller.dart';
import '../models/post_model.dart';
import '../views/item_Update_post.dart';
class UpdatePage extends StatefulWidget {
  static const String id="update_page";
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var  post = Post("asc" , 1 ,"12cas", 1);
    Get.find<UpdateController>().apiPostList();
    Get.find<UpdateController>().apiPostUpdate(post);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Page"),
        backgroundColor: Colors.blue,
      ),
      body:  Obx(
          ()=>Stack(
            children: [
              Get.find<UpdateController>().isLoading.value? const Center(
                child: CircularProgressIndicator(),
              ):const SizedBox.shrink(),
              ListView.builder(
                itemCount: Get.find<UpdateController>().items.length,
                itemBuilder: (ctx,index){
                  Post post = Get.find<UpdateController>().items[index];
                  return itemUpdatePost(Get.find<UpdateController>(),post);
                },
              ),
            ],
          ),
      ),
    );
  }

}
