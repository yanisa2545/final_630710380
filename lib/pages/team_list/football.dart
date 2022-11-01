import 'package:flutter/material.dart';

class FootballListPage extends StatefulWidget{
  const FootballListPage({Key? key}) : super(key: key);

  @override
  _FootballListPageState createState() => _FootballListPageState();
}

class _FootballListPageState extends State<FootballListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20.0),
              Image.asset('assets/images/logo.jpg', width: 200.0,),
            ]

        ),

      ),
    );
  }
}

