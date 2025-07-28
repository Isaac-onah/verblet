// lib/widgets/recommended_card.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:verblet/features/home_page/domain/entity.dart';

class RecommendedCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTourched;

  const RecommendedCard({super.key, required this.article, required this.onTourched});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTourched,
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    article.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      article.category,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.bookmark_outline,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              article.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            _buildAuthorInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthorInfo() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4), // Adjust this value
          child: Image.network(article.authorImageUrl,width: 28,),
        ),
        const SizedBox(width: 8),
        Text(
          'By: ${article.authorName}',
          style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
        ),
        const Spacer(),
        Text(
          '${article.date} • ${article.views} views',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
      ],
    );
  }
}