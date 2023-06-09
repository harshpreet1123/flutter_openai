import 'package:chatgpt/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget Appbar(context,String title,String logopath){
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          logopath,
          height: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(title,
          style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cera Pro'),
        ),
      ],
    ),
    leading: Builder(builder: (context){
      return IconButton(icon: const Icon(Icons.menu_sharp),onPressed: (){Scaffold.of(context).openDrawer();});
    },),
    actions: [
      OutlinedButton(
          onPressed: () {},
          child: const Icon(
            Icons.question_mark_rounded,
            color: Pallete.mainFontColor,
          ))
    ],
    elevation: 0.0,
    centerTitle: true,
  );
}