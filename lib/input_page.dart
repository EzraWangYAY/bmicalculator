import 'package:bmicalculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Calculatrice.dart';
import 'mon_container.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bouton_button.dart';
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //Color maleCardColour = inactiveCardColour;
  //Color femaleCardColour = inactieCardColour;
  Gender? selectedGender;
  int height = 180;
  int weight = 50;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculatrice IMC'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: monContainer(
                        colour: selectedGender == Gender.male
                            ? activeCardColour
                            : inactiveCardColour,
                        childCard: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MASCULIN',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: monContainer(
                        colour: selectedGender == Gender.female
                            ? activeCardColour
                            : inactiveCardColour,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 80.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'FEMININ',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: monContainer(
                colour: activeCardColour,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'TAILLE',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: NumberTextStyle,
                        ),
                        Text(
                          ' cm',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    Slider (
                      value: height.toDouble(),
                      min: 120,
                      max: 230,
                      activeColor: Colors.black,
                      inactiveColor: Colors.deepPurple,
                      onChanged: (double newValue){
                        setState((){
                          height = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: monContainer(
                      colour: activeCardColour,
                      childCard: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('POIDS', style: labelTextStyle,),
                        Text(weight.toString(), style: NumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: () {
                              setState((){
                                  weight --;
                              });
                            },),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                              setState((){
                                weight++;
                              });
                            },),
                          ],

                        )

                      ],),
                    ),
                  ),
                  Expanded(
                    child: monContainer(
                      colour: activeCardColour,
                      childCard: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: labelTextStyle,),
                          Text(age.toString(), style: NumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: () {
                                setState((){
                                  age --;
                                });
                              },),
                              SizedBox(width: 10.0,),
                              RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                                setState((){
                                  age++;
                                });
                              },),
                            ],

                          )

                        ],),
                    ),
                  ),
                ],
              ),
            ),

            Buttonbutton(buttonTitle: 'CALCULER',
              onTap: () {
              Calculatrice calc = Calculatrice(height: height, weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    imcResult: calc.calculerIMC(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  )));
            },),
          ],
        ));
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton ({required this.icon, required this.onPressed});
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: Colors.white,),
        onPressed: onPressed,
    elevation: 6.0,
    constraints: BoxConstraints.tightFor(
    width: 45.0,
    height: 45.0,

    ),
    shape: CircleBorder(),
    fillColor: Colors.black12,

    );
  }
}
