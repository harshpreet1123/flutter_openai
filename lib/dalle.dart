import 'package:chatgpt/drawer.dart';
import 'package:chatgpt/inputbar.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';
import 'openai_service.dart';

class DALLE extends StatefulWidget {
  const DALLE({Key? key}) : super(key: key);

  @override
  State<DALLE> createState() => _DALLEState();
}

class _DALLEState extends State<DALLE> {
  int currentindex = 1;
  final OpenAIService openAIService = OpenAIService();
  List<String>? urls;
  final textController = TextEditingController();
  bool isButtonEnable = false;
  String? prompt;
  bool isLoading = false;
  List<String> chat = [];
  final focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.addListener(updateButton);
  }

  void updateButton() {
    setState(() {
      isButtonEnable = textController.text.isNotEmpty;
    });
  }

  void buttonPressed() async {
    setState(() {
      isLoading = true;
    });
    String prompt = textController.text;
    // List<String> res = await openAIService.chatGPTApi(prompt);
    setState(() {
      isLoading = false;
      textController.clear();
    });
    focusNode.unfocus;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: Appbar(context,'DALL-E','assets/images/gptlogo.png'),
      drawer: NavDrawer(currentIndex: currentindex,),
      body: Stack(
        children: [
          Container(),
          SizedBox(height: 200,),
          InputBar(textController: textController, focusNode: focusNode, width: width, isLoading: isLoading, isButtonEnable: isButtonEnable, buttonPressed: buttonPressed)
        ],
      ),
    );
  }
}
