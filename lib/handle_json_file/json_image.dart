import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning/dto_image.dart';
import 'package:flutter/src/widgets/image.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'dbestech',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];
  late DtoImages responsedData ;
  List<Uint8List> byteImages = [];
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/images/Anivaytay.json');
    // final data = await json.decode(response);
    Map<String, dynamic> json = jsonDecode(response);
    // print(json.runtimeType);
    responsedData = DtoImages.fromJson(json);
    for(var i= 0; i<responsedData.assets.length; i++){
      byteImages.add(convertBase64Image(responsedData.assets[i].p));
    }

    // setState(() {
    //   _items = responsedData.assets;
    //   print("..number of items ${_items.length}");
    // });
  }


  @override
  Widget build(BuildContext context) {
    readJson();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'dbestech',
        ),
      ),
      body: Image.memory(Uint8List.fromList(byteImages[0]))
    );
  }
}

Uint8List convertBase64Image(String base64String) {
  return Base64Decoder().convert(base64String.split(',').last);
}


// children: [
//   _items.isNotEmpty?Expanded(
//     child: ListView.builder(
//       itemCount: _items.length,
//       itemBuilder: (context, index) {
//         return Card(
//           key: ValueKey(_items[index]["id"]),
//           margin: const EdgeInsets.all(10),
//           color: Colors.amber.shade100,
//           child: ListTile(
//             leading: Text(_items[index]["id"]),
//             title: Text(_items[index]["name"]),
//             subtitle: Text(_items[index]["description"]),
//           ),
//         );
//       },
//     ),
//   ): ElevatedButton(
//       onPressed: () {
//         readJson();
//       },
//       child: Center(child: Text("Load Json")))
// ],