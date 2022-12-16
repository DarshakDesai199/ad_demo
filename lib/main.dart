import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'home.dart';

/// configuration required
///
/// Add in AndroidManifest :
///
///  <meta-data
///                    android:name="com.google.android.gms.ads.APPLICATION_ID"
///                    android:value="ca-app-pub-3940256099942544~3347511713" />
///
///
///permission :
///<uses-permission android:name="android.permission.INTERNET"/>
///
/// package : google_mobile_ads: ^2.3.0

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

const int maxFailedLoadAttempts = 3;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
