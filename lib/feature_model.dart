import 'package:flutter/material.dart';

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
        name: "AI CEO Command Center",
        category: "01 • Sales & Revenue",
        primaryMetric: "₹33.42 Lakhs",
        metricLabel: "Net Profit Status",
        status: "Autopilot ON",
        actions: ["Global View", "SOS System", "Sync Branches"],
      );
    }
    if (id == 2) {
      return const FeatureDetail(
        id: "02",
        name: "AI Business Analytics",
        category: "01 • Sales & Revenue",
        primaryMetric: "94.2% Accuracy",
        metricLabel: "Forecast Matrix",
        status: "Synchronized",
        actions: ["P&L Graph", "Export CSV", "Growth Engine"],
      );
    }
    if (id == 3) {
      return const FeatureDetail(
        id: "03",
        name: "AI Sales Pipeline",
        category: "01 • Sales & Revenue",
        primaryMetric: "1,420 Active Leads",
        metricLabel: "Pipeline Tracking",
        status: "98.7% Health",
        actions: ["Funnel View", "Distribute", "Update Deal"],
      );
    }
    if (id == 4) {
      return const FeatureDetail(
        id: "04",
        name: "Auto Lead Capture",
        category: "01 • Sales & Revenue",
        primaryMetric: "48 Leads/hr",
        metricLabel: "Ingestion Rate",
        status: "Listening",
        actions: ["Test Webhook", "Review Logs", "Funnel Connect"],
      );
    }
    if (id == 5) {
      return const FeatureDetail(
        id: "05",
        name: "AI Lead Scoring",
        category: "01 • Sales & Revenue",
        primaryMetric: "82% Hot Leads",
        metricLabel: "Conversion Probability",
        status: "Model Stable",
        actions: ["Train AI Model", "Adjust Ranks", "View History"],
      );
    }
    if (id == 6) {
      return const FeatureDetail(
        id: "06",
        name: "Smart Follow-up Engine",
        category: "02 • Marketing & Campaigns",
        primaryMetric: "89% Open Rate",
        metricLabel: "Auto WhatsApp/Email Broadcast",
        status: "Active Queues",
        actions: ["Edit Template", "View Reports", "Stop Campaign"],
      );
    }
    if (id == 13) {
      return const FeatureDetail(
        id: "13",
        name: "WhatsApp Automation",
        category: "02 • Marketing & Campaigns",
        primaryMetric: "2.4K Msgs/min",
        metricLabel: "Auto Reply Engine",
        status: "Webhook Active",
        actions: ["Chat Control", "Broadcast", "Bot Settings"],
      );
    }
    if (id == 14) {
      return const FeatureDetail(
        id: "14",
        name: "Instagram DM Automation",
        category: "02 • Marketing & Campaigns",
        primaryMetric: "420 Replies/hr",
        metricLabel: "Insta DM Auto Jawab",
        status: "API Connected",
        actions: ["Keyword Rules", "Analytics", "Live Intervene"],
      );
    }
    if (id == 15) {
      return const FeatureDetail(
        id: "15",
        name: "AI Content Generator",
        category: "02 • Marketing & Campaigns",
        primaryMetric: "15 Posts Ready",
        metricLabel: "Post, Caption & Hashtags",
        status: "Model Loaded",
        actions: ["Write Post", "Brand Kit", "Schedule Settings"],
      );
    }
    if (id == 21) {
      return const FeatureDetail(
        id: "21",
        name: "Employee Performance Tracker",
        category: "03 • Operations & HR",
        primaryMetric: "94.8% Efficiency",
        metricLabel: "Team Work-Log Matrix",
        status: "Monitoring Active",
        actions: ["View Logs", "Assign Bonus", "Review Tasks"],
      );
    }
    if (id == 22) {
      return const FeatureDetail(
        id: "22",
        name: "AI HR & Payroll Engine",
        category: "03 • Operations & HR",
        primaryMetric: "542 Slips Ready",
        metricLabel: "Salary & Leave Operations",
        status: "Calculated",
        actions: ["Release Salary", "Leave Requests", "Tax Rules"],
      );
    }
    if (id == 46) {
      return const FeatureDetail(
        id: "46",
        name: "Data Leak Guard Pro",
        category: "03 • Operations & HR",
        primaryMetric: "0 Threats Found",
        metricLabel: "Security Vulnerability Shield",
        status: "Shield Online",
        actions: ["Scan Database", "Audit Logs", "IP Lock Controls"],
      );
    }
    if (id == 50) {
      return const FeatureDetail(
        id: "50",
        name: "Attendance with Selfie",
        category: "03 • Operations & HR",
        primaryMetric: "100% Geo-Verified",
        metricLabel: "Face & Location Punch-in",
        status: "Listening Live",
        actions: ["Live Map Tracker", "Missed Punch", "Setup Perimeter"],
      );
    }
    return FeatureDetail(
      id: id.toString().padLeft(2, '0'),
      name: "Feature Module $id",
      category: _getCat(id),
      primaryMetric: "Active Status OK",
      metricLabel: "Telemetry Sub-system $id",
      status: "Operational",
      actions: ["Run Diagnostics $id", "View Core Logs"],
    );
  }

  static String _getCat(int id) {
    if (id <= 5) return "01 • Sales & Revenue";
    if (id <= 20) return "02 • Marketing & Campaigns";
    if (id <= 50) return "03 • Operations & HR";
    if (id <= 100) return "04 • Finance & Billing";
    if (id <= 150) return "05 • Product & Branch POS";
    return "10 • Core Engineering System";
  }
}
