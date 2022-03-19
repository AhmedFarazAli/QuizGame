import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuestionsAnswers.dart';


void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.grey[900],
            leading: Icon(Icons.games),
            title: Text(
              'Quizzler',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
          body: QuizPlay(),
        ),
      ),
    );
  }
}

class QuizPlay extends StatefulWidget {
  const QuizPlay({Key? key}) : super(key: key);

  @override
  State<QuizPlay> createState() => _QuizplayState();
}

class _QuizplayState extends State<QuizPlay> {
  List<Icon> score=[];// array of score icon
  List<Questions>questionsAndAnswers=[
    Questions(a:'Pakistan is an under developed country',b:true),
    Questions(a:'Imran Khan is the Prime Minister of Pakistan',b:true),
    Questions(a:'Y comes after U',b:false)
  ];
  int questiontracker=0;// varaible to increament of questions
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionsAndAnswers[questiontracker].ques,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                //Yes button
                bool answer=questionsAndAnswers[questiontracker].ans;
                if (answer==true)
                  {
                    print('correct answer');
                  }
                else
                  {
                    print('wrong answer  ');
                  }
                setState(() {
                  questiontracker++;
                  score.add(Icon(Icons.check,color: Colors.green,)) ;
                });
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                // No button
                bool answer=questionsAndAnswers[questiontracker].ans;
                if (answer==false)
                {
                  print('correct answer');
                }
                else
                {
                  print('wrong answer  ');
                }
                setState(() {
                  questiontracker++;
                  score.add(Icon(Icons.close,color: Colors.red,)) ;
                });
              },
              child: Text(
                'No',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: score,
        ),
      ],
    );
  }
}
