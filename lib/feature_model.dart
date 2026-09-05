class FeatureDetail {
  final String id;
  final String name;
  final String category;
  final String primaryMetric;
  final String metricLabel;
  final String status;
  final List<String> actions;

  const FeatureDetail({
    required this.id,
    required this.name,
    required this.category,
    required this.primaryMetric,
    required this.metricLabel,
    required this.status,
    required this.actions,
  });
}

class FeatureEngine {
  static FeatureDetail getById(int id) {
    if (id == 1) {
      return const FeatureDetail(
        id: "01",
        name: "AI CEO Center",
        category: "Sales",
        primaryMetric: "₹33.42 L",
        metricLabel: "Net Profit",
        status: "Autopilot",
        actions: ["View", "SOS"],
      );
    }
    if (id == 2) {
      return const FeatureDetail(
        id: "02",
        name: "AI Analytics",
        category: "Sales",
        primaryMetric: "94.2%",
        metricLabel: "Forecast",
        status: "Synced",
        actions: ["P&L", "Export"],
      );
    }
    if (id == 3) {
      return const FeatureDetail(
        id: "03",
        name: "AI Pipeline",
        category: "Sales",
        primaryMetric: "1,420 Leads",
        metricLabel: "Pipeline",
        status: "98.7%",
        actions: ["Graph", "Dist"],
      );
    }
    return FeatureDetail(
      id: id.toString(),
      name: "Module $id",
      category: "Engineering",
      primaryMetric: "OK",
      metricLabel: "Status $id",
      status: "Stable",
      actions: ["Test $id"],
    );
  }
}
