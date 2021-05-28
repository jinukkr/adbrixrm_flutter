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

    AdBrixRm.commonAppUpdate(preVersion: '1.0.0a', currVersion: '2.0.0a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Event Count Interval'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(onPressed: c_min, child: Text('c_Min')),
                ElevatedButton(onPressed: c_nor, child: Text('c_Nor')),
                ElevatedButton(onPressed: c_max, child: Text('c_Max'))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('Event Time Interval'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(onPressed: t_min, child: Text('t_Min')),
                ElevatedButton(onPressed: t_Nor, child: Text('t_Nor')),
                ElevatedButton(onPressed: t_max, child: Text('t_Max')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Text Custom Event : '),
                ElevatedButton(
                    onPressed: testCustomEvent, child: Text('customEvent'))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('UserProperties'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text('signup'),
                  onPressed: signup,
                ),
                ElevatedButton(
                  child: Text('Login'),
                  onPressed: userid,
                ),
                ElevatedButton(
                  child: Text('setAge'),
                  onPressed: setAge,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text('setGender'),
                  onPressed: setGender,
                ),
                ElevatedButton(
                  child: Text('userProperties'),
                  onPressed: setUserproperties,
                ),
                ElevatedButton(onPressed: logOut, child: Text('LogOut'))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('commonEvent'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text('appUpdate'),
                  onPressed: appUpdate,
                ),
                ElevatedButton(
                  child: Text('userInvite'),
                  onPressed: userInvite,
                ),
                ElevatedButton(
                  child: Text('useCredit'),
                  onPressed: useCredit,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('Ci Setup'),
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

  void c_min() {
    AdBrixRm.setEventUploadCountInterval(
        interval: AdBrixEventUploadCountInterval.MIN);
  }

  void c_nor() {
    AdBrixRm.setEventUploadCountInterval(
        interval: AdBrixEventUploadCountInterval.NORMAL);
  }

  void c_max() {
    AdBrixRm.setEventUploadCountInterval(
        interval: AdBrixEventUploadCountInterval.MAX);
  }

  void t_min() {
    AdBrixRm.setEventUploadTimeInterval(
        interval: AdBrixEventUploadTimeInterval.MIN);
  }

  void t_Nor() {
    AdBrixRm.setEventUploadTimeInterval(
        interval: AdBrixEventUploadTimeInterval.NORMAL);
  }

  void t_max() {
    AdBrixRm.setEventUploadTimeInterval(
        interval: AdBrixEventUploadTimeInterval.MAX);
  }

  void testCustomEvent() {
    AdBrixRm.events(eventName: 'EventInterval');
  }

  void logOut() {
    AdBrixRm.logout();
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
    AdBrixRm.commonSignUp(channel: AdBrixSignUpChannel.Facebook);
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
    AdBrixRm.commonUseCredit();
  }

  Future<void> userid() async {
    AdBrixRm.login(userId: 'userID_Flutter');
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

    AdBrixRm.commonUserInvite(inviteChannel: AdBrixInviteChannel.QQ);
  }
}
