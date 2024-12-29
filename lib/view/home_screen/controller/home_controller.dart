import 'package:assingment/data/utility/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController{

  //Rx<TextEditingController>
  Rx<TextEditingController> search = TextEditingController().obs;

  final selectedIndex = 0.obs;
  RxList<String> categoryNames = ["All", "Action", "Anime", "Sci-fi", "Thriller"].obs;

  void selectCategory(int index) {
    selectedIndex.value = index;
  }


  //banner
  RxInt currentIndex = 0.obs;
  //banner image
   RxList images = [Assets.b1,Assets.b2,Assets.b3].obs;

   //
  void changeIndex(int index) {
    currentIndex.value = index;
  }

}