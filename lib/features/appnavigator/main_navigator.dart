
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:verblet/core/theme/app_pallete.dart';
import 'package:verblet/core/theme/themebloc/theme_bloc.dart';
import 'package:verblet/core/theme/themebloc/theme_state.dart';
import 'package:verblet/features/appnavigator/navigatorbloc/navigation_bloc.dart';
import 'package:verblet/features/home_page/presentation/pages/home_screen.dart';
import 'package:verblet/features/savedblogs/presentation/pages/saved_screen.dart';
import 'package:verblet/features/settings/settings_screen.dart';

class mainNavigator extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => mainNavigator());
  const mainNavigator({super.key});


  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      SavedScreen(),
      SettingsScreen(),
    ];

    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {

          return BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              return Scaffold(
                  body: screens[state.selectedIndex],
                  bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
                    builder: (context, navState) {
                      final isDarkMode = Theme.of(context).brightness == Brightness.dark;
                      return NavigationBarTheme(
                        data: NavigationBarThemeData(
                          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
                            final isDarkMode = Theme.of(context).brightness == Brightness.dark;
                            final isSelected = states.contains(MaterialState.selected);

                            return Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: isSelected
                                  ? (isDarkMode ? MyColors.inprimary : MyColors.primary)
                                  : null,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                              fontSize: isSelected ? 13 : 12,
                            );
                          }),
                        ),
                        child: NavigationBar(
                          height: 80,
                          elevation: 0,
                          selectedIndex: navState.selectedIndex,
                          onDestinationSelected: (index) {
                            context.read<NavigationBloc>().add(NavigationTabChanged(index));
                          },
                          backgroundColor: Theme.of(context).brightness == Brightness.dark ? MyColors.dark :Colors.white,
                          indicatorColor: Colors.transparent,
                          destinations: [
                            NavigationDestination(
                              icon: Icon(Iconsax.home_2,
                                color: navState.selectedIndex == 0 ? isDarkMode ? MyColors.inprimary : MyColors.primary : null,
                              ),
                              label: '$isDarkMode',
                            ),
                            NavigationDestination(
                              icon: Icon(Iconsax.tag_2,
                                color: navState.selectedIndex == 1 ? isDarkMode ? MyColors.inprimary : MyColors.primary : null,
                              ),
                              label: 'Bookings',
                            ),
                            NavigationDestination(
                              icon: Icon(Iconsax.profile_circle,
                                color: navState.selectedIndex == 2 ? isDarkMode ? MyColors.inprimary : MyColors.primary : null,
                              ),
                              label: 'Wishlist',
                            ),
                          ],
                        ),
                      );
                    },
                  )

              );
            },
          );
        }
    );

  }
}