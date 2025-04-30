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
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back
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
        scanWindow: Rect.fromCenter(center:  Offset(MediaQuery.of(context).size.width / 2, MediaQuery.of(context).size.height / 2)
        , 
        width: 800.w, 
        height: 800.h),
        overlayBuilder: (context, constraints){
          return Center(
          child: Container(
            width: 800.w,
            height: 800.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
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
