import 'package:flutter/material.dart';
import '../models/channel_model.dart';
import '../screens/stream_screen.dart';
import '../services/stream_service.dart';
import '../widgets/channel_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Channel> channels = StreamService().getChannels();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                child: Row(
                  children: [
                    const Text(
                      'AZAMTV',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFE50914),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1C1C),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?q=80&w=1200&auto=format&fit=crop',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'WORLD CUP LIVE',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE50914),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => StreamScreen(
                                  channel: channels.first,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('Watch Now'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Live Channels',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                height: 240,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: channels.length,
                  itemBuilder: (context, index) {
                    final channel = channels[index];

                    return ChannelCard(
                      channel: channel,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StreamScreen(channel: channel),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: const BoxDecoration(
          color: Color(0xFF181818),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home, color: Color(0xFFE50914)),
            Icon(Icons.live_tv, color: Colors.white54),
            Icon(Icons.favorite_border, color: Colors.white54),
            Icon(Icons.person_outline, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}