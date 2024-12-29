import 'package:assingment/view/download_screen/screen/download_screen.dart';
import 'package:assingment/view/home_screen/screen/home_screen.dart';
import 'package:assingment/view/profile_sreen/screen/profile_screen.dart';
import 'package:assingment/view/tv_show_screen/screen/tv_show_screen.dart';
import 'package:get/get.dart';

class NevController extends GetxController{

  //BottomNavigation page List
  RxList pages =[HomeScreen(),TvShowScreen(),DownloadScreen(),ProfileScreen()].obs;

  //page index store
  final currentIndex = 0.obs;

  //change page index function
  void changeIndex(int index){
    currentIndex.value = index;
  }

}