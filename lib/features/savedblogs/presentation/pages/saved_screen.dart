import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:verblet/core/common/image_text.dart';
import 'package:verblet/core/common/loader.dart';
import 'package:verblet/core/common/snackbar.dart';
import 'package:verblet/features/blog_details/detail_screen.dart';
import 'package:verblet/features/home_page/domain/entity/blog_entity.dart';
import 'package:verblet/features/home_page/presentation/blogbloc/blog_bloc.dart';
import 'package:verblet/features/home_page/presentation/pages/add_new_blog.dart';
import 'package:verblet/features/home_page/presentation/widgets/article_list_item.dart';
import 'package:verblet/features/home_page/presentation/widgets/recomended_card.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {


  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(FetchAllBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<BlogBloc, BlogState>(
  listener: (context, state) {
    if(state is BlogFailure){
      showSnackBar(context, 'Oops', state.error);
    }
  },
  builder: (context, state) {
    if(state is BlogLoading){
      return Loader( animation: MyImages.signAnimation, );
    }
    if(state is BlogDisplaySuccess){
      return ListView(
        children: [
          _search(context),
          const SizedBox(height: 12),
          _buildTrendingList(myblogs: state.blogs),
        ],
      );
    }
    return SizedBox();
  },
),
      ),
    );
  }



  Widget _buildTrendingList({required List<BlogPost> myblogs}) {
    return ListView.builder(
      itemCount: myblogs.length,
      shrinkWrap: true,
      // Important inside another ListView
      physics: const NeverScrollableScrollPhysics(),
      // Disables its own scrolling
      itemBuilder: (context, index) {
        final singleblog = myblogs[index];
        return ArticleListItem(article:singleblog,onTourched: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleScreen(
                  article: singleblog,
                )),
          );
        },);
      },
    );
  }

  Widget _search(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // Use Expanded to make the TextField take up all available space
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 28),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none, // No border
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Iconsax.notification, size: 32),
                Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
            onPressed: () {
              // Handle notification tap
            },
          ),
        ],
      ),
    );
  }

}
