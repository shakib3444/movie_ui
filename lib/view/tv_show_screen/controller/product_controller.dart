import 'dart:convert';
import 'package:assingment/data/api_services/api_service.dart';
import 'package:assingment/data/api_services/app_config.dart';
import 'package:get/get.dart';
import '../../../data/model/product_model.dart';

class ProductController extends GetxController{


  //Model
  var productList = <ProductListModel>[].obs;

  //bool
  RxBool isLoading = false.obs;



  @override
  void onInit() {
    super.onInit();
    getProduct();
  }


  getProduct()async{
    isLoading.value = true;
    final res = await ApiService.getApi(AppConfig.GETPRODUCT);
    if(res.statusCode == 200){
      print("Product Get Success");
      var data = json.decode(res.body) as List;
      productList.value = data.map((e) => ProductListModel.fromJson(e)).toList();

    }else{
      print("Product Get Failed");
    }
    isLoading.value = false;

  }
}