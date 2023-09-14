import 'package:get/get.dart';
import 'package:patterns_getx/controllers/create_controller.dart';
import 'package:patterns_getx/controllers/home_controller.dart';
import 'package:patterns_getx/controllers/update_controller.dart';

class DIService{
  static Future<void> init()async{
    //Get.put<HomeController>(HomeController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<UpdateController>(() => UpdateController());
    Get.lazyPut<CreateController>(() => CreateController());
  }
}