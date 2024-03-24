import 'package:flutter/material.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;
  final String title;

  VideoPlayerPage({required this.videoUrl, required this.title});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  bool fullscreen = false;
  VideoPlayerController videoPlayerController =
      VideoPlayerController.networkUrl(Uri());

  @override
  void initState() {
    super.initState();
    videoPlayerController
      ..addListener(_videoListener)
      ..initialize();
  }

  void _videoListener() {
    if (!mounted)
      return; // Eğer widget artık ekran üzerinde değilse güncelleme yapma
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullscreen == false
          ? AppBar(
              title: Text(widget.title),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                ValueListenableBuilder(
                  valueListenable: videoPlayerController,
                  builder: (context, VideoPlayerValue value, child) {
                    //Do Something with the value.
                    var duration = Duration(
                        milliseconds: value.position.inMilliseconds.round());

                    if (videoPlayerController.value.isCompleted) {
                      return Text("Tamamlandı");
                    }

                    return Text([duration.inMinutes, duration.inSeconds]
                        .map((seg) =>
                            seg.remainder(60).toString().padLeft(2, '0'))
                        .join(':'));
                  },
                ),
              ],
            )
          : null,
      body: Padding(
        padding: fullscreen
            ? EdgeInsets.zero
            : EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0),
        child: YoYoPlayer(
          autoPlayVideoAfterInit: false,
          aspectRatio: 16 / 9,
          url: widget.videoUrl,
          onVideoInitCompleted: (controller) {
            videoPlayerController = controller;
          },
          videoStyle: VideoStyle(
            progressIndicatorColors: VideoProgressColors(
                playedColor: Colors.purple,
                backgroundColor: Colors.black.withOpacity(0.3)),
            qualityStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.background,
                fontWeight: FontWeight.bold),
            forwardAndBackwardBtSize: MediaQuery.of(context).size.width * 0.05,
            actionBarBgColor: Colors.black.withOpacity(0.3),
            actionBarPadding: EdgeInsets.zero,
            forwardIcon: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.035,
              backgroundColor: Colors.black.withOpacity(0.3),
              child: Icon(
                Icons.forward_10,
                color: Theme.of(context).colorScheme.background,
                size: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
            backwardIcon: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.035,
              backgroundColor: Colors.black.withOpacity(0.3),
              child: Icon(
                Icons.replay_10,
                color: Theme.of(context).colorScheme.background,
                size: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
            playIcon: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.045,
              backgroundColor: Colors.black.withOpacity(0.3),
              child: Icon(
                Icons.play_arrow_rounded,
                color: Theme.of(context).colorScheme.background,
                size: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
            pauseIcon: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.045,
              backgroundColor: Colors.black.withOpacity(0.3),
              child: Icon(
                Icons.pause,
                color: Theme.of(context).colorScheme.background,
                size: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
            videoQualityPadding: EdgeInsets.all(4.0),
          ),
          videoLoadingStyle: const VideoLoadingStyle(
            loading: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Loading video..."),
                ],
              ),
            ),
          ),
          onFullScreen: (value) {
            setState(() {
              if (fullscreen != value) {
                fullscreen = value;
              }
            });
          },
        ),
      ),
    );
  }
}
