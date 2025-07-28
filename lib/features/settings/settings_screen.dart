import 'package:flutter/material.dart';
import 'package:verblet/features/settings/widgets/setings_section_title.dart';
import 'package:verblet/features/settings/widgets/settings_list_item.dart';
import 'package:iconsax/iconsax.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingsSectionTitle(title: 'Your account'),
              SettingsListItem(
                icon: Iconsax.profile_circle,
                title: 'Account',
                trailing: const Text('+20 1032 674 174'),
                onTap: () {},
              ),
              SettingsListItem(
                icon: Iconsax.notification,
                title: 'Notifications',
                trailing: const Text('Allowed'),
                onTap: () {},
              ),
              SettingsListItem(
                icon: Iconsax.language_circle,
                title: 'Language',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('English'),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, color: Colors.grey[700]),
                  ],
                ),
                onTap: () {},
              ),
              const SettingsSectionTitle(title: 'About us'),
              SettingsListItem(
                icon: Iconsax.star_1,
                title: 'Rate us',
                trailing: const Text('Write about us in your store'),
                onTap: () {},
              ),
              SettingsListItem(
                icon: Iconsax.pen_add,
                title: 'Feedback',
                trailing: const Text('Write your opinion for us'),
                onTap: () {},
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text(
                    'Log out',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Center(
                child: Text(
                  'Jetts © 2025 v1.0',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}