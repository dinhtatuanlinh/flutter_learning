import 'dart:io';


import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // VideoPlayerController? _controller;

  Future<String> getPath() async {
    var dir = await getApplicationDocumentsDirectory();
    var path = dir.path;
    return path;

  }
  @override
  void initState() {
    super.initState();

    // getPath().then((result){
    //   _controller = VideoPlayerController.file(File('$result/mat_moc.mp4'))
    //     ..initialize().then((_) {
    //       setState(() {});
    //       _controller?.play();
    //     });
    // });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPath(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          print(snapshot.data.runtimeType);
          return Directionality(
              textDirection: TextDirection.rtl,
              child: Text(snapshot.data)
        );
        }
        return Container();
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //
  //   return MaterialApp(
  //     title: 'Video Demo',
  //     home: Scaffold(
  //       body: Center(
  //         child: _controller != null ? _controller!.value.isInitialized // nếu _controller != null thì kiểm tra tiếp _controller!.value.isInitialized đã được init chưa
  //             ? AspectRatio( // nếu _controller!.value.isInitialized được init thì chay AspectRatio()
  //           aspectRatio: _controller!.value.aspectRatio,
  //           child: VideoPlayer(_controller!),
  //         )
  //             : Container() // nếu _controller!.value.isInitialized chưa chạy thì chạy container()
  //             : Container(),// nếu controller == null thì chạy container()
  //       ),
  //
  //       floatingActionButton: Column(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: <Widget>[
  //           FloatingActionButton(
  //             heroTag: Text("btn3"),
  //             onPressed: () {
  //               setState(() {
  //                 (_controller?.value.isPlaying ?? false)
  //                     ? _controller?.pause()
  //                     : _controller?.play();
  //               });
  //             },
  //             child: Icon(
  //               ( _controller?.value.isPlaying ?? false) ? Icons.pause : Icons.play_arrow,
  //             ),
  //           ),
  //           const SizedBox(height: 8),
  //
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
    // _controller?.dispose();
  }
}
