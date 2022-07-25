import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   String name;
//   int age;
//   MyApp({this.name = '', this.age = 0});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'demo',
//       home: Scaffold(
//         body: Center(
//             child: Text(
//           'hello : ${this.name} , ${this.age}',
//           style: TextStyle(
//               fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
//           textDirection: TextDirection.ltr,
//         )),
//       ),
//     );
//   }
// }
class MyApp extends StatefulWidget {
  String name;
  int age;
  MyApp({this.name = '', this.age = 0});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String _email = '';
  final emailEditing = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo app ',
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextField(
                controller: emailEditing,
                onChanged: (value) => this.setState(() {
                  _email = value;
                }),
                decoration: InputDecoration(
                    labelText: 'Enter your email',
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
              ),
            ),
            Text(
              _email,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
            Text(
              'Name: ${widget.name}, age ${widget.age}',
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            Text(
              'Name: ${widget.name}, age ${widget.age}',
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ],
        )),
      ),
    );
  }
}
