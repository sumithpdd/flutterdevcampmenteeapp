// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../widgets/video_item.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.videoId});
  final String videoId;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('Course Data - ${widget.videoId}'),
      ),
      body: const Material(
        child: Center(
          child: VideoItem(
            videoUrl:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            looping: false,
            subtitleUrl:
                'https://www.dropbox.com/scl/fi/j5f7x49xi77vrag3lf10q/Session-1-Flutter-UI-Renuka-Kelkar-Flutter-DevCamp-2024.txt?rlkey=3ojf5x004kn6e2qatfbxb3yoi&dl=0',
          ),
        ),
      ),
    );
  }
}
