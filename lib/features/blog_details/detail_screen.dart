import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verblet/features/blog_details/widget/author_info_row.dart';
import 'package:verblet/features/blog_details/widget/circular_icon_button.dart';
import 'package:verblet/features/blog_details/widget/like_button.dart';
import 'package:verblet/features/home_page/domain/entity/blog_entity.dart';

class ArticleScreen extends StatelessWidget {
   final Article article;
  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      floatingActionButton: LikeButton(
        likeCount: 285,
        onPressed: () {},
      ),
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Material(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                  ),
                ),
                child: Text(article.content,
                  style: GoogleFonts.sourceSerif4(
                    fontSize: 18,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 300.0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      stretch: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularIconButton(
          icon: Icons.arrow_back,
          onPressed: () {},
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularIconButton(
            icon: Icons.bookmark_outline,
            onPressed: () {},
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground
        ],
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(article.imageUrl,
              fit: BoxFit.cover,
            ),
            // Gradient Overlay
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black54],
                  stops: [0.5, 1.0],
                ),
              ),
            ),
            // Content
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New VR Headsets That Will Shape the Metaverse',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Technology',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const Spacer(),
                        Text(
                          'Jan 1, 2021 • 3344 views',
                          style: GoogleFonts.poppins(color: Colors.white70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    AuthorInfoRow(
                      authorName: 'Mason Eduard',
                      authorImageUrl: 'https://i.pravatar.cc/150?img=1',
                      onSharePressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}