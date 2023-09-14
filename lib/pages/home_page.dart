import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../models/post_model.dart';
import '../views/item_home_post.dart';
import 'create_page.dart';
class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {



  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('GetX'),
      ),
      body: Obx(
          ()=>Stack(
            children: [
              Get.find<HomeController>().isLoading.value? const Center(
                child: CircularProgressIndicator(),
              ):const SizedBox.shrink(),
              ListView.builder(
                itemCount: Get.find<HomeController>().items.length,
                itemBuilder: (ctx,index){
                  Post post = Get.find<HomeController>().items[index];
                  return itemHomePost(Get.find<HomeController>(),post);
                },
              ),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, CreatePage.id);
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

        child: const Icon(Icons.add,color: Colors.black,),
      ),
    );
  }

}
