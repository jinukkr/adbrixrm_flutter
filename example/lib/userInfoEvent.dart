import 'package:adbrixrm_flutter/adbrixrm.dart';
import 'package:flutter/material.dart';

class userInfoView extends StatefulWidget {
  @override
  _userInfoViewState createState() => _userInfoViewState();
}

class _userInfoViewState extends State<userInfoView> {
  Future<void> appUpdate() async {
    Map<String, dynamic> properties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRm.commonAppUpdate(
        preVersion: '2.0.0', currVersion: '3.0.0', attr: properties);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('UserProperties + Common Event'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('signup'),
                  onPressed: signup,
                  padding: EdgeInsets.all(8.0),
                ),
                RaisedButton(
                  child: Text('userid'),
                  onPressed: userid,
                  padding: EdgeInsets.all(8.0),
                ),
                RaisedButton(
                  child: Text('setAge'),
                  onPressed: setAge,
                  padding: EdgeInsets.all(8.0),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('setGender'),
                  onPressed: setGender,
                  padding: EdgeInsets.all(8.0),
                ),
                RaisedButton(
                  child: Text('userProperties'),
                  onPressed: setUserproperties,
                  padding: EdgeInsets.all(8.0),
                ),
                RaisedButton(
                  child: Text('appUpdate'),
                  onPressed: appUpdate,
                  padding: EdgeInsets.all(8.0),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('userInvite'),
                  onPressed: userInvite,
                  padding: EdgeInsets.all(8.0),
                ),
                RaisedButton(
                  child: Text('useCredit'),
                  onPressed: useCredit,
                  padding: EdgeInsets.all(8.0),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: setKakaoId, child: Text('SetKakaoId')),
                ElevatedButton(onPressed: setCiInfo, child: Text('SetCiInfo'))
              ],
            )
          ],
        ),
      ),
    );
  }

  void setKakaoId() {
    AdBrixRm.setKakaoId(kakaoId: 'myKakaoId123');
  }

  void setCiInfo() {
    Map<String, dynamic> ciProperty = <String, dynamic>{
      'custom_info_1': "my_Custom_Ci_info",
      'custom_info_2': 500000,
      'custom_info_3': 150.50,
      'custom_info_4': false,
      'man?': false,
      'Woman': true
    };

    AdBrixRm.setCiProperties(properties: ciProperty);
  }

  Future<void> setAge() async {
    AdBrixRm.setAge(age: 18);
  }

  Future<void> setGender() async {
    AdBrixRm.setGender(gender: AdBrixGender.MALE);
  }

  Future<void> setUserproperties() async {
    Map<String, dynamic> properties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': true,
      'Man?': 'man'
    };

    AdBrixRm.setUserProperties(properties: properties);
  }

  Future<void> signup() async {
    Map<String, dynamic> properties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRm.commonSignUp(channel: AdBrixSignUpChannel.Naver, attr: properties);
  }

  Future<void> useCredit() async {
    Map<String, dynamic> properties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false,
      'credituserd': 200.50
    };

    AdBrixRm.commonUseCredit(attr: properties);
  }

  Future<void> userid() async {
    AdBrixRm.login(userId: 'userID');
  }

  Future<void> userInvite() async {
    Map<String, dynamic> properties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRm.commonUserInvite(
        inviteChannel: AdBrixInviteChannel.Kakao, attr: properties);
  }
}
