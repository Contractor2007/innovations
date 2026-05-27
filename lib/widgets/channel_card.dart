import 'package:flutter/material.dart';
import '../models/channel_model.dart';

class ChannelCard extends StatelessWidget {
  final Channel channel;
  final VoidCallback onTap;

  const ChannelCard({
    super.key,
    required this.channel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        image: NetworkImage(channel.thumbnailUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE50914),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'LIVE',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              channel.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${channel.viewerCount} watching',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}