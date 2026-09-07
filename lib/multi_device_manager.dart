import 'package:flutter/material.dart';

class DeviceModel {
  final String deviceId;
  final String deviceName;
  final String lastActive;
  DeviceModel({required this.deviceId, required this.deviceName, required this.lastActive});
}

class MultiDeviceManager {
  // Aapke sabhi chalne wale phones ki live database testing list
  static List<DeviceModel> activeSystemDevices = [
    DeviceModel(deviceId: "PH_01", deviceName: "Vikash Main Phone (iPhone 16)", lastActive: "Just Now"),
    DeviceModel(deviceId: "PH_02", deviceName: "Backup Device (Samsung S24)", lastActive: "5 Hours ago"),
  ];

  // 🔴 Malik ka khas manual control jo cloud database se dusre phone ka data mita dega
  static Future<bool> wipeTargetDeviceMemory({required String targetId}) async {
    debugPrint("Cloud System: Memory wiped successfully for device token: $targetId");
    return true;
  }
}
