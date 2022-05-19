import 'package:flutter/material.dart';
import 'global_members.dart';

class SecondClass extends StatefulWidget {
  const SecondClass({Key key}) : super(key: key);

  static const Route_Name = '/second';

  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        leading: SizedBox(height: 0, width: 0,),
        leadingWidth: 0,
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          function();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
