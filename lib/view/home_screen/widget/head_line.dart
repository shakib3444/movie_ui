import 'package:flutter/material.dart';

import '../../../data/utility/app_color.dart';

class HeadLine extends StatelessWidget {
   HeadLine({super.key, required this.name, required this.onClick});
  final String name;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Text(name,style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textWhite),),
        InkWell(
            onTap:onClick,
            child:const Text("See More",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textWhite),)),
      ],
    );
  }
}
