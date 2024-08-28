import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class AdsManager{
  static Future<void> loadUnityAD() async{
    await UnityAds.load(
      placementId: 'Interstitial_Android',
      onComplete: (placementId) => print('Load Complete $placementId'),
      onFailed: (placementId, error, message) => print('Load Failed $placementId: $error $message'),
    );
  }

  static Future<void> showIntAd() async{
    UnityAds.showVideoAd(
      placementId: 'Interstitial_Android',
      onStart: (placementId) => print('Video Ad $placementId started'),
      onClick: (placementId) => print('Video Ad $placementId click'),
      onSkipped: (placementId) => print('Video Ad $placementId skipped'),
      onComplete: (placementId) async{
        await loadUnityAD();
      },
      onFailed: (placementId, error, message) async{
        await loadUnityAD();
      },
    );
  }
}