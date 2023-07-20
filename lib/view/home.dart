import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:whatsapp_status_saver/utill/colors.dart';

import 'package:whatsapp_status_saver/view/pictures.dart';
import 'package:whatsapp_status_saver/view/videos.dart';

import '../utill/path_services.dart';
import '../utill/permission.dart';
import 'ad_helper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final String _title = "Status Saver";
  RewardedAd? rewardedAd;

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                ad.dispose();
                rewardedAd = null;
              });
              _loadRewardedAd();
            },
          );

          setState(() {
            rewardedAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final inst = PathServices.instance;
    Perms.getPerms().then(
      (value) => value ? inst.fetchFiles(context) : print("Not granted"),
    );
    Future.delayed(Duration(seconds: 5), () {
      if (rewardedAd != null) {
        rewardedAd!.show(
          onUserEarnedReward: (ad, rewardItem) {
          },
        );
      }
    });
  }

  final _tabbar = [
    Tab(
      text: "Images",
    ),
    Tab(
      text: "Videos",
    ),
  ];

  final _tabs = <Widget>[Pictures(), Videos()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            DropdownButton<String>(
              items: [],
              onChanged: (String? value) {},
            ),
          ],
          backgroundColor: AppColors.appColor,
          title: Text(_title),
          centerTitle: false,
          bottom: TabBar(
            indicatorColor: AppColors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: _tabbar,
          ),
        ),
        body: TabBarView(children: _tabs),
      ),
    );
  }
}
