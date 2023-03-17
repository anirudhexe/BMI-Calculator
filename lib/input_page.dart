import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconcontent.dart';
import 'containerdesign.dart';
import 'resultscreen.dart';
import 'calci.dart';

const CardColour = Color(0xFF1C1C2D);
const BottomCardColour = Color(0xFFC000EB);
const activeColour = Color(0xFF1C1C2E);
const inactiveColour = Color(0xFF262445);

enum Gender { male, female }

class Inputpage extends StatefulWidget {
  @override
  State<Inputpage> createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Color male = inactiveColour;
  Color female = inactiveColour;
  int height = 180;
  int weight = 60;
  int age = 18;

  void updatecolour(Gender n) {
    if (n == Gender.male) {
      if (male == inactiveColour) {
        male = activeColour;
        female = inactiveColour;
      } else if (male == activeColour) {
        male = inactiveColour;
        female = activeColour;
      }
    } else if (n == Gender.female) {
      if (female == inactiveColour) {
        female = activeColour;
        male = inactiveColour;
      } else {
        if (female == activeColour) {
          female = inactiveColour;
          male = activeColour;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontFamily: 'Prompt-Medium',
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updatecolour(Gender.male);
                        });
                      },
                      child: Containerdesign(
                        cardchild: iconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                        colour: male,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updatecolour(Gender.female);
                        });
                      },
                      child: Containerdesign(
                        cardchild: iconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                        colour: female,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Containerdesign(
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.bold),
                        ),
                        Text('cm'),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 14),
                        overlayColor: Color(0x29C000EB),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 200,
                        activeColor: Color(0xFFC000EB),
                        inactiveColor: Colors.grey,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                colour: CardColour,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Containerdesign(
                      cardchild: Column(
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 60, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.minus, size: 20),
                                backgroundColor: Color(0xFFC000EB),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(Icons.add_rounded, size: 25),
                                backgroundColor: Color(0xFFC000EB),
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: CardColour,
                    ),
                  ),
                  Expanded(
                    child: Containerdesign(
                      cardchild: Column(
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: Color(0xFFC000EB),
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus,size: 20),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                backgroundColor: Color(0xFFC000EB),
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(Icons.add,size: 25),
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: CardColour,
                    ),
                  ),
                ],
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
                  Calci calc=Calci(height: height, weight: weight);

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>result(
                    interpretation: calc.getInterpretation(),
                    bmiresult: calc.getresult(),
                    score: calc.BMIscore(),
                  )));
                },
                child: Center(
                  child: Text(
                    'CALCULATE',
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
