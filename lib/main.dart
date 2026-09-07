import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'main_master_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Connected to live cloud server database
  await Supabase.initialize(
    url: 'https://supabase.co',
    anonKey: 'sb_publishable_F9O8yRky3PfjmxszhKg_hA_HIGZ2vH4',
  );

  runApp(const VikashHubApp());
}

class VikashHubApp extends StatelessWidget {
  const VikashHubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vikash Technical Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF020A1C),
      ),
      home: const MainMasterDashboard(),
    );
  }
}
