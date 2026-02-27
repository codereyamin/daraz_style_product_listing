import 'package:daraz_style_product_listing/screens/home_screen/screens/home_screen_all_screen.dart';
import 'package:daraz_style_product_listing/screens/home_screen/screens/home_screen_body_widget.dart';
import 'package:daraz_style_product_listing/screens/home_screen/screens/home_screen_grid_view.dart';
import 'package:daraz_style_product_listing/utils/app_log.dart';
import 'package:daraz_style_product_listing/utils/app_size.dart';
import 'package:daraz_style_product_listing/widgets/app_image/app_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  void onAppInitial() {
    try {
      _tabController = TabController(length: 5, vsync: this);
    } catch (e) {
      errorLog("onAppInitial", e);
    }
  }

  void onAppClose() {
    try {
      _tabController.dispose();
    } catch (e) {
      errorLog("onAppClose", e);
    }
  }

  @override
  void initState() {
    super.initState();
    onAppInitial();
  }

  @override
  void dispose() {
    super.dispose();
    onAppClose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverPadding(
              padding: EdgeInsetsGeometry.all(AppSize.size.width * 0.01),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  width: AppSize.size.width,
                  height: AppSize.size.width * 0.1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: AppSize.size.width * 0.01),
                        child: AppImage(width: AppSize.size.width * 0.1, height: AppSize.size.width * 0.1),
                      );
                    },
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsetsGeometry.all(AppSize.size.width * 0.01),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  width: AppSize.size.width,
                  height: AppSize.size.width * 0.1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: AppSize.size.width * 0.01),
                        child: AppImage(width: AppSize.size.width * 0.1, height: AppSize.size.width * 0.1),
                      );
                    },
                  ),
                ),
              ),
            ),

            SliverAppBar(expandedHeight: AppSize.size.width * 0.35, flexibleSpace: AppImage()),
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarDelegate(
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: "All"),
                    Tab(text: "Grid view"),
                    Tab(text: "Tab 3"),
                    Tab(text: "Tab 4"),
                    Tab(text: "Tab 5"),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(controller: _tabController, children: [HomeScreenAllScreen(), HomeScreenGridView(), HomeScreenBodyWidget(), HomeScreenBodyWidget(), HomeScreenBodyWidget()]),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _) => false;
}
