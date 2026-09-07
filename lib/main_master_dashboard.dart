import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'multi_device_manager.dart';
import 'ai_command_engine.dart';

class MainMasterDashboard extends StatefulWidget {
  const MainMasterDashboard({Key? key}) : super(key: key);
  @override
  State<MainMasterDashboard> createState() => _MainMasterDashboardState();
}

class _MainMasterDashboardState extends State<MainMasterDashboard> {
  String currentActiveWindow = "DEFAULT_METRICS";
  String queryFilter = "";
  final TextEditingController _chatInputController = TextEditingController();
  List<String> chatLogs = ["AI CEO System Initialized. Standing by, Master Vikash..."];
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF020A1C));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020A1C),
      body: Row(
        children: [
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
                      String featureName = "Feature Slot ${i + 1}";
                      if (i == 0) featureName = "AI Auto-Calling Automation";
                      if (i == 1) featureName = "Global Multi-Tenant Server Management";
                      if (i == 2) featureName = "Military-Grade Security Armor";

                      if (queryFilter.isNotEmpty && !(featureName.toLowerCase().contains(queryFilter.toLowerCase()))) {
                        return const SizedBox.shrink();
                      }
                      return ListTile(
                        leading: Icon(Icons.blur_circular, size: 16, color: Colors.blueAccent.withOpacity(0.8)),
                        title: Text(featureName, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                        onTap: () {
                          setState(() {
                            chatLogs.add("Selected Node: $featureName Dashboard Configured.");
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
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
                  Expanded(
                    flex: 3, 
                    child: Container(
                      decoration: BoxDecoration(color: const Color(0xFF041730), borderRadius: BorderRadius.circular(12)), 
                      child: const Center(child: Text("GLOBAL OPERATIONAL COMMAND MAP (195 DESH ACTIVE)", style: TextStyle(color: Colors.white38, letterSpacing: 1.5)))
                    )
                  ),
                  const SizedBox(height: 12),
                  Expanded(flex: 3, child: _buildGheraCentralTabEngine()),
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
              children: ["DEFAULT_METRICS", "AI_CHAT", "GOD_MODE", "CREDENTIALS", "BILLING_PORTAL", "AI_DEMAND"].map((tabNode) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(tabNode, style: const TextStyle(fontSize: 10, color: Colors.white)),
                    selected: currentActiveWindow == tabNode,
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.transparent,
                    onSelected: (state) {
                      setState(() {
                        currentActiveWindow = state ? tabNode : "DEFAULT_METRICS";
                      });
                    },
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
      case "AI_CHAT": 
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatLogs.length,
                itemBuilder: (context, idx) => Text(chatLogs[idx], style: const TextStyle(color: Colors.greenAccent, fontSize: 12)),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _chatInputController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(hintText: "Give Command in Hindi..."),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.cyanAccent),
                  onPressed: () async {
                    String cmd = _chatInputController.text;
                    if (cmd.isNotEmpty) {
                      setState(() { chatLogs.add("Master: $cmd"); });
                      _chatInputController.clear();
                      String res = await AICommandEngine.processOwnerHindiCommand(textCommand: cmd);
                      setState(() { chatLogs.add("AI CEO: $res"); });
                    }
                  },
                )
              ],
            )
          ],
        );
      case "GOD_MODE": 
        return const Center(child: Text("🏗️ AI God-Mode Feature Installer Runtime Engine Active", style: TextStyle(color: Colors.cyanAccent)));
      case "CREDENTIALS": 
        return _buildMultiDevicePanel();
      case "BILLING_PORTAL": 
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _webViewController.loadRequest(Uri.parse("https://bland.ai")), 
                  child: const Text("Bland.ai", style: TextStyle(fontSize: 11)),
                ),
                ElevatedButton(
                  onPressed: () => _webViewController.loadRequest(Uri.parse("https://openai.com")), 
                  child: const Text("OpenAI", style: TextStyle(fontSize: 11)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: WebViewWidget(controller: _webViewController),
              ),
            ),
          ],
        );
      case "AI_DEMAND": 
        return const Center(child: Text("🔔 Requirement Gathering Terminal: Status Verified ✅", style: TextStyle(color: Colors.redAccent)));
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _originalMetricsCard("Total Revenue", "10Cr+ Approved"),
            _originalMetricsCard("AI Systems Active", "2000+ Active"),
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
        const Text("👑 ACTIVE DEVICES PANEL", style: TextStyle(color: Colors.greenAccent, fontSize: 11, fontWeight: FontWeight.bold)),
        Expanded(
          child: ListView.builder(
            itemCount: MultiDeviceManager.activeSystemDevices.length,
            itemBuilder: (context, idx) {
              final dev = MultiDeviceManager.activeSystemDevices[idx];
              return ListTile(
                title: Text(dev.deviceName, style: const TextStyle(color: Colors.white, fontSize: 12)),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () async {
                    await MultiDeviceManager.wipeTargetDeviceMemory(targetId: dev.deviceId);
                    setState(() => MultiDeviceManager.activeSystemDevices.removeAt(idx));
                  },
                  child: const Text("Wipe", style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
