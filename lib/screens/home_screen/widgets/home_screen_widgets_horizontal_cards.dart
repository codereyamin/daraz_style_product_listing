import 'package:daraz_style_product_listing/screens/home_screen/providers/home_screen_provider.dart';
import 'package:daraz_style_product_listing/utils/app_size.dart';
import 'package:daraz_style_product_listing/widgets/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreenWidgetsHorizontalCards extends StatelessWidget {
  const HomeScreenWidgetsHorizontalCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var provider = ref.watch(homeScreenProvider);
        if (provider.isLoading) {
          return SizedBox(
            width: AppSize.size.width,
            height: AppSize.size.width * 0.1,
            child: Skeletonizer(
              enabled: true,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: AppSize.size.width * 0.025),
                    child: AppImage(width: AppSize.size.width * 0.25, height: AppSize.size.width * 0.25),
                  );
                },
              ),
            ),
          );
        }
        if (provider.listOfProduct.isNotEmpty) {
          return SizedBox(
            width: AppSize.size.width,
            height: AppSize.size.width * 0.1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var item = provider.listOfProduct[index];
                return Padding(
                  padding: EdgeInsets.only(right: AppSize.size.width * 0.01),
                  child: AppImage(url: item.image, width: AppSize.size.width * 0.1, height: AppSize.size.width * 0.1),
                );
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
