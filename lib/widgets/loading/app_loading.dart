import 'package:flutter/material.dart';
import 'package:daraz_style_product_listing/constant/app_colors.dart';
import 'package:daraz_style_product_listing/utils/app_size.dart';

Widget appLoader({double? width, double? height, Color? loaderColor}) {
  return Center(
    child: SizedBox(
      width: width ?? AppSize.width(value: 50),
      height: height ?? AppSize.width(value: 50),
      child: CircularProgressIndicator(color: loaderColor ?? AppColors.instance.primary),
    ),
  );
}
