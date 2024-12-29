import 'package:flutter/material.dart';

import '../../../data/utility/assets.dart';

class MoviePoster extends StatelessWidget {
   MoviePoster({super.key, required this.name, required this.image, required this.onClick});
   final String name;
   final String image;
   final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(image,height:150,width:150,fit: BoxFit.cover,)),
            const SizedBox(height: 10,),
            Text(name,style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.white),)

          ],
        ),
      ),
    );
  }
}
