import 'package:flutter/material.dart';
import 'multi_device_manager.dart';

class MainMasterDashboard extends StatefulWidget {
  const MainMasterDashboard({Key? key}) : super(key: key);
  @override
  State<MainMasterDashboard> createState() => _MainMasterDashboardState();
}

class _MainMasterDashboardState extends State<MainMasterDashboard> {
  String currentActiveWindow = "DEFAULT_METRICS";
  String queryFilter = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020A1C),
      body: Row(
        children: [
          // 🌿 LEFT PANEL: FEATURES TREE NAVIGATION (1 TO 20)
          Container(
            width: 260,
            color: const Color(0xFF051124),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("FEATURES TREE", style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, i) {
                      if (queryFilter.isNotEmpty && !("Feature Slot ${i + 1}".toLowerCase().contains(queryFilter.toLowerCase()))) {
                        return const SizedBox.shrink();
                      }
                      return ListTile(
                        leading: Icon(Icons.blur_circular, size: 16, color: Colors.blueAccent.withOpacity(0.8)),
                        title: Text("Feature Slot ${i + 1}", style: const TextStyle(color: Colors.white70, fontSize: 13)),
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          
          // CENTRAL ENGINE CONTROLLER WINDOW
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // 🔍 Top AppBar Area (Exact Arrow Position) Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(color: const Color(0xFF051124), borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      onChanged: (val) => setState(() => queryFilter = val),
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(hintText: "Search 2000+ AI Features...", hintStyle: TextStyle(color: Colors.white38), border: InputBorder.none, prefixIcon: Icon(Icons.search, color: Colors.cyanAccent)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // GLOBAL OPERATIONAL MATRIX DISPLAYMAP LAYER
                  Expanded(
                    flex: 3, 
                    child: Container(
                      decoration: BoxDecoration(color: const Color(0xFF041730), borderRadius: BorderRadius.circular(12)), 
                      child: const Center(child: Text("GLOBAL OPERATIONAL COMMAND MAP", style: TextStyle(color: Colors.white38, letterSpacing: 1.5)))
                    )
                  ),
                  const SizedBox(height: 12),
                  
                  // 🎛️ THE BLUE GHERA CONTAINER (Tabs System Switcher Module)
                  Expanded(flex: 2, child: _buildGheraCentralTabEngine()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGheraCentralTabEngine() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF051124), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.blueAccent, width: 1.5)),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ["DEFAULT_METRICS", "AI_CHAT", "GOD_MODE", "CREDENTIALS", "BILLING", "LEDGER", "AI_DEMAND"].map((tabNode) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(tabNode, style: const TextStyle(fontSize: 10, color: Colors.white)),
                    selected: currentActiveWindow == tabNode,
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.transparent,
                    onSelected: (state) => setState(() => currentActiveWindow = state ? tabNode : "DEFAULT_METRICS"),
                  ),
                );
              }).toList(),
            ),
          ),
          const Divider(color: Colors.white12, height: 16),
          Expanded(child: _renderActiveGheraModule()),
        ],
      ),
    );
  }

  Widget _renderActiveGheraModule() {
    switch (currentActiveWindow) {
      case "AI_CHAT": return const Center(child: Text("💬 Supreme AI Command Chat Room Live Node", style: TextStyle(color: Colors.white)));
      case "GOD_MODE": return const Center(child: Text("🏗️ AI God-Mode Feature Installer Runtime Engine Active", style: TextStyle(color: Colors.cyanAccent)));
      case "CREDENTIALS": return _buildMultiDevicePanel();
      case "BILLING": return const Center(child: Text("💸 Premium Hub: Recharge OpenAI / Bland.ai Credits", style: TextStyle(color: Colors.amberAccent)));
      case "LEDGER": return const Center(child: Text("📊 Real-Time Financial Ledger: Tracking micro-costs up to ₹0.01", style: TextStyle(color: Colors.emeraldAccent)));
      case "AI_DEMAND": return const Center(child: Text("🔔 Requirement Gathering Terminal: Input required data", style: TextStyle(color: Colors.redAccent)));
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _originalMetricsCard("Total Revenue", "10Cr+ Approved"),
            _originalMetricsCard("AI Systems Active", "2000+ Active"),
            _originalMetricsCard("Global Branches", "500+ Links Live"),
          ],
        );
    }
  }

  Widget _originalMetricsCard(String header, String val) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(header, style: const TextStyle(color: Colors.white38, fontSize: 11)), const SizedBox(height: 4), Text(val, style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontSize: 14))]);
  }

  Widget _buildMultiDevicePanel() {
    return Column(
      children: [
        const Text("👑 ACTIVE DEVICES PANEL (MALIK PROFILE SYSTEM)", style: TextStyle(color: Colors.greenAccent, fontSize: 11, fontWeight: FontWeight.bold)),
        Expanded(
          child: ListView.builder(
            itemCount: MultiDeviceManager.activeSystemDevices.length,
            itemBuilder: (context, idx) {
              final dev = MultiDeviceManager.activeSystemDevices[idx];
              return ListTile(
                title: Text(dev.deviceName, style: const TextStyle(color: Colors.white, fontSize: 12)),
                subtitle: Text("Status: ${dev.lastActive}", style: const TextStyle(color: Colors.white38, fontSize: 10)),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () async {
                    await MultiDeviceManager.wipeTargetDeviceMemory(targetId: dev.deviceId);
                    setState(() => MultiDeviceManager.activeSystemDevices.removeAt(idx));
                  },
                  child: const Text("Wipe Phone", style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
                  );
            },
          ),
        )
      ],
    );
  }
}
