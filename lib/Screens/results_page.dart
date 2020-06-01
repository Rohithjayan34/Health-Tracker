import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../Components/bottom_button.dart';

class ResultsPage extends StatefulWidget {

ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});
   final String bmiResult;
   final String resultText;
   final String interpretation;

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> with SingleTickerProviderStateMixin {


  Animation<Offset> leftanimation;
  Animation<Offset> rightanimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    leftanimation = Tween<Offset>(
      begin: Offset(-3.0, .0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    ));

    rightanimation = Tween<Offset>(
      begin: Offset(3.0, .0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    ));


    Future<void>.delayed(Duration(seconds: 1), () {
      animationController.forward();
    });
  }

  @override
  void dispose() {
    // Don't forget to dispose the animation controller on class destruction
    animationController.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xff0A0E21),
      scaffoldBackgroundColor: Color(0xff0A0E21),
    ),
    home:
      Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,


        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left:15.0,top: 40.0),

                child: SlideTransition(
                  position: leftanimation,
                  child: Text(
                    'Your Result',

                    style: kTitleTextStyle,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SlideTransition(

                    position: rightanimation,
                    child: Text(
                      widget.resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                  ),
                  SlideTransition(
                    position: leftanimation,
                    child: Text(
                      widget.bmiResult,
                      style: kBmiTextStyle,
                    ),
                  ),
                  SlideTransition(
                    position: rightanimation,
                    child: Text(
                     widget.interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SlideTransition(
            position: leftanimation,
            child: BottomButton(buttonLabel: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            }
            ),
          ),
        ],
      ),
      ),
    );
  }
}
