import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'mobile_ads/constant.dart';

class FluidAd extends StatefulWidget {
  const FluidAd({Key? key}) : super(key: key);

  @override
  State<FluidAd> createState() => _FluidAdState();
}

class _FluidAdState extends State<FluidAd> {
  FluidAdManagerBannerAd? _fluidAd;
  double _width = 200.0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Create the ad objects and load ads.
    _fluidAd = FluidAdManagerBannerAd(
      adUnitId: '/6499/example/APIDemo/Fluid',
      request: const AdManagerAdRequest(nonPersonalizedAds: true),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (Ad ad) {
          log('$_fluidAd loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          log('$_fluidAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => log('$_fluidAd onAdOpened.'),
        onAdClosed: (Ad ad) => log('$_fluidAd onAdClosed.'),
      ),
    )..load();
  }

  @override
  void dispose() {
    super.dispose();
    _fluidAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fluid example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 40,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              if (index == 1) {
                return Align(
                  alignment: Alignment.center,
                  child: FluidAdWidget(
                    width: _width,
                    ad: _fluidAd!,
                  ),
                );
              } else if (index == 2) {
                return ElevatedButton(
                  onPressed: () {
                    double newWidth;
                    if (_width == 200.0) {
                      newWidth = 100.0;
                    } else if (_width == 100.0) {
                      newWidth = 150.0;
                    } else {
                      newWidth = 200.0;
                    }
                    setState(() {
                      _width = newWidth;
                    });
                  },
                  child: const Text('Change size'),
                );
              }
              return const Text(
                Constants.placeholderText,
                style: TextStyle(fontSize: 15),
              );
            },
          ),
        ),
      ),
    );
  }
}
