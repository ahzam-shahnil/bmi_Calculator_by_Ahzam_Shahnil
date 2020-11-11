import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmiResult,
    @required this.description,
    @required this.resultText,
  });
  final String bmiResult;
  final String description;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Your Result",
                  style: kHeadingStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuseableCard(
                colour: kInactiveMaleCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kTitleTextStyle,
                    ),
                    Text(
                      bmiResult.toUpperCase(),
                      style: selectedGender == Gender.female
                          ? kResultStyle
                          : kResultStyleM,
                    ),
                    Text(
                      description,
                      style: selectedGender == Gender.female
                          ? kResultTextStyle
                          : kResultTextStyleM,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
           
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: kBottomButtonHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kBottomButtonColor,
                  ),
                  child: Center(
                    child: Text(
                      'Re-Calculate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Developed by ",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 16,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: " Ahzam Shahnil ❤",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'sans-serif',
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
