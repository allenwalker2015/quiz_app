import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question(questionText: "¿El cielo es azul?", questionAnswer: true),
    Question(questionText: "¿Los perros maullan?", questionAnswer: false),
    Question(
        questionText: "¿La luz es mas rápida que el sonido?",
        questionAnswer: true)
  ];

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  int getQuestionsLength() {
    return _questions.length;
  }

  void nextQuestion() {
    if (_questionNumber < this.getQuestionsLength() - 1) {
      _questionNumber++;
    }
  }
}
