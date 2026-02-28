import 'package:daraz_style_product_listing/constant/app_colors.dart';
import 'package:daraz_style_product_listing/constant/app_constant.dart';
import 'package:daraz_style_product_listing/screens/home_screen/providers/home_screen_provider.dart';
import 'package:daraz_style_product_listing/screens/home_screen/screens/home_screen_all_screen.dart';
import 'package:daraz_style_product_listing/screens/home_screen/screens/home_screen_body_widget.dart';
import 'package:daraz_style_product_listing/screens/home_screen/screens/home_screen_grid_view.dart';
import 'package:daraz_style_product_listing/screens/home_screen/widgets/home_screen_widgets_horizontal_cards.dart';
import 'package:daraz_style_product_listing/utils/app_log.dart';
import 'package:daraz_style_product_listing/utils/app_size.dart';
import 'package:daraz_style_product_listing/widgets/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with TickerProviderStateMixin {
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
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(homeScreenProvider.notifier).onDataRefresh();
          },
          child: NestedScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverPadding(
                  padding: EdgeInsetsGeometry.all(AppSize.size.width * 0.01),
                  sliver: SliverToBoxAdapter(child: HomeScreenWidgetsHorizontalCards()),
                ),

                SliverPadding(
                  padding: EdgeInsetsGeometry.all(AppSize.size.width * 0.01),
                  sliver: SliverToBoxAdapter(child: HomeScreenWidgetsHorizontalCards()),
                ),

                SliverAppBar(
                  expandedHeight: AppSize.size.width * 0.35,
                  flexibleSpace: AppImage(
                    height: AppSize.size.width * 0.35,
                    width: AppSize.size.width,
                    url:
                        "https://images.unsplash.com/photo-1761839257475-4ca368dae6c3?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _TabBarDelegate(
                    TabBar(
                      controller: _tabController,
                      dividerHeight: 0,
                      indicatorColor: Colors.transparent,
                      unselectedLabelStyle: TextStyle(
                        color: AppColors.instance.black50,
                        fontFamily: AppConstant.instance.font,
                        fontWeight: FontWeight.w500,
                      ),
                      labelStyle: TextStyle(color: AppColors.instance.dark500, fontFamily: AppConstant.instance.font, fontWeight: FontWeight.w500),
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
            body: TabBarView(
              controller: _tabController,
              children: [HomeScreenAllScreen(), HomeScreenGridView(), HomeScreenBodyWidget(), HomeScreenBodyWidget(), HomeScreenBodyWidget()],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(color: AppColors.instance.blue200, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _) => false;
}
