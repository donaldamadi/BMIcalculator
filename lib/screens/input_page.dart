import 'package:bmi_calculator/components/reusableCard.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/cardContent.dart';
import '../components/constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Row(children: [
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                color: selectedGender == Gender.male
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild:
                    CardContent(text: "MALE", icon: FontAwesomeIcons.mars),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild:
                    CardContent(text: "FEMALE", icon: FontAwesomeIcons.venus),
              ),
            ),
          ]),
        ),
        Expanded(
          child: ReusableCard(
            cardChild:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "HEIGHT",
                style: kLabelTextStyle,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      //height.toString()
                      '$height', style: kTextSize,
                    ),
                    Text('cm', style: kLabelTextStyle)
                  ]),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    overlayColor: Color(0x29EB1555),
                    thumbColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15,
                    ),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                child: Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  // activeColor: Colors.white,
                  // inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ),
            ]),
            color: kActiveCardColor,
          ),
        ),
        Expanded(
          child: Row(children: [
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT", style: kLabelTextStyle),
                    Text(weight.toString(), style: kTextSize),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          onPress: () {
                            setState(() {
                              weight -= 1;
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                        ),
                        SizedBox(width: 10),
                        RoundIconButton(
                          onPress: () {
                            setState(() {
                              weight += 1;
                            });
                          },
                          icon: FontAwesomeIcons.plus,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AGE", style: kLabelTextStyle),
                    Text(age.toString(), style: kTextSize),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          onPress: () {
                            setState(() {
                              age -= 1;
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                        ),
                        SizedBox(width: 10),
                        RoundIconButton(
                          onPress: () {
                            setState(() {
                              age += 1;
                            });
                          },
                          icon: FontAwesomeIcons.plus,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        BottomButton(
          text: "CALCULATE",
          onTap: () {
            CalculatorBrain calc =
                CalculatorBrain(height: height, weight: weight);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          interpretation: calc.getInterpretation(),
                          resultText: calc.getResult(),
                        )));
          },
        )
      ]),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
