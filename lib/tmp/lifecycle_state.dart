import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  String name;
  int age;

  MyApp(this.name, this.age);

  @override
  State<StatefulWidget> createState() {
    print("abc");
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  String _username = "";
  String _password = "";
  final usernameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

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
    usernameEditingController.dispose();
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
    print('build');
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: usernameEditingController,
                          onChanged: (text){
                            this.setState(() {
                              _username = text;
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
                          controller: passwordEditingController,
                          onChanged: (text){
                            this.setState(() {
                              _password = text;
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
                  Text(
                    'Username = ${_username}, age = ${_password}',
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                ]
            )
        ),
        appBar: AppBar(
          title: Text("My first app"),
        ),
      ),
    );
  }
}