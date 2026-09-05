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
    return Container(
      decoration: _paneBox(
        const Color(0xff00E5FF),
      ),
      child: ListView(
        children: List.generate(5, (i) {
          int id = i + 1;
          return ListTile(
            dense: true,
            title: Text(
              'F#$id Dashboard',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 9,
              ),
            ),
            onTap: () {
              setState(() {
                currentFeature =
                    FeatureEngine.getById(
                        id);
              });
            },
          );
        }),
      ),
    );
  }

  Widget _buildCenter() {
    return Container(
      decoration: _paneBox(
        const Color(0xff00E5FF),
      ),
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            'MODULE: #${currentFeature.id}',
            style: const TextStyle(
              color: Colors.white30,
              fontSize: 8,
            ),
          ),
          Text(
            currentFeature.name,
            style: const TextStyle(
              color: Color(0xff00E5FF),
              fontSize: 12,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            currentFeature.primaryMetric,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 14,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
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
      child: const Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            'AI CONSOLE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight:
                  FontWeight.bold,
                ),
              ),
          SizedBox(height: 4),
          Text(
            'Operational Mode',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 8,
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
