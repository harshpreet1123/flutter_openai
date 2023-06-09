import 'package:chatgpt/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputBar extends StatelessWidget {
  const InputBar(
      {Key? key,
      required this.textController,
      required this.focusNode,
      required this.width,
      required this.isLoading,
      required this.isButtonEnable,
      required this.buttonPressed})
      : super(key: key);
  final dynamic textController;
  final dynamic focusNode;
  final dynamic width;
  final dynamic isLoading;
  final dynamic isButtonEnable;
  final dynamic buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              // width: width / 1.2,
              child: Card(
                  margin:
                      const EdgeInsets.only(right: 0, top: 20, bottom: 15, left: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    controller: textController,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.multiline,
                    focusNode: focusNode,
                    minLines: 1,
                    maxLines: 100,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Prompt',
                        contentPadding: const EdgeInsets.all(12),
                        suffixIcon: IconButton(
                          icon: const Icon(CupertinoIcons.xmark),
                          onPressed: () {
                            textController.clear();
                          },
                        )),
                  ))),
          SizedBox(
            width: width / 50,
          ),
          Container(
              margin: const EdgeInsets.only(top: 5),
              child: CircleAvatar(
                backgroundColor: Pallete.secondSuggestionBoxColor,
                maxRadius: 25.0,
                child: IconButton(
                  icon: isLoading
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.send_sharp),
                  onPressed: isButtonEnable ? buttonPressed : null,
                ),
              ))
        ],
      ),
    );
  }
}
