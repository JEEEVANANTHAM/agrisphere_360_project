import 'package:flutter/material.dart';
import 'package:agrisphere_360/core/theme/app_theme.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Row(
        children: [
          if (isWeb) _buildSidebar(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text('Admin Control Center'),
                  floating: true,
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildOverallStats(),
                        const SizedBox(height: 32),
                        const Text('System Alerts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        _buildSystemStatusTable(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 250,
      color: Colors.grey.shade900,
      child: Column(
        children: [
          const DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(backgroundColor: AppTheme.primaryGreen, child: Icon(Icons.admin_panel_settings, color: Colors.white)),
                SizedBox(height: 12),
                Text('AgriSphere Admin', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          _sidebarItem(Icons.dashboard, 'Dashboard', true),
          _sidebarItem(Icons.people, 'User Management', false),
          _sidebarItem(Icons.bug_report, 'Disease Outbreaks', false),
          _sidebarItem(Icons.analytics, 'Revenue Reports', false),
          _sidebarItem(Icons.notifications_active, 'Broadcast', false),
          const Spacer(),
          _sidebarItem(Icons.settings, 'Settings', false),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _sidebarItem(IconData icon, String title, bool active) {
    return ListTile(
      leading: Icon(icon, color: active ? AppTheme.primaryGreen : Colors.grey),
      title: Text(title, style: TextStyle(color: active ? Colors.white : Colors.grey)),
      onTap: () {},
    );
  }

  Widget _buildOverallStats() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        _statCard('Total Farmers', '1,245', Icons.people, Colors.blue),
        _statCard('Active Farms', '3,890', Icons.landscape, Colors.green),
        _statCard('AI Reports', '452', Icons.auto_awesome, Colors.purple),
        _statCard('System Health', '99.9%', Icons.check_circle, Colors.teal),
      ],
    );
  }

  Widget _statCard(String label, String value, IconData icon, Color color) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildSystemStatusTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: const Column(
        children: [
           ListTile(
            title: Text('Pest Outbreak: Northern Region'),
            subtitle: Text('High incidence of Locusts reported by 45 users.'),
            trailing: Chip(label: Text('High Priority'), backgroundColor: Colors.redAccent),
          ),
          Divider(),
           ListTile(
            title: Text('Database Health'),
            subtitle: Text('Firestore read/write latency is within 150ms.'),
            trailing: Chip(label: Text('Normal'), backgroundColor: Colors.greenAccent),
          ),
        ],
      ),
    );
  }
}
