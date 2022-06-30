import 'package:flutter/material.dart';
import 'package:learning/text_field.dart';
class MyApp extends StatefulWidget {
  String name;
  int age;

  MyApp(this.name, this.age);

  @override
  State<StatefulWidget> createState() {
    print("abc");
    return _MyAppState(name, age);
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  String name= "";
  int age;
  _MyAppState(this.name, this.age);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _goods = "";
  double _price = 0;
  final goodsEditingController = TextEditingController(); // mỗi textfield cần có 1 controller
  final priceEditingController = TextEditingController();

  void  initState(){
    // run after constructor() run
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('run initState');

  }
  //after initState() the build() will be run
  // and everytime state change build() will be run again

  void dispose(){
    //
    super.dispose();
    priceEditingController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print('run dispose');
  }

  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused){
      print('app is in background mode'); // Khi app ở chế độ ko hiển thị trên màn hình
    }else if(state == AppLifecycleState.resumed){
      print('app is in foreground mode'); // khi app đang hiển thị trên màn hình
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          TextField(
                            controller: goodsEditingController,
                            onChanged: (text){
                              this.setState(() {
                                _goods = text;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(10)
                                ),
                              ),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            controller: priceEditingController,
                            onChanged: (text){
                              this.setState(() {
                                _price = double.tryParse(text) ?? 0; //if error, value = 0
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(10)
                                ),
                              ),
                              labelText: 'Enter your password',
                            ),
                          ),
                        ],
                      )
                  ),
                  FlatButton(
                      onPressed: (){
                        // print('pressed');
                        _scaffoldKey.currentState?.showSnackBar(
                            SnackBar(
                                content: Text('Goods name: $_goods, price = $_price'),
                              duration: Duration(seconds: 10),
                            )
                        );
                        // Scaffold.of(context).showSnackBar(
                        //
                        // );
                      },
                      child: Text(
                        'Submit'
                      ),
                    color: Colors.pinkAccent,
                    textColor: Colors.white,
                  ),
                  TF(name, age),
                ]
            )
        ),
      ),
    );
  }
}