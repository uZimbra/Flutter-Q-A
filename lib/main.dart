import 'package:QnA/questionary.widget.dart';
import 'package:QnA/result.widget.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  initState() {}

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _askIndex = 0;
  int _score = 0;

  final _asks = const [
    {
      'text': 'Qual a sua cor favorita?',
      'answers': [
        {'text': 'Preto', 'score': 10},
        {'text': 'Vermelho', 'score': 5},
        {'text': 'Azul', 'score': 3},
        {'text': 'Branco', 'score': 1},
      ]
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answers': [
        {'text': 'Cobra', 'score': 10},
        {'text': 'Coelho', 'score': 5},
        {'text': 'Elefante', 'score': 3},
        {'text': 'Leão', 'score': 1},
      ]
    },
    {
      'text': 'Qual é o seu instrutor favorito?',
      'answers': [
        {'text': 'Maria', 'score': 10},
        {'text': 'João', 'score': 5},
        {'text': 'Leo', 'score': 3},
        {'text': 'Pedro', 'score': 1},
      ]
    },
  ];

  void _answer(int value) {
    if (_hasAnswers) {
      setState(() {
        _askIndex++;
        _score = value;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      _askIndex = 0;
      _score = 0;
    });
  }

  bool get _hasAnswers => _askIndex < _asks.length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[400],
          title: const Center(
            child: Text('Perguntas e respostas!'),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            _hasAnswers
                ? Questionary(
                    askIndex: _askIndex,
                    asks: _asks,
                    onAnswer: _answer,
                  )
                : Result(
                    score: _score,
                    onButtonPress: resetQuiz,
                  ),
          ],
        ),
      ),
    );
  }
}
