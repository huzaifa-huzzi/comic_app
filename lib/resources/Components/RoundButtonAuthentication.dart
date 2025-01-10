import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';



class RoundButtonAuth extends StatelessWidget {
  final  String title;
  bool loading ;
  final VoidCallback ontap;
  RoundButtonAuth({super.key,required this.title,required this.ontap,this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          color:const Color.fromRGBO(96, 37, 166, 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: loading ?const LoadingIndicator(indicatorType:Indicator.ballClipRotate,colors:[Colors.white],) :  Center(child: Text(title,style: const TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500),),),
      ),
    );
  }
}