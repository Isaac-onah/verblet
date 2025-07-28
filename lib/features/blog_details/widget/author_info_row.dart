// lib/widgets/author_info_row.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorInfoRow extends StatelessWidget {
  final String authorName;
  final String authorImageUrl;
  final VoidCallback onSharePressed;

  const AuthorInfoRow({
    super.key,
    required this.authorName,
    required this.authorImageUrl,
    required this.onSharePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(authorImageUrl),
            ),
            const SizedBox(width: 12),
            Text(
              'By: $authorName',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: onSharePressed,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.ios_share_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}