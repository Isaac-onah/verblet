// lib/widgets/article_list_item.dart
import 'package:flutter/material.dart';
import 'package:verblet/core/device_utility.dart';
import 'package:verblet/features/home_page/domain/entity/blog_entity.dart';

class ArticleListItem extends StatelessWidget {
  final BlogPost article;
  final VoidCallback onTourched;
  const ArticleListItem({super.key, required this.article, required this.onTourched});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTourched,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                article.imageUrl,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( article.topics.first,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${formatDate(article.createdAt)} • ${article.views} views • ${calculateReadingTime(article.content)} min',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}