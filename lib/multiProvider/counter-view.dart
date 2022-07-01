import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    final congModel = Provider.of<CongModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Counter Value is: ${counterModel.getCounter()}',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'Gia tri la : ${congModel.laySo()}',
              style: TextStyle(fontSize: 30.0),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => counterModel.incrementCounter(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 30),
          FloatingActionButton(
            onPressed: () => counterModel.decrementCounter(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 30),
          FloatingActionButton(
            onPressed: () => congModel.tangSo(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
