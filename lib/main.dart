import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawingBoard(),
    );
  }
}

class DrawingBoard extends StatefulWidget {
  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey,
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
