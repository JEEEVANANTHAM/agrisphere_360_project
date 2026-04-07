import 'package:flutter/material.dart';
import 'package:agrisphere_360/core/theme/app_theme.dart';
import 'package:agrisphere_360/core/services/ai_service.dart';

class AdvisoryPage extends StatefulWidget {
  const AdvisoryPage({super.key});

  @override
  State<AdvisoryPage> createState() => _AdvisoryPageState();
}

class _AdvisoryPageState extends State<AdvisoryPage> {
  final AiService _aiService = AiService();
  final TextEditingController _promptController = TextEditingController();
  bool _isLoading = false;

  void _askGemini() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ask Gemini AI'),
          content: TextField(
            controller: _promptController,
            decoration: const InputDecoration(
                hintText: 'e.g., How to treat leaf rust in wheat?',
                border: OutlineInputBorder()),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final prompt = _promptController.text;
                if (prompt.isEmpty) return;
                Navigator.pop(context); // Close input dialog
                _showResponseDialog(prompt);
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryGreen),
              child: const Text('Ask', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showResponseDialog(String prompt) async {
    // Show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    final response = await _aiService.ask(prompt);

    if (mounted) {
      Navigator.pop(context); // Close loading
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Gemini Advice'),
          content: SingleChildScrollView(child: Text(response)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Advisory', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildChatbotHeader(),
            const SizedBox(height: 24),
            _buildAdvisorySection(context, 'Crop Nutrition', [
              _buildAdvisoryCard('Apply NPK 19:19:19', 'Next 3 days', Icons.science),
              _buildAdvisoryCard('Zinc Deficiency Alert', 'Immediate', Icons.warning_amber),
            ]),
            const SizedBox(height: 24),
            _buildAdvisorySection(context, 'Pest Management', [
              _buildAdvisoryCard('Aphid Risk: High', 'Monitor Sector B', Icons.bug_report),
            ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _askGemini,
        label: const Text('Ask Gemini'),
        icon: const Icon(Icons.auto_awesome),
        backgroundColor: AppTheme.primaryGreen,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildChatbotHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade800, Colors.green.shade500],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white24,
            child: Icon(Icons.psychology, color: Colors.white, size: 35),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Personalized Insights', 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                Text('Get AI-driven tips for your specific soil and weather conditions.', 
                  style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvisorySection(BuildContext context, String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        ...cards,
      ],
    );
  }

  Widget _buildAdvisoryCard(String title, String timing, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primaryGreen),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Recommended: $timing'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      ),
    );
  }
}
