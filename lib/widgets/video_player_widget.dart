import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  final bool autoPlay;
  final bool looping;

  const VideoPlayerWidget({
    super.key,
    required this.url,
    this.autoPlay = true,
    this.looping = false,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget>
    with WidgetsBindingObserver {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      if (widget.url.trim().isEmpty) {
        throw Exception("Video URL is empty");
      }

      await WakelockPlus.enable();

      _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.url),
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: false,
          allowBackgroundPlayback: false,
        ),
      );

      await _videoPlayerController!.initialize();

      await _videoPlayerController!.setLooping(widget.looping);

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: widget.autoPlay,
        looping: widget.looping,

        // UX
        allowFullScreen: true,
        allowMuting: true,
        allowPlaybackSpeedChanging: true,
        showControls: true,
        showControlsOnInitialize: true,
        hideControlsTimer: const Duration(seconds: 3),

        // Device orientations
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
        ],

        deviceOrientationsOnEnterFullScreen: [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],

        // Better progress colors
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
          bufferedColor: Colors.grey,
          backgroundColor: Colors.white24,
        ),

        // Placeholder while buffering
        placeholder: Container(
          color: Colors.black,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
        ),

        // Error builder
        errorBuilder: (context, errorMessage) {
          return Container(
            color: Colors.black,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  errorMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },

        // Playback speeds
        playbackSpeeds: const [
          0.5,
          1.0,
          1.25,
          1.5,
          1.75,
          2.0,
        ],

        // Fullscreen styling
        fullScreenByDefault: false,

        // Prevent sleep
        allowedScreenSleep: false,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          hasError = true;
          isLoading = false;
          errorMessage = e.toString();
        });
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_videoPlayerController == null) return;

    if (state == AppLifecycleState.paused) {
      _videoPlayerController!.pause();
    }
  }

  Future<void> _retry() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    await _videoPlayerController?.dispose();
    _chewieController?.dispose();

    _videoPlayerController = null;
    _chewieController = null;

    await _initializePlayer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    WakelockPlus.disable();

    _videoPlayerController?.dispose();
    _chewieController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.black,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
        ),
      );
    }

    if (hasError) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                const SizedBox(height: 15),
                const Text(
                  'Failed to load video',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _retry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Retry',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio:
            _videoPlayerController!.value.aspectRatio == 0
                ? 16 / 9
                : _videoPlayerController!.value.aspectRatio,
        child: Chewie(
          controller: _chewieController!,
        ),
      ),
    );
  }
}