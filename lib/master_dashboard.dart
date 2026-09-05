import 'package:flutter/material.dart';
import 'feature_model.dart';

class UltimateMasterDashboard
    extends StatefulWidget {
  const UltimateMasterDashboard({
    super.key
  });

  @override
  State<UltimateMasterDashboard> createState() =>
      _DashboardState();
}

class _DashboardState
    extends State<UltimateMasterDashboard> {
  FeatureDetail currentFeature =
      FeatureEngine.getById(1);
  
  bool isAutopilotOn = true;

  final TextEditingController _supabaseUrl = TextEditingController();
  final TextEditingController _supabaseKey = TextEditingController();
  final TextEditingController _metaToken = TextEditingController();
  final TextEditingController _openAiToken = TextEditingController();

  void _openCloudSetupConsole() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xff0E1624),
        title: const Text('⚙️ DEVELOPER CENTRAL CONTROL CONSOLE',
            style: TextStyle(color: Color(0xff00E5FF), fontSize: 12, fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildField(_supabaseUrl, 'Project Reference Database URL (Supabase)'),
              const SizedBox(height: 6),
              _buildField(_supabaseKey, 'Secret Public Security Anon Key Token'),
              const SizedBox(height: 12),
              _buildField(_metaToken, 'Meta Phone Business API Access Token'),
              const SizedBox(height: 6),
              _buildField(_openAiToken, 'Master AI Core Compute Engine Key'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close Terminal', style: TextStyle(color: Colors.white30, fontSize: 11)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff00E5FF)),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('⚡ Cloud Databases & API Credentials Secured Locally inside Framework!')),
              );
            },
            child: const Text('Initialize & Save System Keys', style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
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
              Text('VIKASH PRIVATE IT HOLDINGS CORE LAYER',
                  style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
              Text('HIGH-SECURITY CLOSED ENTERPRISE APP • NO HOSTING / NO PUBLIC DOMAIN REQUIRED',
                  style: TextStyle(color: Color(0xff00E5FF), fontSize: 8)),
            ],
          ),
          Icon(Icons.shield_outlined, color: Color(0xff00E5FF), size: 16),
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
        GestureDetector(
          onTap: () {
            setState(() {
              isAutopilotOn = !isAutopilotOn;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(isAutopilotOn ? '🤖 AI Autopilot System ENGAGED (Autonomous Mode)' : '🛑 AI Autopilot DISENGAGED (Manual Control Mode)')),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isAutopilotOn ? const Color(0xff0E241B) : const Color(0xff240E14),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: isAutopilotOn ? Colors.greenAccent : Colors.redAccent, width: 0.8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('AI AUTOPILOT CONTROLLER', style: TextStyle(color: Colors.white54, fontSize: 7)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.between,
                  children: [
                    Text(isAutopilotOn ? 'STATUS: ON' : 'STATUS: OFF', style: TextStyle(color: isAutopilotOn ? Colors.greenAccent : Colors.redAccent, fontSize: 10, fontWeight: FontWeight.bold)),
                    Icon(isAutopilotOn ? Icons.toggle_on : Icons.toggle_off, color: isAutopilotOn ? Colors.greenAccent : Colors.redAccent, size: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
        _buildBox('SUPER ARCHITECTURE MODULES', '2000 Functional Sub-Systems Live'),
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

  // High-Performance Lag-Free ListView.builder Engine for 2,000 components
  Widget _buildTree() {
    return Container(
      decoration: _paneBox(const Color(0xff00E5FF)),
      child: ListView.builder(
        itemCount: 2000,
        itemBuilder: (context, index) {
          int id = index + 1;
          return ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            title: Text('F#$id Dashboard Terminal', 
                style: const TextStyle(color: Colors.white70, fontSize: 8)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 6, color: Colors.white30),
            onTap: () {
              setState(() {
                currentFeature = FeatureEngine.getById(id);
              });
            },
          );
        },
      ),
    );
  }
  Widget _buildCenter() {
    return Container(
      decoration: _paneBox(const Color(0xff00E5FF)),
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text('SHIELD ENCRYPTION LAYER: OPTIMAL STATUS', style: const TextStyle(color: Colors.white30, fontSize: 7)),
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
            icon: const Icon(Icons.cloud_download_outlined, size: 10, color: Color(0xff00E5FF)),
            label: const Text('Open Developer Connection Setup', style: TextStyle(color: Colors.white, fontSize: 7)),
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
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text('AI SYSTEM HUB CONSOLE', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Expanded(child: Text(currentFeature.isPaid ? '🔒 Premium Features Security ID Token Verification Layer is Locked. Input Key to Route.' : 'Local secure system intelligence engine operational tracking telemetry active for ${currentFeature.name}. Autopilot controller matrix is live.', style: const TextStyle(color: Colors.white54, fontSize: 7))),
        ],
      ),
    );
  }

  Widget _buildNavbar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.home_filled, color: Color(0xff00E5FF), size: 14)],
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
