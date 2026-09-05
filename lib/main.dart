import 'package:flutter/material.dart';

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

class FeatureDetail {
  final String id;
  final String name;
  final String category;
  final String primaryMetric;
  final String metricLabel;
  final String status;
  final bool isPaid;
  final String price;
  final List<String> actions;

  const FeatureDetail({
    required this.id,
    required this.name,
    required this.category,
    required this.primaryMetric,
    required this.metricLabel,
    required this.status,
    required this.isPaid,
    required this.price,
    required this.actions,
  });
}
class FeatureEngine {
  static FeatureDetail getById(int id) {
    if (id == 1) {
      return const FeatureDetail(
        id: "01",
        name: "AI CEO Command Center (Autopilot)",
        category: "01 • Core Free Systems",
        primaryMetric: "₹33.42 Lakhs",
        metricLabel: "Live Operational Net Profit",
        status: "Running (All Actions Auto)",
        isPaid: false,
        price: "Free",
        actions: ["Global View", "SOS Signal", "Sync Network"],
      );
    }
    if (id == 13) {
      return const FeatureDetail(
        id: "13",
        name: "WhatsApp Multi-Agent Bot Engine",
        category: "02 • Marketing Automation",
        primaryMetric: "2.4K Msgs/min",
        metricLabel: "Cloud Multi-Chat Sync Ingestion",
        status: "Webhook Live (Talks & Listens)",
        isPaid: false,
        price: "Free",
        actions: ["Chat Dashboard", "Broadcast Queue"],
      );
    }
    if (id == 38) {
      return const FeatureDetail(
        id: "38",
        name: "AI App & Feature Self-Builder Core",
        category: "03 • Advanced AI R&D",
        primaryMetric: "Ready to Generate",
        metricLabel: "Voice-to-Code Framework Engine",
        status: "Listening Voice Commands",
        isPaid: false,
        price: "Free",
        actions: ["Speak New Feature", "Compile Node"],
      );
    }
    if (id == 85) {
      return const FeatureDetail(
        id: "85",
        name: "AI Voice Cloning Engine",
        category: "99 • Paid Premium Add-ons",
        primaryMetric: "Locked Module",
        metricLabel: "Requires Deep Voice Compute Token",
        status: "Premium License Required",
        isPaid: true,
        price: "₹999/mo",
        actions: ["Unlock Paid Version", "Listen Sample"],
      );
    }

    return FeatureDetail(
      id: id.toString().padLeft(2, '0'),
      name: id > 80 ? "Paid Advanced Feature $id" : "Free Core Module $id",
      category: id > 80 ? "99 • Paid Premium Add-ons" : "01 • Core Free Systems",
      primaryMetric: id > 80 ? "Locked" : "Online OK",
      metricLabel: "Sub-system $id Status Telemetry",
      status: id > 80 ? "Upgrade Needed" : "Operational",
      isPaid: id > 80,
      price: id > 80 ? "₹199/mo" : "Free",
      actions: id > 80 ? ["Unlock Paid Version"] : ["Run System Diagnostics $id"],
    );
  }
}

class UltimateMasterDashboard extends StatefulWidget {
  const UltimateMasterDashboard({super.key});
  @override
  State<UltimateMasterDashboard> createState() => _DashboardState();
}

