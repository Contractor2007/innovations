import 'package:flutter/material.dart';
import '../models/channel_model.dart';
import '../widgets/video_player_widget.dart';

class StreamScreen extends StatelessWidget {
  final Channel channel;

  const StreamScreen({
    super.key,
    required this.channel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayerWidget(
                  url: channel.streamUrl,
                ),
              ),

              const SizedBox(height: 22),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE50914),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'LIVE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${channel.viewerCount} watching',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Text(
                channel.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                channel.description,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.7),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton(Icons.favorite_border, 'Favorite'),
                  _buildButton(Icons.share, 'Share'),
                  _buildButton(Icons.cast, 'Cast'),
                  _buildButton(Icons.fullscreen, 'Fullscreen'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF1B1B1B),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}