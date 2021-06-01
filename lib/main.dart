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
  Color selectedColor = Colors.black;
  double strokeWidth = 5;
  List<DrawingPoint> drawingPoints = [];
  List<Color> colors = [
    Colors.pink,
    Colors.red,
    Colors.black,
    Colors.yellow,
    Colors.blue,
    Colors.deepPurple,
    Colors.green,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanStart: (details) {
          setState(() {
            drawingPoints.add(
              DrawingPoint(
                details.localPosition,
                Paint()
                  ..color = selectedColor
                  ..isAntiAlias = true
                  ..strokeWidth = strokeWidth
                  ..strokeCap = StrokeCap.round,
              ),
            );
          });
        },
        onPanUpdate: (details) {
          setState(() {
            drawingPoints.add(
              DrawingPoint(
                details.localPosition,
                Paint()
                  ..color = selectedColor
                  ..isAntiAlias = true
                  ..strokeWidth = strokeWidth
                  ..strokeCap = StrokeCap.round,
              ),
            );
          });
        },
        onPanEnd: (details){
          setState(() {
            drawingPoints.add(null);
          });
        },
        child: CustomPaint(
          painter: _DrawingPainter(drawingPoints),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                colors.length, (index) => buildColorChoose(colors[index])),
          ),
        ),
      ),
    );
  }

  Widget buildColorChoose(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        height: isSelected ? 47 : 40,
        width: isSelected ? 47 : 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(
                  color: Colors.white,
                  width: 3,
                )
              : null,
        ),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawingPoints;
  _DrawingPainter(this.drawingPoints);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DrawingPoint {
  Offset offset;
  Paint paint;

  DrawingPoint(this.offset, this.paint);
}
