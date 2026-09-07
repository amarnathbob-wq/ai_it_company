class LedgerTransactionModel {
  final String toolName;
  final double costIncurred;
  final String timestamp;
  LedgerTransactionModel({required this.toolName, required this.costIncurred, required this.timestamp});
}

class FinancialLedgerEngine {
  static List<LedgerTransactionModel> liveExpensesLedger = [
    LedgerTransactionModel(toolName: "Bland.ai Outbound Call (Kuwait Deal)", costIncurred: 0.45, timestamp: "Just Now"),
    LedgerTransactionModel(toolName: "OpenAI GPT-4o API Form Parser Run", costIncurred: 0.12, timestamp: "2 Mins ago"),
  ];

  static double calculateNetProfitMargin(double rawRevenue, double totalToolsCost) {
    return rawRevenue - totalToolsCost;
  }
}
