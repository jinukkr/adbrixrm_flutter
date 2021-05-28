import 'dart:async';

import 'package:adbrixrm_flutter/adbrixrm.dart';
import 'package:adbrixrm_flutter_example/commerceEvent.dart';
import 'package:adbrixrm_flutter_example/gameEvent.dart';
import 'package:adbrixrm_flutter_example/userInfoEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String _deeferredDeeplink = "";

  int _currentIndex = 0;
  List _page = [userInfoView(), commerceView(), gameView()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: _page[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.blue,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'userinfo'),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: 'Commerce'),
            BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Game')
          ],
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState currentState) {
    if (currentState == AppLifecycleState.resumed) {
      print("App is onResume");

      Timer(Duration(seconds: 3), () {
        getDeeplink();
      });
    }
  }

  Future<String> getDeeplink() async {
    print(':::::::Getting Deeplink Start :::::::');

    String deeplink = await AdBrixRm.adbrixDeeplink;

    print("FlutterDeeplink ::::: " + deeplink);

    return deeplink;
  }

  Future<void> getDeferredDeeplink() async {
    String deferredDeeplink;

    deferredDeeplink = await AdBrixRm.adbrixDeferredDeeplink;

    if (deferredDeeplink != null) {
      setState(() {
        _deeferredDeeplink = deferredDeeplink;
      });

      print("mydeferredDeeplink");
      print(_deeferredDeeplink);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    AdBrixRm.sdkInit(
        appKey: 'G2Iz74fLkUOcZPZTrZQnQw', secretKey: 'ZP1RO2EDY02kpifcIOlzGQ');

    Timer(Duration(seconds: 5), () {
      getDeferredDeeplink();
      getDeeplink();
    });
  }

  void onTabTapped(int index) {
    switch (index) {
      case 0:
        AdBrixRm.events(eventName: 'userInfo');
        break;

      case 1:
        Map<String, dynamic> attr = <String, dynamic>{
          'int': 2,
          'string': 'this is commerce',
          'string2': 'this is String2',
          'double': 25000.00,
          'long': 2222222222222,
          'bool': false
        };
        AdBrixRm.events(eventName: 'commerce', attr: attr);
        break;

      case 2:
        Map<String, dynamic> attr = <String, dynamic>{
          'string': 'this is game',
          'int': 3,
          'bool': true,
          'long': 33333333333333,
          'double': 35000.00
        };

        AdBrixRm.events(eventName: 'game', attr: attr);

        break;
    }
    setState(() {
      _currentIndex = index;
    });
  }
}
