import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  DateTime date = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    print(date);
    return MaterialApp(
      title: 'demo app ',
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'date time \n ${DateFormat('dd-MM-yy').format(date)}',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 65, 184, 28)),
            ),
          ],
        )),
      ),
    );
  }
}
