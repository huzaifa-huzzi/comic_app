import 'package:comic_reading_app/resources/Color/Colors.dart';
import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  final String title ;
  final VoidCallback onTap;
  const RoundButton({super.key,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        height:height * 0.09 ,
        width: width * 0.8,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(title,style: TextStyle(color: AppColors.whiteColor,fontWeight: FontWeight.bold,fontSize: 20),),
        ),
      ),
    );
  }
}
