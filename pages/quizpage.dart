import 'package:flutter/material.dart';

import "../utils/question.dart";
import "../utils/quiz.dart";
import "../components/answerbutton.dart";
import "../components/questionstext.dart";
import '../components/overlay.dart';
import '../pages/score.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuizPage extends StatefulWidget {
@override
State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

Question currentQuestion;
Quiz quiz = new Quiz([
                        new Question('Hawaii pizza is great', true),
                        new Question('pizza is great for your health', false),  
                        new Question('beer is good', false),  
                     ]);
String questionText;
int questionNumber; 
bool isCorrect;
bool overlayShouldBeVisible = false;
// final String url = "https://peaceful-tundra-85950.herokuapp.com/api/lists/22/words";
// List data;
// Future<String> getSWData() async {
//     var res = await http
//         .get(Uri.encodeFull(url), headers: {"Accept": "application/json", "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6ImhpbmFtcGhhbiIsInVzZXJJZCI6NCwiaWF0IjoxNTI2ODAzOTI4LCJleHAiOjE1Mjc0MDg3Mjh9.Im56oNZ2qDmtJR7G24U2p9bxSP8swbwBtntv-DRzrew"});
//     setState(() {
//       var resBody = json.decode(res.body);
//       print(resBody);
//       data = resBody;
//     });
//     return "Success!";
//   }
@override
void initState() {
  super.initState();
  currentQuestion = quiz.nextQuestion;
  questionText = currentQuestion.question;
  questionNumber = quiz.questionNumber;
 // this.getSWData();
}
void handleAnswer(bool answer) {
  isCorrect = (currentQuestion.answer == answer); //check if answers match
  quiz.answer(isCorrect); //increment score
  this.setState(() => overlayShouldBeVisible = true);
}
void handleNextQuestion() {
  if (quiz.length == questionNumber) 
  {
    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
    return;
  }
          currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });

}
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
          new AnswerButton(true, () => handleAnswer(true)),
          new QuestionText(questionText, questionNumber),
          new AnswerButton(false,() => handleAnswer(false))
          ]
        ),
       overlayShouldBeVisible == true ? new MyOverlay(isCorrect, handleNextQuestion) : new Container(),
      ]
    );
}
}


// qweqwe

            // child: new InkWell(
            //    onTap: () => print("hi"),
            //    child: new Center(
            //      child: new Container(
            //        child: new Text("hi"),
            //        )
            //      )
            //    )
            //  )