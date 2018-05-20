import 'package:flutter/material.dart';
class AnswerButton extends StatelessWidget {
final bool _answer;
final VoidCallback _onTap;
// above: Define props
// below: add as arguments for constructor
AnswerButton(this._answer, this._onTap);
 @override
  Widget build(BuildContext context) {
  return new Expanded(
          child: new Material(
            color: _answer == true ? Colors.greenAccent : Colors.redAccent,
              child: new InkWell(
                onTap: () => _onTap(),
                  child: new Center(
                    child: new Container(
                      padding: new EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.white, width: 3.0)
                      ),
                      child: new Text(_answer == true ? "true": "false",
                        style: new TextStyle(color: Colors.white, fontSize: 45.0)
                      )
                    )
                  )
                )
              )
            );
}
}