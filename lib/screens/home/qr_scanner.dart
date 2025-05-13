import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/services/database.dart';
import 'package:flutter_finalprojects/services/authentication_service.dart';
import 'package:flutter_finalprojects/screens/home/home_screen.dart';
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
    facing: CameraFacing.back,

    
  );

  Future<bool> verifyQrCode(String data) async {
    String signature_2 = "PlastiCash-2025-OLJD";
    final decoded = jsonDecode(data);
    final datamap = decoded['data'];
    final signature = decoded['signature'];

    final dataString = jsonEncode(datamap);
    final hmac = Hmac(sha256, utf8.encode(signature_2));

    final digest = hmac.convert(utf8.encode(dataString)).toString();

    if(signature == digest) {

      return true;
    }
    else{
      return false;
    }
    
  }

   void _handleBarcode(BarcodeCapture capture) async{
    final String action = "ScanQr";
    for (final barcode in capture.barcodes) {
      final String? value = barcode.rawValue;
      try{
          if (value != null && mounted) {

            if( await verifyQrCode(value)){
            final decoded = jsonDecode(value);
            final datamap = decoded['data'];
            // Stop the scanner to prevent multiple detections

              if(mounted){// Show a dialog with the scanned result
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    contentTextStyle: TextStyle(color:primaryColor),
                    contentPadding: EdgeInsets.only(top: 90.h),
                    backgroundColor:Colors.white,
                    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    content: Container(
                      height: 300.h,
                      width: 250.w,
                      child: Column(
                        spacing: 30.h,
                        children: [
                          CircularProgressIndicator( color: primaryColor,),
                          Text("Recieving Rewards"),
                        ],
                      )),
                      ),
                    );  
                }

              try {
                await DatabaseService(user: AuthenticationService.currentUser).uploadData(datamap['bottles'], datamap['points'], action, datamap["date"], null, null, null);
                await DatabaseService().updateStatusQr(value);
                controller.stop();
              } catch (e) {
                print("ERROr $e");
              } finally{
                if(mounted){
                  Navigator.of(context).pop();
                  showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    contentTextStyle: TextStyle(color: primaryColor, fontSize: 40.sp),
                    titleTextStyle: TextStyle(color: primaryColor, fontSize: 60.sp, fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.only(top: 90.h),
                    backgroundColor:Colors.white ,
                    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    title: Center( child : Text("Awesome job!")),
                    content: Container(
                      height: 300.h,
                      width: 250.w,
                      child: Column(
                        spacing: 30.h,
                        children: [
                          Text("You have earned ${datamap['points']} Points and recyled ${datamap['bottles']} Bottles", textAlign: TextAlign.center,),
                          Text("Keep up the great work!", textAlign: TextAlign.center,)
                        ],
                      )),
                      actions: [
                        TextButton(onPressed: (){
                            Navigator.of(context).pop();
                            controller.start();
                  
                        }, 
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryColor)),
                        child: Text("Confirm", style: TextStyle(color: Colors.white)))
                      ],
                  ),
                  
                );   
              }
            }
          break;  // Handle only the first barcode
          
        }
      }
      } catch(jsonError){
        break;
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
