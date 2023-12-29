import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import './result_page.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 120;
  int weight = 60;
  int age = 20;

  int calculate(int a, int b) {
    int result = a + b;
    return result;
  }

  Color getBtnColor(Gender selectedGender, Gender btn) {
    if (selectedGender == btn) {
      return kClickCardColor;
    } else {
      return kInactiveCardColour;
    }
    // if (btn == Gender.female) {
    //   if (selectedGender == Gender.female) {
    //     return kClickCardColor;
    //   } else {
    //     return kInactiveCardColour;
    //   }
    // } else {
    //   if (selectedGender == Gender.male) {
    //     return kClickCardColor;
    //   } else {
    //     return kInactiveCardColour;
    //   }
    // }
  }

  String getBtnLabel(Gender selectedGender, Gender btn) {
    if (btn == Gender.male) {
      if (selectedGender == Gender.male) {
        return 'male';
      } else {
        return 'MALE';
      }
    } else {
      //female
      if (selectedGender == Gender.female) {
        return 'female';
      } else {
        return 'FEMALE';
      }
    }
  }

  String getFemaleIconLabel(Gender selectedGender) {
    if (selectedGender == Gender.female) {
      return 'female';
    } else {
      return 'FEMALE';
    }
  }

  Color getFemaleIconColor(Gender selectedGender) {
    if (selectedGender == Gender.female) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
        ),
        backgroundColor: kActiveCardColour,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: getBtnColor(selectedGender, Gender.male),
                  // colour: selectedGender == Gender.male
                  //     ? kClickCardColor
                  //     : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: getBtnLabel(selectedGender, Gender.male),
                    color: selectedGender == Gender.male
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: getBtnColor(selectedGender, Gender.female),
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    color: getFemaleIconColor(selectedGender),
                    label: getBtnLabel(selectedGender, Gender.female),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
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
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 70.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (weight > 5) {
                                      weight--;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    if (age > 1) {
                                      age--;
                                    }
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: BottomButton(
                  color: Color(0xFFEB1555),
                  buttonTitle: 'CALCULATE',
                  onTap: () {
                    CalculatorBrain calc =
                        CalculatorBrain(height: height, weight: weight);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterprepation(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: BottomButton(
                  color: Color(0xFF696969),
                  buttonTitle: 'RESET',
                  onTap: () {
                    setState(() {
                       height = 120;
                       weight = 60;
                       age = 20;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
