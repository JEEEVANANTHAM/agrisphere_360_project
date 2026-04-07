import 'package:flutter/material.dart';
import 'package:agrisphere_360/core/theme/app_theme.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Prices', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildMarketSummary(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildPriceCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMarketSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppTheme.lightGreen,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SummaryItem(label: 'Avg Wheat', price: '₹2,450', trend: 2.5),
          _SummaryItem(label: 'Avg Rice', price: '₹3,200', trend: -1.2),
        ],
      ),
    );
  }

  Widget _buildPriceCard(int index) {
    final crops = ['Wheat', 'Rice (Basmati)', 'Cotton', 'Maize'];
    final prices = ['₹2,450/q', '₹6,500/q', '₹7,200/q', '₹2,100/q'];
    final markets = ['Delhi Mandi', 'Amritsar Market', 'Gujarat Hub', 'Pune Mandi'];

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.eco, color: AppTheme.primaryGreen),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(crops[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(markets[index], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(prices[index], style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryGreen)),
                const Text('Last updated: 2h ago', style: TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String price;
  final double trend;

  const _SummaryItem({required this.label, required this.price, required this.trend});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Row(
          children: [
            Icon(trend > 0 ? Icons.trending_up : Icons.trending_down, 
              size: 14, color: trend > 0 ? Colors.green : Colors.red),
            const SizedBox(width: 4),
            Text('${trend.abs()}%', style: TextStyle(color: trend > 0 ? Colors.green : Colors.red, fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
