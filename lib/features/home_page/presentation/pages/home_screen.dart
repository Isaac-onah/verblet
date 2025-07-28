import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:verblet/features/blog_details/detail_screen.dart';
import 'package:verblet/features/home_page/domain/entity.dart';
import 'package:verblet/features/home_page/presentation/widgets/article_list_item.dart';
import 'package:verblet/features/home_page/presentation/widgets/recomended_card.dart';

class HomeScreen extends StatefulWidget {
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

  // --- Mock Data ---
  final List<Article> _recommendedArticles = [
    Article(
      imageUrl:
          'https://images.unsplash.com/photo-1593508512255-86ab42a8e620?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb&w=600',
      category: 'Technology',
      title: 'New VR Headsets That Will Shape the Metaverse',
      authorName: 'Mason Eduard',
      authorImageUrl: 'https://i.pravatar.cc/150?img=1',
      date: 'Jan 3, 2022',
      views: '3344',
      content:
          'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec sollicitudin molestie malesuada. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim.',
    ),
    Article(
      imageUrl:
          'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb&w=600',
      category: 'Technology',
      title: 'How AI is changing the tech landscape',
      authorName: 'Aria Lee',
      authorImageUrl: 'https://i.pravatar.cc/150?img=2',
      date: 'Jan 4, 2022',
      views: '2981',
      content:
          'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec sollicitudin molestie malesuada. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim.',
    ),
    Article(
      imageUrl:
          'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
      category: 'Technology',
      title: 'The Retro Revolution: Why Old Tech is New Again',
      authorName: 'Aria Lee',
      authorImageUrl: 'https://i.pravatar.cc/150?img=3',
      date: 'Jul 22, 2025',
      views: '3540',
      content:
          'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec sollicitudin molestie malesuada. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim.',
    ),
    Article(
      imageUrl:
          'https://images.unsplash.com/photo-1531297484001-80022131f5a1?q=80&w=600&auto=format&fit=crop',
      category: 'Business',
      title: 'The Future of Web Development: Trends to Watch',
      authorName: 'Alex Carter',
      authorImageUrl: 'https://i.pravatar.cc/150?img=7',
      date: 'Jul 19, 2025',
      views: '5821',
      content:
          'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec sollicitudin molestie malesuada. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim.',
    ),
  ];

  final List<Article> _trendingArticles = [
    Article(
      imageUrl:
          'https://images.unsplash.com/photo-1534644107580-3a4dbd494a95?q=80&w=600&auto=format&fit=crop',
      category: 'Technology',
      title: 'Augmented Reality Trends for 2022',
      authorName: 'Tech Today',
      authorImageUrl: 'https://i.pravatar.cc/150?img=3',
      date: 'Jan 4, 2022',
      views: '3344',
      content:
          'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec sollicitudin molestie malesuada. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim.',
    ),
    Article(
      imageUrl:
          'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb&w=600',
      category: 'Business',
      title: 'Stocks making the biggest moves midday: Tesla...',
      authorName: 'Market Watch',
      authorImageUrl: 'https://i.pravatar.cc/150?img=4',
      date: 'Jan 1, 2022',
      views: '9823',
      content:
          'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec sollicitudin molestie malesuada. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim.',
    ),
    Article(
      imageUrl:
          'https://images.unsplash.com/photo-1512152272829-e3139592d56f?q=80&w=600&auto=format&fit=crop',
      category: 'Lifestyle',
      title: 'Minimalist Living: How to Declutter Your Life',
      authorName: 'Chloe Davis',
      authorImageUrl: 'https://i.pravatar.cc/150?img=5',
      date: 'Jul 15, 2025',
      views: '5102',
      content:
          'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec sollicitudin molestie malesuada. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim.',
    ),
    Article(
      imageUrl:
          'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb&w=600',
      category: 'Culture',
      title: 'The Enduring Appeal of Classic Cinema',
      authorName: 'Leo Grant',
      authorImageUrl: 'https://i.pravatar.cc/150?img=6',
      date: 'Jul 11, 2025',
      views: '4398',
      content:
          'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec sollicitudin molestie malesuada. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Proin eget tortor risus. Quisque velit nisi, pretium ut lacinia in, elementum id enim.',
    ),
  ];

  // --- End Mock Data ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _search(context),
            const SizedBox(height: 20),
            _buildSectionTitle("Recommended"),
            const SizedBox(height: 16),
            _buildRecommendedList(),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
            const SizedBox(height: 6),
            _buildCategoryFilters(),
            const SizedBox(height: 12),
            _buildTrendingList(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined, size: 28),
            onPressed: () {},
          ),
        ],
      ),
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

  Widget _buildRecommendedList() {
    return SizedBox(
      height: 250, // Adjusted height to fit content
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _recommendedArticles.length,
        itemBuilder: (context, index) {
          if (index == _recommendedArticles.length - 1) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: RecommendedCard(
                article: _recommendedArticles[index],
                onTourched: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticleScreen(
                              article: _recommendedArticles[index],
                            )),
                  );
                },
              ),
            );
          }
          return RecommendedCard(
            article: _recommendedArticles[index],
            onTourched: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArticleScreen(
                          article: _recommendedArticles[index],
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

  Widget _buildTrendingList() {
    return ListView.builder(
      itemCount: _trendingArticles.length,
      shrinkWrap: true,
      // Important inside another ListView
      physics: const NeverScrollableScrollPhysics(),
      // Disables its own scrolling
      itemBuilder: (context, index) {
        return ArticleListItem(article: _trendingArticles[index]);
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
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.notifications_none_outlined, size: 32),
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
