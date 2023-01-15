import 'package:flutter/material.dart';

class One extends StatefulWidget {
  One({Key? key}) : super(key: key);

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Container(child: Text('this is the page one ')),
        MaterialButton(
          color: Colors.blue.shade500,
          onPressed: (){
          // it return true if we can return back(if already came by navigator(push))
          if(Navigator.of(context).canPop()){
            Navigator.of(context).pop();
          }
        },
        child: Text('return'),),
        MaterialButton(
          color: Colors.blue.shade500,
          onPressed: (){
          // it return true if we can return back(if already came by navigator(push))
          // if we use pushRepmaceNamed ,we will not be able to return back 
            Navigator.of(context).pushNamed('two');

        },
        child: Text('go to the page two'),),
      ],),
    );
  }
}