import 'package:flutter/material.dart';
import 'package:spotify/features/home/presentation/widgets/home_tab_bar_view.dart';
import 'package:spotify/features/home/presentation/widgets/home_tabs.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({super.key});

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTabs(
          tabController: _tabController,
        ),
        SizedBox(
          height: 260,
          child: HomeTabBarView(
            tabController: _tabController,
          ),
        ),
      ],
    );
  }
}
