import 'package:flutter/material.dart';
import 'package:agrisphere_360/core/theme/app_theme.dart';

class FinancialPage extends StatelessWidget {
  const FinancialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Analytics', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: _buildStatCard('Income', '₹1,25,000', Colors.green)),
                const SizedBox(width: 16),
                Expanded(child: _buildStatCard('Expenses', '₹45,000', Colors.red)),
              ],
            ),
            const SizedBox(height: 24),
            _buildChartPlaceholder(context),
            const SizedBox(height: 24),
            _buildRecentTransactions(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.primaryGreen,
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [AppTheme.darkGreen, AppTheme.primaryGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Net Profit (This Season)', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 8),
          Text('₹80,000', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.trending_up, color: Colors.white, size: 20),
              SizedBox(width: 4),
              Text('12% increase from last season', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildChartPlaceholder(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bar_chart, size: 48, color: Colors.grey),
            Text('Profit & Loss Trend', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recent Transactions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            final transactions = [
              ['Seeds Purchase', '-₹5,000', 'Expense'],
              ['Wheat Sale', '+₹40,000', 'Income'],
              ['Fertilizer', '-₹2,500', 'Expense'],
            ];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: transactions[index][2] == 'Income' ? Colors.green.shade50 : Colors.red.shade50,
                child: Icon(
                  transactions[index][2] == 'Income' ? Icons.add : Icons.remove,
                  color: transactions[index][2] == 'Income' ? Colors.green : Colors.red,
                ),
              ),
              title: Text(transactions[index][0]),
              subtitle: const Text('2 days ago'),
              trailing: Text(
                transactions[index][1],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: transactions[index][2] == 'Income' ? Colors.green : Colors.red,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
