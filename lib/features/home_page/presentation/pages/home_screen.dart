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

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => HomeScreen());
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;
  final List<String> _categories = [
    'All',
    'Technology',
    'Lifestyle',
    'Business',
    'Culture'
  ];
  String _selectedCategory = 'All';


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
          const SizedBox(height: 20),
          _buildSectionTitle("Recommended"),
          const SizedBox(height: 16),
          _buildRecommendedList(myblogs: state.blogs),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(),
          ),
          const SizedBox(height: 6),
          _buildCategoryFilters(),
          const SizedBox(height: 12),
          _buildTrendingList(myblogs: state.blogs),
        ],
      );
    }
    return SizedBox();
  },
),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }


  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildRecommendedList({required List<BlogPost> myblogs}) {
    return SizedBox(
      height: 250, // Adjusted height to fit content
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: myblogs.length,
        itemBuilder: (context, index) {
          final singleblog = myblogs[index];
          if (index == myblogs.length - 1) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: RecommendedCard(
                article: singleblog,
                onTourched: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticleScreen(
                              article: singleblog,
                            )),
                  );
                },
              ),
            );
          }
          return RecommendedCard(
            article:singleblog,
            onTourched: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArticleScreen(
                          article: singleblog,
                        )),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return SizedBox(
      height: 43,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        padding: const EdgeInsets.only(left: 16.0),
        itemBuilder: (context, index) {
          final category = _categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              labelPadding: EdgeInsets.zero,
              label: Text(category),
              selected: _selectedCategory == category,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedCategory = category;
                  });
                }
              },
              backgroundColor: Colors.white,
              selectedColor: Colors.black,
              labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: _selectedCategory == category
                        ? Colors.white
                        : Colors.black,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade300),
                borderRadius:
                    BorderRadius.circular(8.0), // Adjust the radius here
              ),
              showCheckmark: false,
            ),
          );
        },
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

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor ,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Iconsax.home_2), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Iconsax.tag_2), label: 'Saved'),
        BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle), label: 'Profile'),
      ],
      currentIndex: _bottomNavIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      elevation: 2,
      onTap: (index) {
        setState(() {
          _bottomNavIndex = index;
        });
        print(_bottomNavIndex);
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
          // Notification Icon with a dot
          IconButton(
            icon: const Icon(Iconsax.additem, size: 32),
            onPressed: () {
              Navigator.push(context, AddNewBlog.route());
            },
          ),
          // Notification Icon with a dot
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
