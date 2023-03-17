import 'dart:math';

class Calci {
  Calci({required this.height, required this.weight});
    final int height;
    final int weight;

    double _BMI=0.0;

    String BMIscore()
  {
    _BMI=weight/pow(height/100,2);
    return _BMI.toStringAsFixed(1);
  }

  String getresult()
  {
    _BMI=weight/pow(height/100,2);
    if(_BMI>30)
      return 'Obesity';
    else if(_BMI>25 && _BMI<=30)
      return 'Overweight';
    else if(_BMI>=18.5 && _BMI<=25)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation()
  {
    _BMI=weight/pow(height/100,2);
    if(_BMI>30 )
      return 'Obesity increases the risk of a number of serious diseases and health conditions like heart disease and stroke or high blood pressure, You may need to seek medical help';
    else if(_BMI>25 && _BMI<=30)
      return 'Being overweight may cause increse in blood pressure and may lead to heart related medical conditions. Eat less fatty foods, add vegetables to your diet and workout more';
    else if(_BMI>=18.5 && _BMI<=25)
      return 'Helthy BMI score, keep it up!';
    else
      return 'Being underweight may cause diseases like anemia, fragile bones and weakened immune system, You need to eat more';
  }
}