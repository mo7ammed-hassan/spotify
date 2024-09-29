import 'package:flutter/material.dart';
import 'package:spotify/features/home/presentation/widgets/news_songs.dart';

class HomeTabBarView extends StatefulWidget {
  const HomeTabBarView({
    super.key,
  });

  @override
  State<HomeTabBarView> createState() => _HomeTabBarViewState();
}

class _HomeTabBarViewState extends State<HomeTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        const NewsSongs(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }
}
