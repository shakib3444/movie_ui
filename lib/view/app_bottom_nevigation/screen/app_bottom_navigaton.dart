import 'package:assingment/view/app_bottom_nevigation/controller/nev_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/utility/app_color.dart';
import '../../../data/utility/assets.dart';

class AppBottomNavigation extends StatelessWidget {
   AppBottomNavigation({super.key});
  final controller = Get.put(NevController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor:AppColors.bgColor,
          body: Obx((){
            return controller.pages[controller.currentIndex.value];
          }),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BottomNavigationBar(
                backgroundColor: AppColors.navColor,
                currentIndex: controller.currentIndex.value,
                selectedItemColor: Colors.red,
                unselectedItemColor: Colors.grey,
                onTap: controller.changeIndex,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                      backgroundColor: AppColors.navColor,
                      icon: Obx((){
                        return ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                controller.currentIndex == 0?Colors.red:Colors.grey,
                                BlendMode.srcIn
                            ),
                            child: Image.asset(Assets.home,height: 25,width: 25,fit: BoxFit.contain,));
                      }
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      backgroundColor:AppColors.navColor,
                      icon: Obx((){
                        return ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                controller.currentIndex == 1?Colors.red:Colors.grey,
                                BlendMode.srcIn
                            ),
                            child: Image.asset(Assets.decktop,height: 30,width: 30,fit: BoxFit.contain,));
                      }
                      ),
                      label: "",
                    ),

                    BottomNavigationBarItem(
                      backgroundColor: AppColors.navColor,
                      icon: Obx((){
                        return ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                controller.currentIndex == 2?Colors.red:Colors.grey,
                                BlendMode.srcIn
                            ),
                            child: Image.asset(Assets.down,height: 30,width: 30,fit: BoxFit.contain,));
                      }
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: AppColors.navColor,
                      icon: Obx((){
                        return ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                controller.currentIndex == 3?Colors.red:Colors.grey,
                                BlendMode.srcIn
                            ),
                            child: Image.asset(Assets.person,height: 30,width: 30,fit: BoxFit.contain,));
                      }
                      ),
                      label: "",
                    ),

                  ],
              ),
            ),
          ),
    ));
  }
}