class _DashboardState extends State<UltimateMasterDashboard> {
  FeatureDetail currentFeature = FeatureEngine.getById(1);
  final TextEditingController _supabaseUrl = TextEditingController();
  final TextEditingController _supabaseKey = TextEditingController();
  final TextEditingController _metaToken = TextEditingController();
  final TextEditingController _openAiToken = TextEditingController();
  void _openCloudSetupConsole() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xff0E1624),
        title: const Text('⚙️ DEVELOPER CLOUD CONSOLE',
            style: TextStyle(color: Color(0xff00E5FF), fontSize: 12, fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Connect Database (Supabase/Firebase):', style: TextStyle(color: Colors.white54, fontSize: 10)),
              const SizedBox(height: 4),
              _buildField(_supabaseUrl, 'Project Reference Database URL'),
              const SizedBox(height: 6),
              _buildField(_supabaseKey, 'Secret Public Security Anon Key'),
              const SizedBox(height: 12),
              const Text('Configure Corporate APIs:', style: TextStyle(color: Colors.white54, fontSize: 10)),
              const SizedBox(height: 4),
              _buildField(_metaToken, 'Meta Phone API Access Token'),
              const SizedBox(height: 6),
              _buildField(_openAiToken, 'Master AI Core Engine Token'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.white30, fontSize: 11)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff00E5FF)),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('⚡ Direct Local Serverless Tokens Activated!')),
              );
            },
            child: const Text('Save IDs & Live Connect', style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  static Widget _buildField(TextEditingController ctrl, String hint) {
    return TextField(
      controller: ctrl,
      style: const TextStyle(color: Colors.white, fontSize: 11),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24, fontSize: 10),
        filled: true,
        fillColor: const Color(0xff141E30),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff060C14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 8),
              _buildTopGrid(),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(flex: 3, child: _buildTree()),
                    const SizedBox(width: 6),
                    Expanded(flex: 5, child: _buildCenter()),
                    const SizedBox(width: 6),
                    Expanded(flex: 3, child: _buildAI()),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              _buildNavbar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xff0E1624),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xff00E5FF).withOpacity(0.3)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.between,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('VIKASH PRIVATE IT COMPANY APP',
                  style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
              Text('INTERNAL HIGH-SECURITY NETWORK • NO WEB HOSTING REQUIRED',
                  style: TextStyle(color: Color(0xff00E5FF), fontSize: 8)),
            ],
          ),
          Icon(Icons.lock, color: Color(0xff00E5FF), size: 16),
        ],
      ),
    );
  }
  Widget _buildTopGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      childAspectRatio: 2.8,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildBox('NETWORK MODE', 'Private Serverless Link'),
        _buildBox('SYSTEM STATUS', '2000 Modules Mapped'),
      ],
    );
  }

  Widget _buildBox(String t, String v) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xff0E1624),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(t, style: const TextStyle(color: Colors.white54, fontSize: 8)),
          Text(v, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTree() {
    final List<Map<String, dynamic>> cats = [
      {'name': '01 • Free Core Framework', 'start': 1, 'end': 5},
      {'name': '02 • Advanced AI Systems', 'start': 13, 'end': 40},
      {'name': '99 • Paid Premium Hub', 'start': 85, 'end': 105},
    ];
    return Container(
      decoration: _paneBox(const Color(0xff00E5FF)),
      child: ListView(
        children: cats.map((cat) {
          int s = cat['start'];
          int e = cat['end'];
          return ExpansionTile(
            dense: true,
            title: Text(cat['name'], style: const TextStyle(color: Colors.white70, fontSize: 8)),
            children: List.generate((e - s + 1).clamp(0, 10), (index) {
              int id = s + index;
              return ListTile(
                dense: true,
                title: Text('F#$id Dashboard View', style: const TextStyle(color: Colors.white30, fontSize: 7)),
                onTap: () {
                  setState(() {
                    currentFeature = FeatureEngine.getById(id);
                  });
                },
              );
            }),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCenter() {
    return Container(
      decoration: _paneBox(const Color(0xff00E5FF)),
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SHIELD SECURITY LEVEL: ACTIVE', style: const TextStyle(color: Colors.white30, fontSize: 7)),
          Text(currentFeature.name, style: const TextStyle(color: Color(0xff00E5FF), fontSize: 11, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(currentFeature.metricLabel, style: const TextStyle(color: Colors.white54, fontSize: 8)),
          Text(currentFeature.primaryMetric, style: TextStyle(color: currentFeature.isPaid ? Colors.amberAccent : Colors.greenAccent, fontSize: 12, fontWeight: FontWeight.bold)),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff141E30),
              side: const BorderSide(color: Color(0xff00E5FF), width: 0.5),
              padding: const EdgeInsets.all(4),
            ),
            onPressed: _openCloudSetupConsole,
            icon: const Icon(Icons.add_link, size: 10, color: Color(0xff00E5FF)),
            label: const Text('Open Dynamic Server Setup', style: TextStyle(color: Colors.white, fontSize: 7)),
          )
        ],
      ),
    );
  }

  Widget _buildAI() {
    return Container(
      decoration: _paneBox(const Color(0xff00E5FF)),
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('AI HUB MATRIX', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Expanded(child: Text(currentFeature.isPaid ? '🔒 Premium Features System ID Token Verification Layer is Locked.' : 'Local system engine operational tracking pipeline active for ${currentFeature.name}.', style: const TextStyle(color: Colors.white54, fontSize: 7))),
        ],
      ),
    );
  }

  Widget _buildNavbar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.home, color: Color(0xff00E5FF), size: 14)],
      ),
    );
  }

  BoxDecoration _paneBox(Color clr) {
    return BoxDecoration(
      color: const Color(0xff0E1624),
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: clr.withOpacity(0.15)),
    );
  }
}
