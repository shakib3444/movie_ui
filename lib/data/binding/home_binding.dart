import 'package:assingment/view/app_bottom_nevigation/controller/nev_controller.dart';
import 'package:assingment/view/home_screen/controller/home_controller.dart';
import 'package:assingment/view/tv_show_screen/controller/product_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NevController>(() => NevController());
    Get.lazyPut<HomeController>(()=>HomeController());
    Get.lazyPut<ProductController>(()=>ProductController());
  }
}