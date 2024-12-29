import 'package:assingment/route/route_name.dart';
import 'package:assingment/view/app_bottom_nevigation/screen/app_bottom_navigaton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/binding/home_binding.dart';

class RoutePage{
  static List<GetPage<dynamic>> routes=[




    //Navigation
    GetPage(
        name: AppRoute.appNavigation,
        page: ()=>AppBottomNavigation(),
        bindings: [HomeBinding()]
    ),

  ];
}