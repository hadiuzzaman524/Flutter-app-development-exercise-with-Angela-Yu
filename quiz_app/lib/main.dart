import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quiz_app/questionbrain.dart';


import 'questionbrain.dart';

QuestionBrain questionBrain=QuestionBrain();
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


void checkAnswer(bool myans){

  if (questionBrain.getAnswer()== myans) {
    questionBrain.correctAnswer();
  } else {
  questionBrain.wrongAnswer();
  }

setState(() {
  Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.")
      .show();
});

}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Apps'),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Icon(
                  Icons.question_answer,
                  size: 100,
                  color: Colors.pink,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Center(
                  ///Todo: question area
                  child: Column(
                    children: [
                      Text(
                       questionBrain.getQuestion(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ///TODO: True button area.....
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20.0, 5, 20, 5),
                      child: FlatButton(
                        color: Colors.green,
                        onPressed: () {
                          print('click');
                          setState(() {
                            checkAnswer(true);
                            questionBrain.nextQuestion();

                          });
                        },
                        child: Text(
                          'True',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///TODO:false button area ...
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20.0, 10, 20.0, 0),
                      child: FlatButton(
                        color: Colors.red,
                        onPressed: () {
                          print('false click');
                          setState(() {

                            checkAnswer(false);
                            questionBrain.nextQuestion();

                          });

                        },
                        child: Text(
                          'False',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      children: questionBrain.getResult(),
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
