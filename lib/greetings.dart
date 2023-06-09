import 'package:chatgpt/examples_prompts.dart';
import 'package:flutter/cupertino.dart';

import 'pallete.dart';

Widget Greet(){
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 20),
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            border: Border.all(color: Pallete.borderColor),
            borderRadius: BorderRadius.circular(20)
                .copyWith(topLeft: Radius.zero)),
        child: const Text(
          'Hello! What can i do for you today?',
          style: TextStyle(
              fontFamily: 'Cera Pro',
              fontSize: 20,
              color: Pallete.mainFontColor),
        ),
      ),
      Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Start By Asking Anything Like',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Cera Pro',
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
        const Example(
            color: Pallete.firstSuggestionBoxColor,
            text: 'Explain Quantum Physics to a 10 year old.'),
        const Example(
          color: Pallete.secondSuggestionBoxColor,
          text: 'Create Detailed report on Global Warming',
        ),
        const SizedBox(
          height: 100,
        ),
      ])
    ],
  );
}
