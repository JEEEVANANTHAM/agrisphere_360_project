import 'package:flutter/material.dart';
import 'package:agrisphere_360/core/theme/app_theme.dart';
import 'package:agrisphere_360/presentation/pages/home/home_page.dart';
import 'package:agrisphere_360/injection_container.dart' as di;
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint("Warning: .env file not found or failed to load. AI features may not work. Error: $e");
  }

  await di.init();
  // TODO: Initialize Firebase with Firebase.initializeApp()
  runApp(const AgriSphere360());
}

class AgriSphere360 extends StatelessWidget {
  const AgriSphere360({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriSphere 360',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
