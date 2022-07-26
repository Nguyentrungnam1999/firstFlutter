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

  final List<Transaction> _transactions = <Transaction>[];

  final _contentController = TextEditingController();
  final _priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ListView _buildWidgetList() {
      // int index = 0;
      return ListView.builder(
          itemCount: _transactions.length,
          itemBuilder: ((context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: (index - 1) % 2 == 0 ? Colors.green : Colors.teal,
              elevation: 10,
              child: ListTile(
                leading: const Icon(Icons.access_alarm),
                title: Text(
                  _transactions[index].content,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                subtitle: Text('Price: ${_transactions[index].price}',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                onTap: () {
                  print('You clicked: ${_transactions[index].content}');
                },
              ),
            );
          }));
    }

    return MaterialApp(
        title: "This is a StatefulWidget",
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Demo AppBar',
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              ),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            // key: _scaffoldKey,
            body: SafeArea(
              minimum: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Content'),
                    controller: _contentController,
                    onChanged: (text) {
                      setState(() {
                        _transaction.content = text;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount(money)'),
                    controller: _priceController,
                    onChanged: (text) {
                      setState(() {
                        _transaction.price =
                            double.tryParse(text) ?? 0; //if error, value = 0
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  ButtonTheme(
                    height: 50,
                    child: FlatButton(
                      child: Text(
                        'Insert Transaction',
                        style: const TextStyle(fontSize: 18),
                      ),
                      color: Colors.pinkAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          _transactions.add(_transaction);
                          _transaction = Transaction(content: '', price: 0.0);
                          _contentController.text = '';
                          _priceController.text = '';
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 500,
                    child: _buildWidgetList(),
                  )
                ],
              ),
            )));
  }
}
