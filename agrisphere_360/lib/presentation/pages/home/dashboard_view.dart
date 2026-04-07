import 'package:flutter/material.dart';
import 'package:agrisphere_360/core/theme/app_theme.dart';
import 'package:agrisphere_360/presentation/widgets/custom_map.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('AgriSphere 360', 
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.primaryGreen, AppTheme.secondaryGreen],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -20,
                      top: 40,
                      child: Icon(Icons.eco, size: 150, color: Colors.white.withOpacity(0.1)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildWeatherCard(),
                  const SizedBox(height: 24),
                  Text('Quick Actions', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  _buildQuickActions(context),
                  const SizedBox(height: 24),
                  Text('Crop Health (Satellite)', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  _buildHealthCard(),
                  const SizedBox(height: 24),
                  Text('Recent Alerts', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  _buildAlertList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Mostly Sunny', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text('28°C', 
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppTheme.primaryGreen)),
                  const SizedBox(width: 8),
                  Icon(Icons.wb_sunny, color: Colors.orange.shade400),
                ],
              ),
              const Text('Humidity: 45% | Wind: 12km/h', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              minimumSize: const Size(0, 40),
            ),
            child: const Text('Detail'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildActionItem(Icons.camera_alt, 'Scan', Colors.blue),
        _buildActionItem(Icons.water_drop, 'Irrigate', Colors.cyan),
        _buildActionItem(Icons.bug_report, 'Pests', Colors.red),
        _buildActionItem(Icons.inventory, 'Stock', Colors.orange),
      ],
    );
  }

  Widget _buildActionItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildHealthCard() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            const CustomMap(),
            Positioned(
              bottom: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.circle, color: Colors.green, size: 12),
                    SizedBox(width: 8),
                    Text('Farm A - Healthy', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: index == 0 ? Colors.red.shade100 : Colors.orange.shade100,
              child: Icon(index == 0 ? Icons.warning : Icons.info, 
                color: index == 0 ? Colors.red : Colors.orange),
            ),
            title: Text(index == 0 ? 'Pest Outbreak Alert' : 'Rain Predicted'),
            subtitle: Text(index == 0 ? 'High risk of Aphids in Sector B' : 'Expect 12mm rain tomorrow morning'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        );
      },
    );
  }
}
