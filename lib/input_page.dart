import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/icon_Content.dart';
import 'package:bmi_calculator/result_page.dart';
import 'constants.dart';
import 'reuseable_card.dart';

Gender selectedGender;
int _height = 180;
int weight = 25;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color femaleCardColor = kInactiveFemCardColor;
  Color femaleCardtext = kInactiveFemText;
  Color maleCardColor = kInactiveMaleCardColor;
  Color maleCardtext = kInactiveMaleText;

  void resetInput() {
    setState(() {
      selectedGender = null;
      _height = 180;
      weight = 25;
      age = 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                //male card
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      if (selectedGender == Gender.male) {
                        setState(() {
                          selectedGender = null;
                        });
                      } else {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      }
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveMaleCardColor
                        : kInactiveMaleCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.male,
                      label: "Male",
                      fncolor: selectedGender == Gender.male
                          ? kActiveMaleText
                          : kInactiveMaleText,
                    ),
                  ),
                ),

                //female card
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      if (selectedGender == Gender.female) {
                        setState(() {
                          selectedGender = null;
                        });
                      } else {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      }
                    },
                    colour: selectedGender == Gender.female
                        ? KActiveFemCardColor
                        : kInactiveFemCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.female,
                      fncolor: selectedGender == Gender.female
                          ? kActiveFemText
                          : kInactiveFemText,
                      label: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),

          //slider
          Expanded(
            child: ReuseableCard(
              colour: maleCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        _height.toString(),
                        style: kNumberFemTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayColor: Color(0x29E040Fb),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.purple[400],
                      thumbColor: Colors.deepPurpleAccent,
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      min: 100,
                      max: 240,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                        setState(() {
                          _height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),

          //weight card
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveMaleText,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberFemTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                if (weight > 10) {
                                  setState(() {
                                    weight--;
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
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
                  child: ReuseableCard(
                    colour: kActiveMaleText,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberFemTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                if (age > 10) {
                                  setState(() {
                                    age--;
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              width: 12,
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
          //Calcuate Button
          Toast(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Developed by ",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 12,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: " Ahzam Shahnil ❤",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 4,
      constraints: BoxConstraints.tightFor(height: 60, width: 60.0),
      shape: CircleBorder(),
      fillColor: selectedGender == Gender.female
          ? KActiveFemCardColor
          : kActiveMaleCardColor,
    );
  }
}

class Toast extends StatefulWidget {
  @override
  _ToastState createState() => _ToastState();
}

class _ToastState extends State<Toast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kBottomButtonColor,
      ),
      width: double.infinity,
      height: kBottomButtonHeight,
      child: Center(
        child: TextButton(
          onPressed: () {
            if (selectedGender != null) {
              CalculatorBrain calc =
                  CalculatorBrain(height: _height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    description: calc.getDescription(),
                    resultText: calc.getResult(),
                  ),
                ),
              );
            } else {
              final snackBar = SnackBar(
                content: Text(
                  'Select a Gender!😉',
                  style: kSnackBarStyle,
                ),
                backgroundColor: Color(0xff4C3676),
                action: SnackBarAction(
                  label: 'Undo',
                  textColor: Colors.white,
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            }
          },
          child: Text(
            "CALCULATE",
            style: TextStyle(
              backgroundColor: Colors.transparent,
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
