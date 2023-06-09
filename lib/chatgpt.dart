import 'package:chatgpt/drawer.dart';
import 'package:chatgpt/inputbar.dart';
import 'package:chatgpt/openai_service.dart';
import 'package:chatgpt/greetings.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  final textController = TextEditingController();
  bool isButtonEnable = false;
  String? prompt;
  bool isLoading = false;
  List<String> chat = [];
  final focusNode = FocusNode();
  int currentindex = 0;

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
    String res = await openAIService.chatGPTApi(prompt);
    setState(() {
      chat.add(prompt);
      chat.add(res);
      generatedContent = res;
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: Appbar(context, 'ChatGPT', 'assets/images/gptlogo.png'),
      drawer: NavDrawer(
        currentIndex: currentindex,
      ),
      body: Stack(children: [
        chat.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: chat.length,
                itemBuilder: (context, index) {
                  final message = chat[index];

                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color:
                          index % 2 == 0 ? Colors.grey[300] : Colors.blue[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontFamily: 'Cera Pro',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              )
            : Greet(),

        InputBar(textController: textController, focusNode: focusNode, width: width, isLoading: isLoading, isButtonEnable: isButtonEnable, buttonPressed: buttonPressed),
      ]),
    );
  }
}
