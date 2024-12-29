import 'package:assingment/data/utility/app_color.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  AppInput({super.key,
    required this.hint,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.textType,
    this.onClick,
    this.onChanged,
    this.maxLine = 1,
    this.isValidatorNeed = true,
    this.circle =10,
    this.hintColor = Colors.grey,

    this.onFieldSubmitted,


  });
  final String hint;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  String? Function(String?)? validator;
  final bool readOnly;
  final bool obscureText;
  final TextInputType?textType;
  final VoidCallback? onClick;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final int maxLine;
  final bool isValidatorNeed;
  final double circle;
  final Color hintColor;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.90,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        onTap: onClick,
        onChanged: onChanged,
        maxLines: maxLine,
        keyboardType:textType,
        style:const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color:AppColors.textGrey),
        readOnly:readOnly ,
        obscureText:obscureText ,
        controller:controller ,
        validator: (v){
          if(isValidatorNeed){
            if(v!.isEmpty){
              return "Must be required.";
            }
            return null;
          }
          return null;

        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 18),
          hintText: hint,
          hintStyle:const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textGrey),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: AppColors.bgColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circle),
            borderSide: const BorderSide(color:AppColors.textGrey,),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circle),
            borderSide: const BorderSide(color:AppColors.textGrey,),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circle),
            borderSide:  const BorderSide(color:AppColors.textGrey,),
          ),
        ),
      ),
    );
  }
}
