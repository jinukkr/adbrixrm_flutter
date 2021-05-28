import 'package:adbrixrm_flutter/adbrixrm.dart';
import 'package:flutter/material.dart';

class gameView extends StatefulWidget {
  @override
  _gameViewState createState() => _gameViewState();
}

class _gameViewState extends State<gameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Game Event'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('TutorialComplete'),
                  onPressed: gameTutorial,
                  padding: EdgeInsets.all(8.0),
                ),
                RaisedButton(
                  child: Text('CreateCharacter'),
                  onPressed: createCharacter,
                  padding: EdgeInsets.all(8.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('LevelComplete'),
                  onPressed: levelComplete,
                  padding: EdgeInsets.all(8.0),
                ),
                RaisedButton(
                  child: Text('StageComplete'),
                  onPressed: stageComplete,
                  padding: EdgeInsets.all(8.0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createCharacter() async {
    Map<String, dynamic> properties = <String, dynamic>{
      'string': '서울시 구로구 동안로',
      'money': 100000,
      'height': 177.76,
      'married': true
    };

    AdBrixRm.gameCharacterCreated(attr: properties);
    AdBrixRm.gameCharacterCreated();
  }

  Future<void> gameTutorial() async {
    Map<String, dynamic> properties = <String, dynamic>{
      'productcateory': '지오다노 온 세',
      'limited': 35000,
      'currentsale': 3000,
      'salesleft': 0.3,
      'sale': true
    };

    AdBrixRm.gameTutorialComplete(isSkip: true, attr: properties);

    AdBrixRm.gameTutorialComplete(isSkip: false);
  }

  Future<void> levelComplete() async {
    Map<String, dynamic> properties = <String, dynamic>{
      'string': '부산시 사하동',
      'money': 25000,
      'height': 167.2,
      'married': false
    };

    AdBrixRm.gameLevelAchieved(levelAchieved: 22, attr: properties);

    AdBrixRm.gameLevelAchieved(levelAchieved: 44);
  }

  Future<void> stageComplete() async {
    Map<String, dynamic> properties = <String, dynamic>{
      'string': '강원도 낙성대입구역',
      'money': 123000,
      'height': 172.50,
      'married': true
    };

    AdBrixRm.gameStageCleared(stageName: '11-5', attr: properties);

    AdBrixRm.gameStageCleared(stageName: '44-67');
  }
}
