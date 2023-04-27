import 'package:flutter/material.dart';

import 'bouton_button.dart';
import 'constants.dart';
import 'mon_container.dart';

class ResultsPage extends StatelessWidget{
  ResultsPage({required this.imcResult, required this.resultText, required this.interpretation});

    final String imcResult;
    final String resultText;
    final String interpretation;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('CALCULATRICE IMC'),

        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Voici les resultats', style: TitleTextStyle),
          ),
        ),
        Expanded(
          flex: 5,
          child: monContainer(
            colour: activeCardColour,
            childCard: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resultText.toUpperCase(), style: resultTextStyle),
                Text(imcResult, style: ImcResultTextStyle,),
                Text(interpretation, style: ImcInterpretTextStyle
                textAlign: TextAlign.center,),

              ],
            ),
          ),),
        Buttonbutton(onTap: (){
          Navigator.pop(context);
        }, buttonTitle: 'RE-CALCULER')
      ],),
    );
  }
}

