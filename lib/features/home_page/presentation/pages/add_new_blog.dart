import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:verblet/core/theme/app_pallete.dart';

class AddNewBlog extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => AddNewBlog());

  const AddNewBlog({super.key});

  @override
  State<AddNewBlog> createState() => _AddNewBlogState();
}

class _AddNewBlogState extends State<AddNewBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Iconsax.tick_circle, size: 32),
            onPressed: () {
              // Handle notification tap
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  dashPattern: [16, 7],
                  strokeWidth: 2,
                  radius: Radius.circular(16),
                  padding: EdgeInsets.all(16),
                  color: MyColors.darkGrey,
                ),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.folder_open,
                        size: 50,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Select your image')
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ['Technilogy', 'Fashion', 'Education', 'Entertainment',
                  ].map((e) => Chip(label: Text(e))).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
