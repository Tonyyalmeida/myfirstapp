import 'package:flutter/material.dart';
import '../pages/home.dart';

class ScorePage extends StatelessWidget {
final int score;
final int totalQuestions;
ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
  return new Material(
    color: Colors.blueAccent,
    child: new InkWell(
     onTap: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new MyHomePage()), (Route route) => route == null ),
     child: new Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         new Text("Results:", style: new TextStyle(color: Colors.white, fontSize: 45.0, fontWeight: FontWeight.bold)),
         new Text(score.toString() + "/" + totalQuestions.toString(), style: new TextStyle(color: Colors.white, fontSize: 34.0, fontWeight: FontWeight.bold)),
         new IconButton(
           icon: new Icon(Icons.arrow_right),
           color: Colors.white,
           iconSize: 60.0
         )
       ]
     ) 
    )
  );
}
}