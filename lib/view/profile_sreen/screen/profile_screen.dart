import 'package:flutter/material.dart';

import '../../../data/utility/app_color.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text("Profile",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [

        ],
      ),
    ));
  }
}
