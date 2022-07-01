import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter-model.dart';
import 'counter-view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterModel>(create: (context) => CounterModel()),
        ChangeNotifierProvider<CongModel>(create: (context)=> CongModel()),
      ],
      child: MaterialApp(
        home: CounterView(),
      ),
    );
  }
}


