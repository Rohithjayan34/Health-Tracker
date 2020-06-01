import 'package:bmi_calculator/Screens/results_page.dart';

import '../Components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/icon_content.dart';
import '../constants.dart';
import '../Components/bottom_button.dart';
import '../Components/roundbutton_icon.dart';
import 'package:bmi_calculator/calculator.dart';
enum Gender {
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height =180;
  int weight=60;
  int age=20;
      @override
      Widget build(BuildContext context) {

        return MaterialApp(
          theme: ThemeData.dark().copyWith(
            primaryColor: Color(0xff0A0E21),
            scaffoldBackgroundColor: Color(0xff0A0E21),
          ),
          home: Scaffold(
          appBar: AppBar(
            title: Text('BMI CALCULATOR'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender=Gender.male;
                          });
                        },
                        colour: selectedGender==Gender.male?kActiveCardColor:kInActiveCardColor,
                        cardChild: IconContent(icon: FontAwesomeIcons.mars,
                          label: 'MALE',),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender=Gender.female;
                          });
                        },
                        colour: selectedGender==Gender.female?kActiveCardColor:kInActiveCardColor,
                        cardChild: IconContent(icon: FontAwesomeIcons.venus,
                          label: 'FEMALE'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text('cm',
                         style: kLabelTextStyle,

                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xff8d8e98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xffeb1555),
                          overlayColor: Color(0x29eb1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),


                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,


                          onChanged: (double value)
                        {
                          setState(() {
                            height=value.round();
                          });

                        },



                        ),
                      )
                    ],
                  ),
                    colour: kActiveCardColor),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT',style: kLabelTextStyle,),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIcon(
                                    icon: FontAwesomeIcons.minus,
                                  onPress: (){
                                      setState(() {
                                        weight--;
                                      });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIcon(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                          colour: kActiveCardColor),
                    ),
                    Expanded(
                        child: ReusableCard(
                          cardChild:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                           Text('AGE',style: kLabelTextStyle,),
                           Text(
                             age.toString(),
                                style: kNumberTextStyle,),
                             Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIcon(
                           icon: FontAwesomeIcons.minus,
                             onPress: (){
                             setState(() {
                              age--;
                                   });
                                },
                              ),
                               SizedBox(
                               width: 10.0,
                              ),
                              RoundIcon(
                             icon: FontAwesomeIcons.plus,
                             onPress: (){
                              setState(() {
                               age++;
        });
        },
        ),
        ],
        ),
        ],
        ),

                            colour: kActiveCardColor)
                    ),
                  ],
                ),
              ),
              BottomButton(buttonLabel: 'CALCULATE',
                  onTap:  () {

                Calculator calc=Calculator(height: height,weight: weight);



        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultsPage(
          bmiResult: calc.calculateBmi(),
          resultText: calc.getResult(),
          interpretation: calc.getIntepretation(),
        ),),
        );
        }
              ),

        ],
          ),
          ),
        );
      }
    }


