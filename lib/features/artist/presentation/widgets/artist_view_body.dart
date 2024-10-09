import 'package:flutter/material.dart';
import 'package:spotify/features/artist/presentation/widgets/albums_list_view.dart';
import 'package:spotify/features/artist/presentation/widgets/artist_details_section.dart';
import 'package:spotify/features/artist/presentation/widgets/artist_songs.dart';

class ArtistViewBody extends StatelessWidget {
  const ArtistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: ArtistDetailsSection()),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: Text(
            'Albums',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 160,
            child: AlbumsListview(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 35,
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            'Songs',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 18)),
        ArtistSongs(),
        SliverToBoxAdapter(child: SizedBox(height: 5)),
      ],
    );
  }
}
