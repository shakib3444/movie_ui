import 'package:flutter/material.dart';

import '../../../data/utility/app_color.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text("Download Screen",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [

        ],
      ),
    ));
  }
}
