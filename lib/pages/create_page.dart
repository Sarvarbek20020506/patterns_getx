import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:patterns_getx/controllers/create_controller.dart';

import '../models/post_model.dart';
import '../views/item_create_post.dart';
class CreatePage extends StatefulWidget {
  static const String id = "create_page";
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //var  post = Post("acds", 1,"12cas", 1);
    Get.find<CreateController>().apiPostList();
    Get.find<CreateController>().apiPostCreate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Page"),
        backgroundColor: Colors.blue,
      ),
      body: Obx(
          ()=>Stack(
            children: [
              Get.find<CreateController>().isLoading.value? const Center(
                child: CircularProgressIndicator(),
              ):const SizedBox.shrink(),
              ListView.builder(
                itemCount: Get.find<CreateController>().items.length,
                itemBuilder: (ctx,index){
                  Post post =Get.find<CreateController>().items[index];
                  return itemCreatePost(Get.find<CreateController>() ,post);
                },
              ),
            ],
          ),
      ),
      );
  }
}
