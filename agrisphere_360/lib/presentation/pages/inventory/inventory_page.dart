import 'package:flutter/material.dart';
import 'package:agrisphere_360/core/theme/app_theme.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildInventoryCategory('Seeds', [
            _buildStockItem('Wheat Seeds', '150 kg', 0.8),
            _buildStockItem('Corn Seeds', '20 kg', 0.2), // Low stock
          ]),
          const SizedBox(height: 24),
          _buildInventoryCategory('Fertilizers', [
            _buildStockItem('Urea', '500 kg', 0.9),
            _buildStockItem('DAP', '200 kg', 0.5),
          ]),
          const SizedBox(height: 24),
          _buildInventoryCategory('Equipment', [
            _buildStockItem('Tractor', '1 Unit', 1.0),
            _buildStockItem('Sprayer', '3 Units', 1.0),
          ]),
        ],
      ),
    );
  }

  Widget _buildInventoryCategory(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(onPressed: () {}, child: const Text('View All')),
          ],
        ),
        ...items,
      ],
    );
  }

  Widget _buildStockItem(String name, String quantity, double level) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(quantity, style: const TextStyle(color: AppTheme.primaryGreen)),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: level,
              backgroundColor: Colors.grey.shade200,
              color: level < 0.3 ? Colors.red : AppTheme.primaryGreen,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      ),
    );
  }
}
