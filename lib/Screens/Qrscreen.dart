import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Qrscreen extends StatefulWidget {
  const Qrscreen({super.key});

  @override
  State<Qrscreen> createState() => _QrscreenState();
}

class _QrscreenState extends State<Qrscreen> {
  List<String> scannedCodes = [];

  void _onDetect(BarcodeCapture capture) {
    final String? code = capture.barcodes.first.rawValue;
    if (code != null && !scannedCodes.contains(code)) {
      setState(() {
        scannedCodes.add(code); // Add the scanned code to the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3, // Adjusted height
            width: double.infinity,
            color: Colors.amber,
            child: MobileScanner(
              onDetect: _onDetect, // Call _onDetect with BarcodeCapture
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              // color: Colors.blue,
              child: ListView.builder(
                itemCount: scannedCodes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(scannedCodes[index],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    
                    leading: Icon(Icons.qr_code,color: Colors.black,),
                     // Display scanned result
                     trailing: Text("exist"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
