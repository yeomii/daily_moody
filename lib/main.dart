import 'package:flutter/material.dart';

void main() {
  runApp(DailyMoodyApp());
}

class DailyMoodyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Moody',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Kotta One',
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: LifeMeter(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/sunset.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomSheet: BottomScreen(),
    );
  }
}

class BottomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Becoming is better than being.",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class LifeMeter extends StatefulWidget {
  @override
  _LifeMeterState createState() => _LifeMeterState();
}

class _LifeMeterState extends State<LifeMeter> {
  bool yearly = false;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      LifeDay(
        yearly: yearly,
        onTap: () {
          setState(() {
            this.yearly = !this.yearly;
          });
        },
      ),
      Container(
        width: 0,
        height: 16,
      ),
      LifeDayUnit(yearly: yearly,),
      Container(
        width: 0,
        height: 24,
      ),
      Buttons()
    ]);
  }
}

class LifeDay extends StatelessWidget {
  LifeDay({
    this.yearly = false,
    this.onTap
  });
  final bool yearly;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Day",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 32.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 0,
                height: 8,
              ),
              Text(
                yearly ? "344" : "10000",
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
          color: Color.fromRGBO(0, 0, 0, 0.5),
        ),
      ),
    );
  }
}

class LifeDayUnit extends StatelessWidget {
  LifeDayUnit({
    this.yearly = false
  });
  final bool yearly;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      yearly ? "of this year" : "of your life",
      style: TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 18.0,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    ));
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkButton(icon: Icons.book),
        Container(
          width: 20,
          height: 0,
        ),
        InkButton(
          icon: Icons.add,
          color: Colors.white,
          backgroundColor: Colors.pinkAccent,
          padding: 5.0,
        ),
        Container(
          width: 20,
          height: 0,
        ),
        InkButton(icon: Icons.show_chart),
      ],
    );
  }
}

class InkButton extends StatelessWidget {
  InkButton({
    this.icon,
    this.iconSize = 24.0,
    this.color = Colors.black54,
    this.backgroundColor = Colors.white,
    this.onPressed = null,
    this.padding = 0,
  });

  final IconData icon;
  final double iconSize;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(0, 0, 0, 0),
      child: Center(
        child: Ink(
          decoration: ShapeDecoration(
            color: backgroundColor,
            shape: CircleBorder(),
          ),
          padding: EdgeInsets.all(padding),
          child: IconButton(
            icon: Icon(icon),
            iconSize: iconSize,
            color: color,
            onPressed: onPressed == null ? () {} : onPressed,
          ),
        ),
      ),
    );
  }
}
