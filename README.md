# PlastiCash User App

PlastiCash is a smart recycling solution that rewards users for recycling plastic bottles using IoT-enabled vending machines. This mobile app allows users to monitor their recycling activity, earn points, and redeem those points as real cash through e-wallet services like GCash. It also features interactive challenges, a QR scanner to link with machines, and a map to find the nearest recycling stations.

# Features

* User Authentication
  * Sign up and log in via Firebase Authentication
* Recycling Activity Tracking
  * Automatically track bottle deposits linked to the user’s account
* Rewards & Redemption
  * Points system based on activity
  * Redeem points for real money (via GCash integration)
* QR Code Scanning
  * Scan the qr code that generated in the machine to recieve the rewards
* Challenges System
  * Weekly/monthly goals to keep users motivated
* Machine Locator
  * Displays nearby PlastiCash machines

# Technologies
* Flutter
* Firebase Authentication
* Cloud Firestore

# Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^latest
  firebase_auth: ^latest
  cloud_firestore: ^latest
  mobile_scanner: ^latest
  flutter_map: ^latest
  geolocator: ^latest
  http: ^latest
```

# How it works
1. User scans the machine’s QR code using the app.
2. The machine and app connect through Firebase and ESP32 (WiFi).
3. When bottles are inserted, the machine sends data to the cloud.
4. The app receives real-time updates and awards points accordingly.
5. Points can be redeemed once a minimum is reached.

#  Related Repositories
* Machine Interface App (controls the vending machine itself):
  * https://github.com/Eros628/machine_interface_platicash.git

This is a group project. I was responsible for:
* Full-stack development of both apps using Flutter and Firebase
* Real-time integration with Arduino via ESP32 WiFi
* UI/UX implementation and user workflow design
* Connecting the IoT hardware to the Firebase backend
