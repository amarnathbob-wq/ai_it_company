import 'package:flutter/material.dart';
import 'master_dashboard.dart';

void main() {
  runApp(const VikashHubApp());
}

class VikashHubApp extends StatelessWidget {
  const VikashHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI CEO Super App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff00E5FF),
      ),
      home: const UltimateMasterDashboard(),
    );
  }
}
