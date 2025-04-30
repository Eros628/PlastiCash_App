import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,

    
  );

  void _handleBarcode(BarcodeCapture capture) {
    for (final barcode in capture.barcodes) {
      final String? value = barcode.rawValue;

      if (value != null && mounted) {
        debugPrint('Scanned value: $value');

        // Stop the scanner to prevent multiple detections
        controller.stop();

        // Show a dialog with the scanned result
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor:Color.fromARGB(255, 27, 75, 61) ,
            title: const Text('QR Code Found'),
            content: Text(value),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  controller.start(); // Restart scanner after closing dialog
                },
                child: const Text('Scan Again'),
              ),
            ],
          ),
        );

        break; // Handle only the first barcode
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        
        scanWindow: Rect.fromCenter(center:  Offset(MediaQuery.of(context).size.width / 2, MediaQuery.of(context).size.height / 2), 
        width: 800.w, 
        height: 800.h),
        overlayBuilder: (context, constraints){
          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 200.h),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 27, 75, 61),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(2, 4)
                      )
                    ]
                  ),
                  child: Text("Scan Machine QR Code\n to Claim Reward", style: TextStyle(fontSize: 40.sp),textAlign: TextAlign.center,),
                ),
              ),
              Center(
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 800.w,
                      height: 800.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Text("Align the QR code within the frame to scan",style: TextStyle(fontSize: 35.sp),)
                ],
              ),
              ),
              
            ],
          );
        },
        controller: controller,
        onDetect: _handleBarcode,
        errorBuilder: (context, error, _) {
          return Center(
            child: Text(
              'Camera error: $error',
              style: const TextStyle(color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
