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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xff060C14),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 8),
              _buildTopGrid(),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildTree(),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      flex: 5,
                      child: _buildCenter(),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      flex: 3,
                      child: _buildAI(),
                    ),
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
        borderRadius:
            BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xff00E5FF)
              .withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.between,
        children: [
          const Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                'ULTIMATE MASTER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
              Text(
                'SUPER ADMIN CONTROL',
                style: TextStyle(
                  color: Color(0xff00E5FF),
                  fontSize: 8,
                ),
              ),
            ],
          ),
          Icon(
            Icons.account_circle,
            color: const Color(0xff00E5FF),
            size: 16,
          ),
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
      physics:
          const NeverScrollableScrollPhysics(),
      children: [
        _buildBox('REV SUMMARY', '10Cr+'),
        _buildBox('TOTAL MODS', '2000 LIVE'),
      ],
    );
  }

  Widget _buildBox(String t, String v) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xff0E1624),
        borderRadius:
            BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Text(t,
              style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 8)),
          Text(v,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight:
                      FontWeight.bold)),
        ],
      ),
    );
  }
  Widget _buildTree() {
    final List<Map<String, dynamic>> cats = [
      {'name': '01 • Sales', 'start': 1, 'end': 5},
      {'name': '02 • Marketing', 'start': 6, 'end': 20},
      {'name': '03 • Operations', 'start': 21, 'end': 50},
      {'name': '04 • Finance', 'start': 51, 'end': 100},
      {'name': '05 • Products', 'start': 101, 'end': 150},
      {'name': '10 • Core Eng', 'start': 151, 'end': 2000},
    ];

    return Container(
      decoration: _paneBox(const Color(0xff00E5FF)),
      child: ListView(
        children: cats.map((cat) {
          int s = cat['start'];
          int e = cat['end'];
          int count = (e - s + 1).clamp(0, 10);
          return ExpansionTile(
            dense: true,
            title: Text(cat['name'],
                style: const TextStyle(
                    color: Colors.white70, fontSize: 8)),
            children: List.generate(count, (index) {
              int id = s + index;
              return ListTile(
                dense: true,
                title: Text('F#$id Console',
                    style: const TextStyle(
                        color: Colors.white30, fontSize: 7)),
                onTap: () {
                  setState(() {
                    currentFeature =
                        FeatureEngine.getById(id);
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
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text('CATEGORY: ${currentFeature.category}',
              style: const TextStyle(
                  color: Colors.white30, fontSize: 7)),
          Text(currentFeature.name,
              style: const TextStyle(
                  color: Color(0xff00E5FF),
                  fontSize: 11,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(currentFeature.metricLabel,
              style: const TextStyle(
                  color: Colors.white54, fontSize: 8)),
          Text(currentFeature.primaryMetric,
              style: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: currentFeature.actions.map((act) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff141E30),
                  padding: const EdgeInsets.all(4),
                ),
                onPressed: () {},
                child: Text(act,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 7)),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
  Widget _buildAI() {
    return Container(
      decoration: _paneBox(
        const Color(0xff00E5FF),
      ),
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'AI CONSOLE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              'Analyzing telemetry node for ${currentFeature.name}...',
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 7,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavbar() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      decoration: const BoxDecoration(
        color: Color(0xff0E1624),
      ),
      child: const Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(Icons.home,
              color: Color(0xff00E5FF),
              size: 16),
        ],
      ),
    );
  }

  BoxDecoration _paneBox(Color clr) {
    return BoxDecoration(
      color: const Color(0xff0E1624),
      borderRadius:
          BorderRadius.circular(6),
      border: Border.all(
        color: clr.withOpacity(0.15),
      ),
    );
  }
}
