import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:verblet/core/common/cubits/app_user.dart';
import 'package:verblet/core/common/image_text.dart';
import 'package:verblet/core/common/loader.dart';
import 'package:verblet/core/common/snackbar.dart';
import 'package:verblet/core/device_utility.dart';
import 'package:verblet/core/theme/app_pallete.dart';
import 'package:verblet/features/appnavigator/main_navigator.dart';
import 'package:verblet/features/home_page/presentation/blogbloc/blog_bloc.dart';
import 'package:verblet/features/home_page/presentation/widgets/blog_editor.dart';

class AddNewBlog extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => AddNewBlog());

  const AddNewBlog({super.key});

  @override
  State<AddNewBlog> createState() => _AddNewBlogState();
}

class _AddNewBlogState extends State<AddNewBlog> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final uploadFormKey = GlobalKey<FormState>();

  List<String> selectedTopics = [];
  File? image;

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  void nowUploadBlog () {
    if(uploadFormKey.currentState!.validate() && selectedTopics.isNotEmpty && image != null){
      final posterId = (context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;
      context.read<BlogBloc>().add(BlogUploadEvent(image: image!, title: titleController.text.trim(), content: contentController.text.trim(), posterId: posterId, topics: selectedTopics));
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Iconsax.tick_circle, size: 32),
            onPressed: (){
              nowUploadBlog();
            }
          ),
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
  listener: (context, state) {
    if(state is BlogFailure){
      showSnackBar(context, 'Oops', state.error);
    }else if(state is BlogUploadSuccess){
      Navigator.pushAndRemoveUntil(context, mainNavigator.route(), (route) => false);
    }
  },
  builder: (context, state) {
    if(state is BlogLoading){
      return Loader( animation: MyImages.signAnimation, );
    }
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Form(
            key: uploadFormKey,
            child: Column(
              children: [
                image != null
                    ? GestureDetector(
                  onTap: selectImage,
                      child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.file(image!, fit: BoxFit.cover,))),
                    )
                    : GestureDetector(
                        onTap: () {
                          selectImage();
                        },
                        child: DottedBorder(
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
                      ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        'Technology',
                        'Fashion',
                        'Education',
                        'Entertainment',
                      ]
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: GestureDetector(
                                    onTap: () {
                                      if (selectedTopics.contains(e)) {
                                        selectedTopics.remove(e);
                                      } else {
                                        selectedTopics.add(e);
                                      }
                                      setState(() {});
                                      print(selectedTopics);
                                    },
                                    child: Chip(
                                      label: Text(
                                        e,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: selectedTopics.contains(e)
                                                    ? Colors.white
                                                    : null),
                                      ),
                                      side: selectedTopics.contains(e)
                                          ? null
                                          : BorderSide(color: MyColors.grey),
                                      color: selectedTopics.contains(e)
                                          ? MaterialStatePropertyAll(
                                              MyColors.primary)
                                          : null,
                                    )),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BlogEditor(controller: titleController, hintHint: 'Blog Title'),
                SizedBox(
                  height: 10,
                ),
                BlogEditor(
                    controller: contentController, hintHint: 'Blog Content'),
              ],
            ),
          ),
        ),
      );
  },
),
    );
  }
}
