import 'package:flutter/material.dart';
import 'package:three_d_navi/routes.dart';
import 'package:three_d_navi/second.dart';
import 'global_members.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    onGenerateRoute: onGenerateRoutes,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  static const Route_Name = '/';

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool myAppVisible = true;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: myAppVisible,
      child: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          leading: SizedBox(height: 0, width: 0,),
          leadingWidth: 0,
          title: Text('Fist Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, SecondClass.Route_Name);
            Future.delayed(const Duration(milliseconds: 50),() {
              setState(() {
                myAppVisible = false;
              });
            });
            function = () {
              Future.delayed(Duration(milliseconds: animationDuration),() {
                setState(() {
                  myAppVisible = true;
                });
              });
            };
          },
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
