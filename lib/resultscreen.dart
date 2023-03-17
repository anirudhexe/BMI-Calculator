import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/resultscreen.dart';
import 'package:flutter/material.dart';

const ktextstyle=TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22,
);
const kBMItextstyle=TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold
);
const kbodytext=TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w400
);

class result extends StatelessWidget
{
  result({required this.score,required this.bmiresult,required this.interpretation});
  final String score;
  final String bmiresult;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF383564),
        appBarTheme: AppBarTheme(
          color: Color(0xFF383564),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text('Your Result',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Yantramanav-Regular',
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: CardColour,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiresult.toUpperCase(),
                      style: ktextstyle,
                    ),
                    Text(score.toUpperCase(),
                    style: kBMItextstyle,
                    ),
                    Text(interpretation.toUpperCase(),
                    style: kbodytext,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              height: 80,
              width: 500,
              decoration: BoxDecoration(
                  color: BottomCardColour,
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Yantramanav-Regular',
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
