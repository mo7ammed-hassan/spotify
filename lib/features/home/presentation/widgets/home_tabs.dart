import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class HomeTabs extends StatelessWidget {
  final TabController? tabController;
  const HomeTabs({super.key, this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary,
      unselectedLabelStyle: TextStyle(
        color: context.isDarkMode
            ? const Color(0xff616161)
            : const Color(0xffBEBEBE),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
      dividerHeight: 0,
      indicatorSize: TabBarIndicatorSize.tab,
      tabAlignment: TabAlignment.start,
      tabs: [
        _tabWidget(title: 'News'),
        _tabWidget(title: 'Videos'),
        _tabWidget(title: 'Artists'),
        _tabWidget(title: 'Podcasts'),
      ],
    );
  }

  Widget _tabWidget({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    );
  }
}
