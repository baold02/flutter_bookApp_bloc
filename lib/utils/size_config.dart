
import 'package:flutter/material.dart';

class SizeConfig{
   static MediaQueryData? _mediaQueryData;
   static double? screenWidth;
   static double? screenHeight;
   static double? blockSizeHorizontal;
   static double? blockSizdeVetical;

   void init(BuildContext context){
     _mediaQueryData = MediaQuery.of(context);
      screenWidth = _mediaQueryData!.size.width;
      screenHeight =_mediaQueryData!.size.height;
      blockSizdeVetical = screenHeight! / 100;
      blockSizeHorizontal = screenWidth! / 100;

   }

}