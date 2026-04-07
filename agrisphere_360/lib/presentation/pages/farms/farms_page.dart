import 'package:flutter/material.dart';
import 'package:agrisphere_360/core/theme/app_theme.dart';

class FarmsPage extends StatelessWidget {
  const FarmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Farms', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: AppTheme.primaryGreen),
            onPressed: () {
              // TODO: Navigate to Add Farm
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 1, // Placeholder
        itemBuilder: (context, index) {
          return _buildFarmCard(context);
        },
      ),
    );
  }

  Widget _buildFarmCard(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1523348837708-15d4a09cfac2?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Green Valley Farm', 
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.lightGreen,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Active', 
                        style: TextStyle(color: AppTheme.primaryGreen, fontSize: 12)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.crop, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('Wheat | 2.5 Hectares', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('View Analytics'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Manage'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
