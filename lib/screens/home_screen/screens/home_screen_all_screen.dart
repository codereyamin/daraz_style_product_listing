import 'package:daraz_style_product_listing/screens/home_screen/providers/home_screen_provider.dart';
import 'package:daraz_style_product_listing/utils/app_size.dart';
import 'package:daraz_style_product_listing/widgets/app_image/app_image.dart';
import 'package:daraz_style_product_listing/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreenAllScreen extends StatelessWidget {
  const HomeScreenAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var provider = ref.watch(homeScreenProvider);
        if (provider.hasError) {
          return Center(
            child: Padding(
              padding: EdgeInsetsGeometry.all(AppSize.size.width * 0.05),
              child: AppText(text: "Something was wrong"),
            ),
          );
        }
        if (provider.isLoading) {
          return Center(
            child: Skeletonizer(
              enabled: true,
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: AppSize.size.width * 0.02),
                  child: ListTile(
                    leading: AppImage(width: AppSize.size.width * 0.05, height: AppSize.size.width * 0.05),
                    title: AppText(text: "loading title text", maxLines: 1, overflow: TextOverflow.ellipsis),
                    subtitle: AppText(text: "loading sub title text"),
                  ),
                ),
              ),
            ),
          );
        }

        return Center(
          child: ListView.builder(
            itemCount: provider.listOfProduct.length,
            itemBuilder: (context, index) {
              var item = provider.listOfProduct[index];
              return Padding(
                padding: EdgeInsets.only(bottom: AppSize.size.width * 0.02),
                child: ListTile(
                  leading: AppImage(url: item.image, width: AppSize.size.width * 0.05, height: AppSize.size.width * 0.05),
                  title: AppText(text: item.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: AppText(text: "Price \$${item.price.toStringAsFixed(2)}"),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
