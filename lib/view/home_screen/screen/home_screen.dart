import 'package:assingment/data/utility/app_color.dart';
import 'package:assingment/view/home_screen/controller/home_controller.dart';
import 'package:assingment/view/home_screen/widget/head_line.dart';
import 'package:assingment/widget/app_input.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/utility/assets.dart';
import '../widget/movie_poster.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bgColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [

                //Name and Profile Image
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text:const TextSpan(
                        text: "Hello ",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white),
                        children: [
                           TextSpan(
                                      text: "Rafsan",style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),
                                    ),


                                  ]
                              )
                        ),
                       const SizedBox(height: 6,),
                        const Text("Let’s watch today",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),),
                      ],
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(Assets.man,height: 50,width: 50,fit: BoxFit.fill,)
                    ),
                  ],
                ),

                const SizedBox(height: 20,),

                //Search bar and Filter button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width*0.75,
                      child: AppInput(
                        hint: "search",
                        controller: controller.search.value,
                        suffixIcon: IconButton(
                          onPressed: (){},
                          icon:const Icon(Icons.search,color: AppColors.textGrey,size: 20,),
                        ),
                        circle: 22,
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.mainColor,
                        ),
                        child:Center(child:Image.asset(Assets.filter,)),
                      ),
                    )
                  ],
                ),

                //Category
                const SizedBox(height: 20,),
                HeadLine(name: "Category", onClick: (){}),
                const SizedBox(height: 10,),

                //Select Category
                SizedBox(
                  height: 40,
                  child: Obx(() {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categoryNames.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => controller.selectCategory(index),
                          child: Obx(() {
                              return Container(
                                margin: const EdgeInsets.only(right: 15),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: controller.selectedIndex==index ? AppColors.mainColor : const Color(0xFF221821),
                                ),
                                child: Center(
                                  child: Obx(() {
                                      return Text(
                                        controller.categoryNames[index],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: controller.selectedIndex==index ? AppColors.textWhite : AppColors.textGrey,
                                        ),
                                      );
                                    }
                                  ),
                                ),
                              );
                            }
                          ),
                        );
                      },
                    );
                  }),
                ),


                const SizedBox(height: 20,),
                // Carousel Slider
                Obx(() => CarouselSlider(
                  items: controller.images.map((banner){
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                        child: Image.asset(banner,width: Get.width,fit: BoxFit.cover,));
                  }).toList(),
                  options: CarouselOptions(
                    height:120.0,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                     
                    onPageChanged: (index, reason) {
                      controller.changeIndex(index);
                    },
                  ),
                )),

                // Custom Indicator
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.images.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => controller.changeIndex(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (controller.currentIndex.value == entry.key)
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                )),

               //Trending Movies
               const SizedBox(height: 10,),
                HeadLine(name: "Trending Movies", onClick: (){}),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return MoviePoster(
                          image: Assets.movie,
                          name: "Black Panther",
                          onClick: (){},
                        );
                      }),
                ),
               const SizedBox(height: 15,),

                //continue watching
                const SizedBox(height: 10,),
                HeadLine(name: "Continue watching", onClick: (){}),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return MoviePoster(
                          image: Assets.movie,
                          name: "Black Panther",
                          onClick: (){},
                        );
                      }),
                ),
                const SizedBox(height: 15,),

                //Recommended For You
                const SizedBox(height: 10,),
                HeadLine(name: "Recommended For You", onClick: (){}),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return MoviePoster(
                          image: Assets.movie,
                          name: "Black Panther",
                          onClick: (){},
                        );
                      }),
                ),
                const SizedBox(height: 15,),



              ],
            ),
          ),

        )
    );
  }
}
