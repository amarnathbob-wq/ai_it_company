import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      title: 'Vikash Technical Hub',
      theme: ThemeData.dark(), // प्रीमियम डार्क मोड थीम
      home: const OwnerMasterDashboard(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class OwnerMasterDashboard extends StatefulWidget {
  const OwnerMasterDashboard({super.key});

  @override
  State<OwnerMasterDashboard> createState() => _OwnerMasterDashboardState();
}

class _OwnerMasterDashboardState extends State<OwnerMasterDashboard> {
  // 🎛️ मास्टर ओवरराइड स्टेट (बटन डिफ़ॉल्ट रूप से OFF है, यानी स्टाफ एक्टिव है)
  bool isAiOverrideActive = false;

  // 📡 मेक.कॉम (Make.com) वेबहुक को रियल-टाइम सिग्नल भेजने का फंक्शन
  Future<void> triggerMakeAutomation(bool stateValue) async {
    final String webhookUrl = 'https://make.com';
    try {
      final response = await http.post(
        Uri.parse(webhookUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "company_name": "Vikash Technical Hub",
          "system_override_state": stateValue ? "ACTIVE" : "DEACTIVATED",
          "timestamp": DateTime.now().toIso8601String(),
        }),
      );
      if (response.statusCode == 200) {
        print("Signal Sync Complete.");
      }
    } catch (e) {
      print("Network routing bypass active: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('🏛️ Vikash Technical Hub Control'),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              key: const Key('main_layout_scroller'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🚨 मास्टर ऑन/ऑफ बटन का कंट्रोल बॉक्स
                  Card(
                    color: isAiOverrideActive ? Colors.red.withOpacity(0.2) : Colors.green.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'SOVEREIGN OVERRIDE',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                isAiOverrideActive 
                                    ? '0 Employees: AI Controlling Agency' 
                                    : 'Human Staff Mode Active (Callers/Devs)',
                                style: const TextStyle(fontSize: 12, color: Colors.white70),
                              ),
                            ],
                          ),
                          Switch(
                            value: isAiOverrideActive,
                            activeColor: Colors.red,
                            onChanged: (value) {
                              setState(() {
                                isAiOverrideActive = value;
                              });
                              triggerMakeAutomation(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 📊 रियल-टाइम एआई लाइव मैट्रिक्स ग्रिड
                  const Text('📊 LIVE SYSTEM MONITOR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.5,
                    children: [
                      _buildMetricCard('AI VoIP Calls', isAiOverrideActive ? '42 Active' : '0 (Human Active)'),
                      _buildMetricCard('Passive MRR', '\$2,450 /mo'),
                      _buildMetricCard('Scraper Threads', '12 Running'),
                      _buildMetricCard('FEMA Compliance', '100% Cleared'),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // 📋 1 से 2000 फीचर्स की लाइव स्क्रोल लिस्ट लेज़र
                  const Text('📋 GLOBAL MODULE REGISTER (1 - 2000)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2000,
                    itemBuilder: (context, index) {
                      int featureNum = index + 1;
                      String name = 'System Matrix Switch #$featureNum';
                      String desc = 'Autonomous system asset worker endpoint router verification key.';
                      
                      // मुख्य 401-414 फीचर्स का डेटा इन्जेक्शन
                      if (featureNum == 401) { name = "एआई स्मार्ट मार्केटिंग और लीड जनरेटर"; desc = "इंस्टाग्राम/गूगल मैप्स से खुद खराब वेबसाइट ढूंढकर प्रपोज़ल भेजने वाला Outreach इंजन।"; }
                      if (featureNum == 402) { name = "ऑटो-इनवॉइस और लीगल एग्रीमेंट जनरेटर"; desc = "डील फाइनल होते ही ग्राहक के लिए बिल और कॉन्ट्रैक्ट बनाकर भेजने वाला रोबोट।"; }
                      if (featureNum == 403) { name = "क्लाइंट फीडबैक और रेटिंग स्टोर"; desc = "काम पूरा होने पर ग्राहक से खुद 5-स्टार रिव्यू मांगकर उसका सुंदर पोस्टर बनाने वाला वॉल्ट।"; }
                      if (featureNum == 404) { name = "क्लाइंट री-मार्केटिंग और ऑटो-अपसेल इंजन"; desc = "पुराने ग्राहकों को हर महीने \$50 की एसईओ (SEO) सर्विस खुद बेचने वाला पैसिव इनकम रोबोट।"; }
                      if (featureNum == 405) { name = "क्लाइंट री-एंगेजमेंट और फेस्टिवल डिस्काउंट इंजन"; desc = "क्रिसमस, ईद या ब्लैक फ्राइडे पर खुद ब खुद विदेशी ग्राहकों को ऑफर्स भेजने वाला कैलेंडर।"; }
                      if (featureNum == 406) { name = "AI CA (आर्टिफिशियल इंटेलिजेंस चार्टर्ड अकाउंटेंट)"; desc = "ऑटो-बहीखाता, बिल स्कैनिंग, और खर्चों के बिलों का फोटो खींचते ही उसे एक्सेल शीट में डालना।"; }
                      if (featureNum == 407) { name = "AI लीगल एडवाइज़र और एग्रीमेंट चेकर"; desc = "इंटरनेशनल कॉन्ट्रैक्ट्स को स्कैन करके आसान हिंदी में कमियां और रिस्क बताने वाला वकील।"; }
                      if (featureNum == 408) { name = "कॉम्पिटिटर जासूस रोबोट"; desc = "विरोधी एजेंसियों के दामों, ऑफर्स और उनके लाइव विज्ञापनों पर चौबीसों घंटे जासूसी करना।"; }
                      if (featureNum == 409) { name = "फ्रेंचाइजी और व्हाइट-लेबल पार्टनर मोड"; desc = "दूसरे शहरों के पार्टनर्स को जोड़कर उनकी कमाई से 30% रॉयल्टी खुद काटने का हब।"; }
                      if (featureNum == 410) { name = "मल्टी-लिंग्वल ओनर ट्रांसलेटर"; desc = "आपकी हिंदी आवाज़ को इंग्लिश/अरबी में और विदेशी ग्राहक के जवाब को हिंदी टेक्स्ट में बदलना।"; }
                      if (featureNum == 411) { name = "एआई पार्टनरशिप और जॉइंट वेंचर डेस्क"; desc = "विदेशी मार्केटिंग एजेंसियों को खुद पार्टनरशिप का मेल भेजकर थोक में ऑर्डर्स लाना।"; }
                      if (featureNum == 412) { name = "ऑटो-क्रेडिट और बैड-डेट रिकवरी रोबोट"; desc = "लेट पेमेंट वाले ग्राहकों के पीछे पड़कर सख्त रिमाइंडर्स से पैसे वसूलने वाला रिकवरी एजेंट।"; }
                      if (featureNum == 413) { name = "ऑटो-जीएसटी (GST) ३बी और १ रिटर्न मेकर"; desc = "हर महीने भारत सरकार को भरे जाने वाले जीएसटी रिटर्न (Export of Services - 0% GST) की फाइल बनाना।"; }
                      if (featureNum == 414) { name = "फॉरेन एक्सचेंज मैनेजमेंट एक्ट (FEMA) रडार"; desc = "विदेशों से भारत में डॉलर मंगाते समय सरकार के सभी फेमा कानूनों का 100% पालन सुनिश्चित करना।"; }
                      if (featureNum == 451) { name = "Unified Staff Chat Matrix Box"; desc = "एम्प्लॉई ऐप का चैट बॉक्स जिससे स्टाफ छुट्टी मांग सकता है या काम की रिपोर्टिंग कर सकता है।"; }

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text('$featureNum', style: const TextStyle(fontSize: 10, color: Colors.cyan)),
                        ),
                        title: Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        subtitle: Text(desc, style: const TextStyle(fontSize: 12, color: Colors.white54)),
                        trailing: Icon(
                          isAiOverrideActive ? Icons.bolt : Icons.toggle_off,
                          color: isAiOverrideActive ? Colors.amber : Colors.grey,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

        // 🛡️ सुरक्षा कवच: अदृश्य डायनेमिक वॉटरमार्क (0.05 Opacity पर कंपनी का नाम)
        IgnorePointer(
          child: Container(
            color: Colors.transparent,
            child: GridView.builder(
              itemCount: 100,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                                return Opacity(
                  opacity: 0.05,
                  child: Center(
                    child: Transform.rotate(
                      angle: -0.4,
                      child: const Text(
                        'VIKASH_TECHNICAL_HUB_SECURE_NODE',
                        style: TextStyle(fontSize: 8, color: Colors.white, decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: Colors.black45, BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 11, color: Colors.white54)),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.cyan)),
        ],
      ),
    );
  }
}
