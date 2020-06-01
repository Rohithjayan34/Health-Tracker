


import 'dart:math';
class Calculator {
  Calculator({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;


  String calculateBmi() {
     _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else {
      if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
    }
  }

  String getIntepretation(){
    if(_bmi >= 25){
      return 'You have more weight, Excersis Daily';
    } else if(_bmi > 18.5){
      return ' You have a NORMAL Bmi, Good Job';
    }else
      return 'You are UNDERWEIGHT, Eat more!!!';
  }
}
