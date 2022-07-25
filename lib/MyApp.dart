import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Transaction.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  DateTime date = new DateTime.now();
  // String _content = '';
  // double _price = 0;
  Transaction _transaction = Transaction(content: '', price: 0.0);

  List<Transaction> _transactions = List<Transaction>.empty(growable: true);

  final _contentController = TextEditingController();
  final _priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo app ',
      home: SafeArea(
        child: Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'date time \n ${DateFormat('dd-MM-yy').format(date)}',
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 65, 184, 28)),
              ),
              TextField(
                  decoration: InputDecoration(labelText: 'Content'),
                  controller: _contentController,
                  onChanged: (value) {
                    setState(() {
                      _transaction.content = value;
                    });
                  }),
              TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _priceController,
                  onChanged: (value) {
                    setState(() {
                      _transaction.price = double.tryParse(value) ?? 0;
                    });
                  }),
              FlatButton(
                onPressed: (() {
                  print('${_transaction.content} - ${_transaction.price}');
                  setState(() {
                    print('vao trong setState');
                    print('=============${_transaction}');
                    _transactions.add(_transaction);
                    // _transactions =  Transaction(content: '', price: 0.0);
                    // _transaction.content = '';
                    // _transaction.price = 0.0;
                  });
                }),
                child: Text('Insert Transaction'),
                color: Colors.greenAccent,
                textColor: Colors.white,
              ),
              // Column(children: <Widget>[
              //   _transactions.map((e) {
              //     return ListTile(
              //       leading: Icon(Icons.abc),
              //       title: Text('asdfasd'),
              //     );
              //   }).toList(),
              // ]),
              Container(
                child: Column(
                  children: _transactions
                      .map((e) => new ListTile(
                            leading: Icon(Icons.accessibility_new),
                            title: Text('${e.content}'),
                            subtitle: Text('${e.price}'),
                            textColor: Colors.black,
                            onTap: () {
                              print('da tap');
                            },
                          ))
                      .toList(),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
