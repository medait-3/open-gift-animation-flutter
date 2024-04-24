import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: gift(),
    );
  }
}
class gift extends StatefulWidget {
  const gift({super.key});

  @override
  State<gift> createState() => _giftState();
}

class _giftState extends State<gift> with SingleTickerProviderStateMixin{
    late AnimationController _controller;
  bool _animationCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() {
        if (_controller.status == AnimationStatus.completed && !_animationCompleted) {
          setState(() {
            _animationCompleted = true;
          });
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(seconds: 6),
            bottom: _animationCompleted ? MediaQuery.of(context).size.height / 2 +90 : 330,

          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/watches/3.png",height:120,),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(seconds: 2),
          bottom:  MediaQuery.of(context).size.height / 2 - 100,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/watches/2.png"),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(seconds: 2),right:  _animationCompleted ? MediaQuery.of(context).size.height /  15 : 0,
      
          bottom: _animationCompleted ? MediaQuery.of(context).size.height / 2 - 151 : 300,
                  child:_animationCompleted? Transform.rotate(
          angle: -0.7, // radians

            child: Container(
              width: MediaQuery.of(context).size.width,
              
              child: Image.asset("assets/watches/1.png"),
            ),
          ): Container(
              width: MediaQuery.of(context).size.width,
              
              child: Image.asset("assets/watches/1.png"),
            ),
        ),
      ],
    );
  }
}
