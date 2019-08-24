import 'package:flutter/material.dart';
import 'azure_functions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestDrive',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic _valueFromServer = 0;

  void _getResultFromServer() async {
    String res = await azureFunction("TriggerTest", body: {'chave': 'numero'});
    if(res.isEmpty) {
      setState((){
        _valueFromServer = -1;
      });
      return;
    }
    setState(() {
      _valueFromServer = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click the alarm button',
            ),
            Text(
              'result: $_valueFromServer',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getResultFromServer,
        tooltip: 'Get Result',
        child: Icon(Icons.alarm),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
