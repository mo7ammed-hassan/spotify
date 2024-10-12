import 'package:flutter/material.dart';
import 'package:spotify/features/home/presentation/widgets/artist_tab_bar.dart';
import 'package:spotify/features/home/presentation/widgets/news_songs_tab_bar.dart';

class HomeTabBarView extends StatelessWidget {
  final TabController? tabController;
  const HomeTabBarView({
    super.key,
    this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        const NewsSongsTabBar(),
        SizedBox(),
        const ArtistTabBar(),
        SizedBox(),
      ],
    );
  }
}
