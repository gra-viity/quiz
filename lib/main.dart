import 'quiz_brain.dart';
import 'package:flutter/material.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzer());
//
//class Dice extends StatefulWidget {
//  @override
//  _DiceState createState() => _DiceState();
//}
//
//class _DiceState extends State<Dice> {
//  int leftDiceNumber = 1;
//  int rightDiceNumber = 1;
//  void face() {
//    leftDiceNumber = Random().nextInt(6) + 1;
//    rightDiceNumber = Random().nextInt(6) + 1;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        backgroundColor: Colors.pink.shade400,
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              Center(
//                child: Text(
//                  'Tap on Dice..',
//                  style: TextStyle(
//                      fontSize: 60.0,
//                      fontFamily: 'Lobster',
//                      fontWeight: FontWeight.bold),
//                ),
//              ),
//              Row(
//                children: <Widget>[
//                  Expanded(
//                    child: FlatButton(
//                      onPressed: () {
//                        setState(() {
//                          print('left button');
//                          face();
//                        });
//                      },
//                      child: Image.asset('images/dice$leftDiceNumber.png'),
//                    ),
//                  ),
//                  Expanded(
//                    child: FlatButton(
//                      onPressed: () {
//                        setState(() {
//                          print('right button');
//                          face();
//                        });
//                      },
//                      child: Image.asset('images/dice$rightDiceNumber.png'),
//                    ),
//                  ),
//                ],
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        backgroundColor: Colors.teal,
//        body: SafeArea(
//            child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            CircleAvatar(
//              radius: 70.0,
//              backgroundImage: AssetImage('images/love.png'),
//            ),
//            Text(
//              'Shubham',
//              style: TextStyle(
//                  fontFamily: 'Lobster',
//                  fontSize: 40.0,
//                  color: Colors.white,
//                  fontWeight: FontWeight.bold),
//            ),
//            Text(
//              'FLUTTER DEVELOPER',
//              style: TextStyle(
//                  fontFamily: 'Source Sans Pro',
//                  fontSize: 20.0,
//                  color: Colors.teal[100],
//                  letterSpacing: 2.5,
//                  fontWeight: FontWeight.bold),
//            ),
//            SizedBox(
//              height: 30.0,
//              width: 120.0,
//              child: Divider(
//                color: Colors.teal.shade100,
//              ),
//            ),
//            Card(
//              elevation: 5.0,
//              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
//              child: ListTile(
//                leading: Icon(
//                  Icons.phone,
//                  color: Colors.teal.shade300,
//                ),
//                title: Text('+91 78377 88189',
//                    style: TextStyle(
//                        fontSize: 22.0, fontFamily: 'Source Sans Pro')),
//              ),
//            ),
//            Card(
//              elevation: 5.0,
//              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
//              child: ListTile(
//                leading: Icon(
//                  Icons.email,
//                  color: Colors.teal.shade300,
//                ),
//                title: Text('shubham.rawat1995@gmail.com',
//                    style: TextStyle(
//                        fontSize: 22.0, fontFamily: 'Source Sans Pro')),
//              ),
//            ),
//          ],
//        )),
//      ),
//    );
//  }
//}

class Quizzer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.00),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> ans = [];
  void checkAnswer(bool userChoice) {
    int test = 0;
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      // while (test <= quizBrain.getSizeOfList()) {
      if (userChoice == correctAnswer) {
        ans.add(Icon(Icons.check, color: Colors.green));
      } else {
        ans.add(Icon(Icons.close, color: Colors.red));
      }
      quizBrain.nextQuestion();
      //}
    });
    //test++;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getText(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50.00, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.00),
            child: FlatButton(
              onPressed: () {
                checkAnswer(true);
              },
              color: Colors.green.shade600,
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.00, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.00),
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              color: Colors.red.shade600,
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.00, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: ans,
        ),
      ],
    );
  }
}
