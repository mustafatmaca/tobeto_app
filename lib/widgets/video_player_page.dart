import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;
  final String title;

  VideoPlayerPage({required this.videoUrl, required this.title});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late final VideoPlayerController _controller =
      VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

  String _durationString = '';

  @override
  void initState() {
    super.initState();
    _controller
      ..addListener(_videoListener) // silindiğinde loopda kalıyor.
      ..setLooping(false) //video bittiğinde tekrarlanmamasını sağlar.
      ..initialize();
  }

  void _videoListener() {
    if (!mounted)
      return; // Eğer widget artık ekran üzerinde değilse güncelleme yapma
    setState(() {
      _durationString = _getDurationString();
    });
  }

  String _getDurationString() {
    Duration position = _controller.value.position;
    Duration duration = _controller.value.duration;
    return (position == null || duration == null)
        ? ''
        : '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: _controller.value.isInitialized
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      SizedBox(height: 16.0),
                      Text(_durationString),
                      VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: Color(0xFF341132),
                          bufferedColor: Colors.white,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ],
                  )
                : CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.replay_10),
                onPressed: () {
                  _controller.seekTo(
                    Duration(
                      seconds: _controller.value.position.inSeconds - 10,
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.forward_10),
                onPressed: () {
                  _controller.seekTo(
                    Duration(
                      seconds: _controller.value.position.inSeconds + 10,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
