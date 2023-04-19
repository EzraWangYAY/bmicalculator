import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
const activeCardColour = Colors.cyanAccent;
class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    child: monContainer(colour: activeCardColour,
                      childCard: IconContent(icon: FontAwesomeIcons.mars,
                      label: 'MASCULIN',),
                    ),

                  ),
                  Expanded(
                   child: monContainer(colour: activeCardColour,
                   childCard: Column(mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                     Icon(FontAwesomeIcons.venus,
                     size: 80.0,),
                     SizedBox(height: 15.0,),
                     Text('FEMININ', style: TextStyle(fontSize: 18.0, color: Colors.black),)
                   ],),),
                  ),
                ],
              ),
            ),
            Expanded(
              child: monContainer(colour: activeCardColour,),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: monContainer(colour: activeCardColour,),
                  ),
                  Expanded(
                    child: monContainer(colour: activeCardColour,),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.deepOrange,
              margin: EdgeInsets.only(top:10.0),
              width: double.infinity,
              height: 80.0,
            ),
          ],
        ));
  }
}

class IconContent extends StatelessWidget {
  IconContent({this.icon,this.label});

final IconData ? icon;
final String ? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(icon,
        size: 80.0,),
      SizedBox(height: 15.0,),
      Text(
        label!,
        style:
      TextStyle(fontSize: 18.0, color: Colors.black),)
    ],);
  }
}

class monContainer extends StatelessWidget {
  monContainer({required this.colour, this.childCard});
final Color colour;
final Widget ? childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ));
  }
}
