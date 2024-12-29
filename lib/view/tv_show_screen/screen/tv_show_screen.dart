import 'package:assingment/view/tv_show_screen/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/utility/app_color.dart';

class TvShowScreen extends StatelessWidget {
  TvShowScreen({super.key});
  final ProductController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bgColor,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: AppColors.bgColor,

            title:const  Text("Best Shopping",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textWhite),),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search,color: AppColors.textWhite,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag,color: AppColors.textWhite,)),
              SizedBox(width: 15,),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Obx(() {
              if(controller.isLoading.value){
                return const Center(child: CircularProgressIndicator.adaptive(),);
              }else{
                return GridView.builder(
                  itemCount:controller.productList.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: .67,
                    ), itemBuilder: (context,index){
                  final product = controller.productList[index];
                      return Container(
                        //margin:const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //color: Colors.black
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            //image
                            Center(child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                                child: Image.network(product.image.toString(),height: 150,width: Get.width,fit: BoxFit.fill,))),
                            const SizedBox(height: 10,),

                            //Details
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Price Ratting
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("\$ ${product.price}",style:const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textWhite),),
                                      Text("⭐ ${product.rating!.rate}",style:const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textWhite),),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),

                                  Text("${product.title}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textWhite),
                                  ),

                                  const SizedBox(height: 5,),
                                  Text("${product.description}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.textWhite),
                                  ),

                                ],
                              ),
                            ),

                          ],
                        ),

                      );
                });

              }
              }
            ),
          ),
        ));
  }
}
