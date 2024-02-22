import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  const VideoItem(
      {super.key,
      required this.videoUrl,
      required this.looping,
      required this.subtitleUrl});
  final String videoUrl;
  final bool looping;
  final String subtitleUrl;
  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late ChewieController _chewieController;
  late SubtitleController _subtitleController;
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse((widget.videoUrl)));
    _videoPlayerController.setPlaybackSpeed(2);
    _chewieController = chewieController;
    _subtitleController = SubtitleController(
      subtitleUrl: widget.subtitleUrl,
      subtitleDecoder: SubtitleDecoder.utf8,
    );
  }

  VideoPlayerController get videoPlayerController {
    return _videoPlayerController;
  }

  ChewieController get chewieController {
    return ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoInitialize: true,
      autoPlay: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: ColoredBox(
        color: const Color(
          0xff161a1d,
        ),
        child: SubtitleWrapper(
          videoPlayerController: _chewieController.videoPlayerController,
          subtitleController: _subtitleController,
          subtitleStyle: const SubtitleStyle(
            textColor: Colors.white,
            hasBorder: true,
          ),
          videoChild: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();

    _chewieController.dispose();
    super.dispose();
  }
}
