import 'dart:async';

import 'package:flutter/material.dart';
import 'package:together_mobile/util/size_config.dart';
import 'package:together_mobile/util/visibility/visibility_detector.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create and storёe the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    controller = VideoPlayerController.network(
      'https://raw.githubusercontent.com/mikhail-stepanov/together-mobile/master/assets/videos/together_ny.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = controller.initialize();

    // Use the controller to loop the video.
    controller.setLooping(false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: Key("unique key"),
        onVisibilityChanged: (VisibilityInfo info) {
          debugPrint("${info.visibleFraction} of my widget is visible");
          if (info.visibleFraction == 0) {
            controller.pause();
          } else {
            controller.play();
          }
        },
        child: Scaffold(
          // Use a FutureBuilder to display a loading spinner while waiting for the
          // VideoPlayerController to finish initializing.
          body: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return AspectRatio(
                  aspectRatio: SizeConfig.width(17.4) / SizeConfig.height(8),
                  // Use the VideoPlayer widget to display the video.
                  child: VideoPlayer(controller),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Color(0xFF231F20),
                ));
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0x00231F20),
            onPressed: () {
              // Wrap the play or pause in a call to `setState`. This ensures the
              // correct icon is shown.
              setState(() {
                // If the video is playing, pause it.
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  // If the video is paused, play it.
                  controller.play();
                }
              });
            },
            // Display the correct icon depending on the state of the player.
            child: Icon(
              controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Color(0xFF231F20),
            ),
          ), // T
        ));
  }
}
