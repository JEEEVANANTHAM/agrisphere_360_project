import 'package:flutter/material.dart';
import 'package:agrisphere_360/core/theme/app_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=300&q=80'),
            ),
            const SizedBox(height: 16),
            const Text('Thamizhselvan', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Farmer | Premium Member', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 32),
            _buildProfileSection('Account Settings', [
              _buildProfileTile(Icons.person, 'Edit Profile'),
              _buildProfileTile(Icons.notifications, 'Notifications'),
              _buildProfileTile(Icons.language, 'Language (English)'),
            ]),
            const SizedBox(height: 24),
            _buildProfileSection('Business', [
              _buildProfileTile(Icons.account_balance_wallet, 'Expenses & Income'),
              _buildProfileTile(Icons.inventory_2, 'Inventory Management'),
              _buildProfileTile(Icons.analytics, 'System Analytics'),
            ]),
            const SizedBox(height: 24),
            _buildProfileSection('Support', [
              _buildProfileTile(Icons.help, 'Help Center'),
              _buildProfileTile(Icons.description, 'Terms & Conditions'),
              _buildProfileTile(Icons.logout, 'Logout', color: Colors.red),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: tiles,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileTile(IconData icon, String title, {Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppTheme.primaryGreen),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.chevron_right, size: 18),
      onTap: () {},
    );
  }
}
