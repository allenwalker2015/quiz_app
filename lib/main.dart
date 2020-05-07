import 'package:flutter/material.dart';
import 'package:quizapp/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(backgroundColor: Colors.black, body: QuizBody()),
      ),
    );
  }
}

class QuizBody extends StatefulWidget {
  @override
  _QuizBodyState createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = new QuizBrain();
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: MaterialButton(
              child: Text(
                "Verdadero",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              color: Colors.green,
              onPressed: () {
                setState(() {
                  validateQuestion(buttonValue: true);
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: MaterialButton(
              child: Text(
                "Falso",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              color: Colors.red,
              onPressed: () {
                setState(() {
                  validateQuestion(buttonValue: false);
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: scoreKeeper,
            ),
          ),
        )
      ],
    );
  }

  validateQuestion({bool buttonValue}) {
    if (quizBrain.getQuestionAnswer() == buttonValue) {
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    if (scoreKeeper.length > quizBrain.getQuestionsLength() - 1) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Terminaste!",
        desc: "Ya contestaste todas tus preguntas, felicidades!.",
        buttons: [
          DialogButton(
            child: Text(
              "Volver a jugar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                scoreKeeper.clear();
                quizBrain = QuizBrain();
              });

              Navigator.pop(context);
            },
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          )
        ],
      ).show();
    }
  }
}
