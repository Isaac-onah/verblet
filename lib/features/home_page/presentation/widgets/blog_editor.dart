import 'package:flutter/material.dart';

class BlogEditor extends StatelessWidget {
  final TextEditingController controller;
  final String hintHint;
  const BlogEditor({super.key, required this.controller, required this.hintHint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        decoration: InputDecoration(hintText: hintHint,),maxLines: null,
    );
  }
}
