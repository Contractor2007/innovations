import 'package:flutter/material.dart';

import '../models/channel_model.dart';
import '../screens/profile_screen.dart';
import '../screens/stream_screen.dart';
import '../services/channel_service.dart';
import '../widgets/channel_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ChannelService _channelService =
      ChannelService();

  // AZAM TV COLORS
  static const Color primaryBlue =
      Color(0xFF00AEEF);

  static const Color darkBlue =
      Color(0xFF061C3D);

  static const Color cardBlue =
      Color(0xFF0B2B5B);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: darkBlue,

      body: SafeArea(
        child: StreamBuilder<List<Channel>>(
          stream:
              _channelService.subscribeChannels(),

          builder: (context, snapshot) {

            // LOADING
            if (snapshot.connectionState ==
                ConnectionState.waiting) {

              return const Center(
                child:
                    CircularProgressIndicator(
                  color: primaryBlue,
                ),
              );
            }

            // ERROR
            if (snapshot.hasError) {

              return Center(
                child: Text(
                  snapshot.error.toString(),

                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            }

            // DATA
            final channels =
                snapshot.data ?? [];

            // EMPTY
            if (channels.isEmpty) {

              return const Center(
                child: Text(
                  'No channels available',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              );
            }

            // GROUP CHANNELS BY CATEGORY
            final Map<String, List<Channel>>
                groupedChannels = {};

            for (final channel in channels) {

              final category =
                  channel.category
                          .trim()
                          .isEmpty
                      ? 'Other'
                      : channel.category;

              groupedChannels.putIfAbsent(
                category,
                () => [],
              );

              groupedChannels[category]!
                  .add(channel);
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  // HEADER
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),

                    child: Row(
                      children: [

                        // LOGO
                        Row(
                          children: [

                            Container(
                              width: 14,
                              height: 34,

                              decoration:
                                  BoxDecoration(
                                color: primaryBlue,

                                borderRadius:
                                    BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 10,
                            ),

                            const Text(
                              'AZAMTV',

                              style: TextStyle(
                                fontSize: 30,
                                fontWeight:
                                    FontWeight
                                        .w900,

                                color:
                                    Colors.white,

                                letterSpacing:
                                    1.3,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        // SEARCH
                        Container(
                          padding:
                              const EdgeInsets.all(
                            12,
                          ),

                          decoration:
                              BoxDecoration(
                            color: Colors.white
                                .withOpacity(
                              0.08,
                            ),

                            borderRadius:
                                BorderRadius.circular(
                              14,
                            ),
                          ),

                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // FEATURED HERO SECTION
                  Container(
                    margin:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),

                    height: 260,

                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(
                        32,
                      ),

                      image: DecorationImage(
                        image: NetworkImage(
                          channels.first
                              .thumbnailUrl,
                        ),

                        fit: BoxFit.cover,
                      ),

                      boxShadow: [

                        BoxShadow(
                          color: primaryBlue
                              .withOpacity(0.22),

                          blurRadius: 24,
                          spreadRadius: 2,
                        ),
                      ],
                    ),

                    child: Container(
                      padding:
                          const EdgeInsets.all(
                        24,
                      ),

                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(
                          32,
                        ),

                        gradient:
                            LinearGradient(
                          begin:
                              Alignment
                                  .bottomCenter,

                          end: Alignment
                              .topCenter,

                          colors: [

                            Colors.black
                                .withOpacity(
                              0.98,
                            ),

                            darkBlue
                                .withOpacity(
                              0.4,
                            ),

                            Colors.transparent,
                          ],
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        mainAxisAlignment:
                            MainAxisAlignment
                                .end,

                        children: [

                          // LIVE BADGE
                          Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 7,
                            ),

                            decoration:
                                BoxDecoration(
                              color:
                                  primaryBlue,

                              borderRadius:
                                  BorderRadius.circular(
                                30,
                              ),
                            ),

                            child: const Text(
                              'LIVE NOW',

                              style:
                                  TextStyle(
                                color:
                                    Colors.white,

                                fontWeight:
                                    FontWeight
                                        .bold,

                                fontSize: 12,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 14,
                          ),

                          // CHANNEL NAME
                          Text(
                            channels.first.name,

                            style:
                                const TextStyle(
                              fontSize: 34,
                              fontWeight:
                                  FontWeight
                                      .bold,

                              color:
                                  Colors.white,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          // DESCRIPTION
                          Text(
                            channels
                                .first
                                .description,

                            maxLines: 2,

                            overflow:
                                TextOverflow
                                    .ellipsis,

                            style: TextStyle(
                              color: Colors
                                  .white
                                  .withOpacity(
                                0.74,
                              ),

                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(
                            height: 22,
                          ),

                          // WATCH BUTTON
                          ElevatedButton.icon(
                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  primaryBlue,

                              foregroundColor:
                                  Colors.white,

                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal:
                                    22,

                                vertical: 15,
                              ),

                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                  16,
                                ),
                              ),
                            ),

                            onPressed: () {

                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (_) =>
                                      StreamScreen(
                                    channel:
                                        channels
                                            .first,
                                  ),
                                ),
                              );
                            },

                            icon: const Icon(
                              Icons.play_arrow,
                            ),

                            label: const Text(
                              'Watch Now',

                              style:
                                  TextStyle(
                                fontWeight:
                                    FontWeight
                                        .bold,

                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 36),

                  // CATEGORY SECTIONS
                  ...groupedChannels.entries.map(
                    (entry) {

                      final category =
                          entry.key;

                      final categoryChannels =
                          entry.value;

                      return Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          // CATEGORY HEADER
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),

                            child: Row(
                              children: [

                                Text(
                                  category,

                                  style:
                                      const TextStyle(
                                    fontSize:
                                        22,

                                    fontWeight:
                                        FontWeight
                                            .bold,

                                    color:
                                        Colors
                                            .white,
                                  ),
                                ),

                                const SizedBox(
                                  width: 10,
                                ),

                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(
                                    horizontal:
                                        10,

                                    vertical:
                                        4,
                                  ),

                                  decoration:
                                      BoxDecoration(
                                    color:
                                        primaryBlue,

                                    borderRadius:
                                        BorderRadius.circular(
                                      20,
                                    ),
                                  ),

                                  child: Text(
                                    '${categoryChannels.length}',

                                    style:
                                        const TextStyle(
                                      fontSize:
                                          12,

                                      fontWeight:
                                          FontWeight
                                              .bold,

                                      color:
                                          Colors
                                              .white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 18,
                          ),

                          // CHANNEL LIST
                          SizedBox(
                            height: 240,

                            child:
                                ListView.builder(
                              scrollDirection:
                                  Axis.horizontal,

                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal:
                                    20,
                              ),

                              itemCount:
                                  categoryChannels
                                      .length,

                              itemBuilder:
                                  (
                                context,
                                index,
                              ) {

                                final channel =
                                    categoryChannels[
                                        index];

                                return ChannelCard(
                                  channel:
                                      channel,

                                  onTap: () {

                                    Navigator.push(
                                      context,

                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                StreamScreen(
                                          channel:
                                              channel,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),

                          const SizedBox(
                            height: 34,
                          ),
                        ],
                      );
                    },
                  ).toList(),

                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.symmetric(
          vertical: 14,
        ),

        decoration: BoxDecoration(
          color: cardBlue,

          border: Border(
            top: BorderSide(
              color: Colors.white
                  .withOpacity(0.08),
            ),
          ),
        ),

        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,

          children: [

            // LIVE TV
            Column(
              mainAxisSize:
                  MainAxisSize.min,

              children: const [

                Icon(
                  Icons.live_tv,
                  color: primaryBlue,
                ),

                SizedBox(height: 4),

                Text(
                  'Live TV',

                  style: TextStyle(
                    color: primaryBlue,
                    fontSize: 12,
                    fontWeight:
                        FontWeight.w600,
                  ),
                ),
              ],
            ),

            // PROFILE
            GestureDetector(
              onTap: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (_) =>
                        const ProfileScreen(),
                  ),
                );
              },

              child: Column(
                mainAxisSize:
                    MainAxisSize.min,

                children: const [

                  Icon(
                    Icons.person_outline,
                    color: Colors.white70,
                  ),

                  SizedBox(height: 4),

                  Text(
                    'Profile',

                    style: TextStyle(
                      color:
                          Colors.white70,

                      fontSize: 12,

                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}