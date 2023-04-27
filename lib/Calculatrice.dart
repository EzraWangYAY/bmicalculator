import 'dart.math';
class Calculatrice{
  Calculatrice({this.height, this.weight});

  final int ?height;
  final int ?weight;

  double ? _imc;

  String calculerIMC(){
    _imc = weight! /pow(height! / 100, 2);
    return _imc!.toStringAsFixed(1);

  }
  String getResult(){
    if(_imc! >= 25){
      return 'Surpoids';
    }else if(_imc! > 18.5){
      return 'Normal';
    }else{
      return 'Deficit ponderal';
    }
  }
  String getInterpretation(){
    if(_imc! >= 25){
      return 'Ton poids est superieur a la normale. Exerces toi plus.';
    }else if(_imc! >= 18.5){
      return 'Excellent! Tu as un poids normal';
    }else{
      return 'Tu es un poids inferieur a la norme. If faut manger plus';

    }
  }
}