import 'package:flutter/material.dart';
import 'package:gravity_engine_flutter_sdk/GravityEngineSDK.dart';
void main() {
  runApp(const MyApp());
}


class MyCallBack extends InitializeCallback {
  @override
  void onSuccess(Map<Object?, Object?>? responseJson) {
    // 成功回调的处理
    print("Initialization succeeded with response: $responseJson");
  }

  @override
  void onFailed(String? errorMsg) {
    // 失败回调的处理
    print("Initialization failed with error: $errorMsg");
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TestPage());
  }
}

class TestPage extends StatelessWidget {
  // 定义不同按钮的事件处理函数
  void _startGravityEngine() {
    print('startGravityEngine');
    GravityEngineSDK.startGravityEngine(
      "C7GkLEgnRqiMnpvguAsoYemxkKoea3wt",
      SDKRunMode.DEBUG
    );
  }

  void _enableAutoTrack() {
    print('enableAutoTrack');
    GravityEngineSDK.enableAutoTrack(
      [AUTO_TRACK_EVENTS.APP_START, AUTO_TRACK_EVENTS.APP_END,AUTO_TRACK_EVENTS.APP_SCENE_VIEW,AUTO_TRACK_EVENTS.APP_SCENE_CLICK],
      {"test": "q111"},
    );
  }

  void _initializeIOS() {
    print('initializeIOS');
    GravityEngineSDK.initializeIOS(
      true,
      "",
      "",
      "",
      false,
      "appstore",
      MyCallBack(),
    );
  }

  void _trackPayEvent() {
    print('trackPayEvent');
    GravityEngineSDK.trackPayEvent(
      300,
      "CNY",
      DateTime.now().millisecondsSinceEpoch.toString(),
      "月卡",
      "支付宝",
    );
  }

  void _trackAdShowEvent() {
    print('trackAdShowEvent');
    GravityEngineSDK.trackAdShowEvent(
      "topon",
      "placement_id",
      "ad_source_id",
      "reward",
      "csj",
      1.0,
    );
  }


  void _flush() {
    print('flush');
    GravityEngineSDK.flush();
  }


  void _setAutoTrackProperties() {
    print('setAutoTrackProperties');
    GravityEngineSDK.setAutoTrackProperties([AUTO_TRACK_EVENTS.APP_INSTALL,AUTO_TRACK_EVENTS.APP_END], {"key1":2});
  }


  void _setSuperProperties() {
    print('setSuperProperties');
    GravityEngineSDK.setSuperProperties({"age":2,"channel":"xiaomi"});
  }


  void _unsetSuperProperty() {
    print('unsetSuperProperty');
    GravityEngineSDK.unsetSuperProperty("SUPER_PROPERTY_CHANNEL");
  }

  void _clearSuperProperties() {
    print('clearSuperProperties');
    GravityEngineSDK.clearSuperProperties();
  }


  void _userSet() {
    print('userSet');
    GravityEngineSDK.userSet({"\$name":"turboUserName","\$gender":"男"});
  }


  void _userUnset() {
    print('userUnset');
    GravityEngineSDK.userUnset(["\$age"]);
  }


  void _userSetOnce() {
    print('userSetOnce');
    GravityEngineSDK.userSetOnce({"\$gender":"male"});
  }


  void _userAdd() {
    print('userAdd');
    GravityEngineSDK.userAdd({"\$age":27});
  }


  void _userNumberMin() {
    print('userNumberMin');
    GravityEngineSDK.userNumberMin({"ad_ecpm_min":100});
  }


  void _userNumberMax() {
    print('userNumberMax');
    GravityEngineSDK.userNumberMax({"ad_ecpm_max":300});
  }

  void _userAppend() {
    print('userAppend');
    GravityEngineSDK.userAppend({"Movies":["Interstellar","The Negro Motorist Green Book"]});
  }


  void _userUniqAppend() {
    print('userUniqAppend');
    GravityEngineSDK.userUniqAppend({"Movies":["Interstellar","The Negro Motorist Green Book"]});
  }

  void _userDelete() {
    print('userDelete');
    GravityEngineSDK.userDelete();
  }

  Future<void> _getSdkInfo() async {
    // 这里要加 async，因为我们要用 await
    String? version = await GravityEngineSDK.getPlatformVersion();
    print("getPlatformVersion:$version");

    Map<Object?, Object?>? getSuperProperties = await GravityEngineSDK.getSuperProperties();
    print('getSuperProperties:$getSuperProperties');
    
    Map<Object?, Object?>? getCurrentPresetProperties = await GravityEngineSDK.getCurrentPresetProperties();
    print('getCurrentPresetProperties:$getCurrentPresetProperties');

    String? getDeviceId = await GravityEngineSDK.getDeviceId();
    print('getDeviceId:$getDeviceId');
    
    String? getCurrentClientID = await GravityEngineSDK.getCurrentClientID();
    print('getCurrentClientID:$getCurrentClientID');
    
  }

  @override
  Widget build(BuildContext context) {
  final List<Map<String, dynamic>> buttons = [
      {'title': 'startGravityEngine', 'onPressed': _startGravityEngine},
      {'title': 'enableAutoTrack', 'onPressed': _enableAutoTrack},
      {'title': 'initializeIOS', 'onPressed': _initializeIOS},
      {'title': 'trackPayEvent', 'onPressed': _trackPayEvent},
      {'title': 'trackAdShowEvent', 'onPressed': _trackAdShowEvent},
      {'title': 'flush', 'onPressed': _flush},
      {'title': 'setAutoTrackProperties', 'onPressed': _setAutoTrackProperties},
      {'title': 'setSuperProperties', 'onPressed': _setSuperProperties},
      {'title': 'unsetSuperProperty', 'onPressed': _unsetSuperProperty},
      {'title': 'clearSuperProperties', 'onPressed': _clearSuperProperties},
      {'title': 'userSet', 'onPressed': _userSet},
      {'title': 'userUnset', 'onPressed': _userUnset},
      {'title': 'userSetOnce', 'onPressed': _userSetOnce},
      {'title': 'userAdd', 'onPressed': _userAdd},
      {'title': 'userNumberMin', 'onPressed': _userNumberMin},
      {'title': 'userNumberMax', 'onPressed': _userNumberMax},
      {'title': 'userAppend', 'onPressed': _userAppend},
      {'title': 'userUniqAppend', 'onPressed': _userUniqAppend},
      {'title': 'userDelete', 'onPressed': _userDelete},
      {'title': 'getSdkInfo', 'onPressed': _getSdkInfo},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Test Page')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          final item = buttons[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: item['onPressed'],
              child: Text(item['title']),
            ),
          );
        },
      ),
    );
  }
}
