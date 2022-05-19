import 'dart:math';
import 'package:flutter/material.dart';
import 'package:three_d_navi/second.dart';
import 'global_members.dart';
import 'main.dart';

PageRouteBuilder  onGenerateRoutes(RouteSettings settings) {
  if (settings.name == MyApp.Route_Name) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyApp(),
      transitionDuration: Duration(milliseconds: animationDuration),
      reverseTransitionDuration: Duration(milliseconds: animationDuration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  } else {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SecondClass(),
        transitionDuration: Duration(milliseconds: animationDuration),
        reverseTransitionDuration: Duration(milliseconds: animationDuration),
        transitionsBuilder:
            (context, animation, secondaryAnimation, child) {
          Tween<double> tween = Tween<double>(begin: 0.0, end: 90 * pi/180);

          return Stack(
            children: <Widget>[
              Visibility(
                visible: true,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..translate(-(width / 2) * cos(animation.drive(tween).value), 0.0,
                        ((width / 2) * cos(animation.drive(tween).value)))
                    ..rotateY((pi / 2) - (animation.drive(tween).value)),
                  child: Container(
                    child: Center(child: SecondClass()),
                  ),
                ),
              ),
              Visibility(
                visible: animation.drive(tween).value <= 81 * pi/180 ? true : false,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..translate(
                      (width / 2) * sin(animation.drive(tween).value),
                      0.0,
                      ((width / 2) * sin(animation.drive(tween).value)),
                    )
                    ..rotateY(-animation.drive(tween).value),
                  child: Container(
                    child: Center(child: MyApp()),
                  ),
                ),
              )
            ],
          );
        });
  }
}