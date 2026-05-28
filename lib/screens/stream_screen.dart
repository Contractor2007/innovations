import 'package:flutter/material.dart';
import '../models/channel_model.dart';
import '../widgets/video_player_widget.dart';

class StreamScreen extends StatelessWidget {
  final Channel channel;

  const StreamScreen({
    super.key,
    required this.channel,
  });

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

      body: CustomScrollView(
        slivers: [
          // APP BAR + VIDEO
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: darkBlue,
            elevation: 0,

            leading: Container(
              margin: const EdgeInsets.all(8),

              decoration: BoxDecoration(
                color:
                    Colors.black.withOpacity(
                  0.4,
                ),
                borderRadius:
                    BorderRadius.circular(14),
              ),

              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),

                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // VIDEO
                  VideoPlayerWidget(
                    url: channel.streamUrl,
                  ),

                  // OVERLAY
                  Container(
                    decoration:
                        BoxDecoration(
                      gradient:
                          LinearGradient(
                        begin:
                            Alignment
                                .bottomCenter,
                        end:
                            Alignment
                                .topCenter,
                        colors: [
                          darkBlue,
                          Colors.black
                              .withOpacity(
                            0.4,
                          ),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  // LIVE BADGE
                  Positioned(
                    top: 60,
                    right: 18,

                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),

                      decoration:
                          BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            BorderRadius.circular(
                          30,
                        ),
                      ),

                      child: const Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color:
                                Colors.white,
                            size: 10,
                          ),

                          SizedBox(
                            width: 6,
                          ),

                          Text(
                            'LIVE',
                            style:
                                TextStyle(
                              color: Colors
                                  .white,
                              fontWeight:
                                  FontWeight
                                      .bold,
                              fontSize:
                                  12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // CONTENT
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [
                  // CHANNEL NAME
                  Text(
                    channel.name,

                    style:
                        const TextStyle(
                      fontSize: 30,
                      fontWeight:
                          FontWeight.bold,
                      color:
                          Colors.white,
                    ),
                  ),

                  const SizedBox(
                    height: 14,
                  ),

                  // VIEWERS + CATEGORY
                  Row(
                    children: [
                      Icon(
                        Icons
                            .remove_red_eye_outlined,
                        color: Colors.white
                            .withOpacity(
                          0.7,
                        ),
                        size: 18,
                      ),

                      const SizedBox(
                        width: 6,
                      ),

                      Text(
                        '${channel.viewerCount} watching',

                        style: TextStyle(
                          color: Colors
                              .white
                              .withOpacity(
                            0.7,
                          ),
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(
                        width: 16,
                      ),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal:
                              12,
                          vertical: 5,
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

                        child: Text(
                          channel.category,

                          style:
                              const TextStyle(
                            color: Colors
                                .white,
                            fontWeight:
                                FontWeight
                                    .bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 26,
                  ),

                  // ACTION BUTTONS
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [
                      _buildButton(
                        Icons
                            .favorite_border,
                        'Favorite',
                      ),

                      _buildButton(
                        Icons.share,
                        'Share',
                      ),

                      _buildButton(
                        Icons.cast,
                        'Cast',
                      ),

                      _buildButton(
                        Icons.fullscreen,
                        'Fullscreen',
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 34,
                  ),

                  // DESCRIPTION CARD
                  Container(
                    width:
                        double.infinity,

                    padding:
                        const EdgeInsets.all(
                      22,
                    ),

                    decoration:
                        BoxDecoration(
                      color: cardBlue
                          .withOpacity(
                        0.6,
                      ),

                      borderRadius:
                          BorderRadius.circular(
                        28,
                      ),

                      border: Border.all(
                        color: Colors
                            .white
                            .withOpacity(
                          0.05,
                        ),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.info,
                              color:
                                  primaryBlue,
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            Text(
                              'About Channel',

                              style:
                                  TextStyle(
                                color: Colors
                                    .white,
                                fontSize:
                                    18,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 18,
                        ),

                        Text(
                          channel.description,

                          style:
                              TextStyle(
                            fontSize: 15,
                            color: Colors
                                .white
                                .withOpacity(
                              0.75,
                            ),
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // STREAM INFO CARD
                  Container(
                    width:
                        double.infinity,

                    padding:
                        const EdgeInsets.all(
                      22,
                    ),

                    decoration:
                        BoxDecoration(
                      color: Colors.white
                          .withOpacity(
                        0.04,
                      ),

                      borderRadius:
                          BorderRadius.circular(
                        28,
                      ),
                    ),

                    child: Column(
                      children: [
                        _buildInfoRow(
                          'Stream Quality',
                          'HD',
                        ),

                        const SizedBox(
                          height: 18,
                        ),

                        _buildInfoRow(
                          'Status',
                          'Online',
                        ),

                        const SizedBox(
                          height: 18,
                        ),

                        _buildInfoRow(
                          'Category',
                          channel.category,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    IconData icon,
    String label,
  ) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.all(16),

          decoration: BoxDecoration(
            color:
                Colors.white.withOpacity(
              0.06,
            ),

            borderRadius:
                BorderRadius.circular(
              20,
            ),

            border: Border.all(
              color: Colors.white
                  .withOpacity(0.04),
            ),
          ),

          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          label,

          style: TextStyle(
            fontSize: 12,
            color: Colors.white
                .withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(
    String title,
    String value,
  ) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,

      children: [
        Text(
          title,

          style: TextStyle(
            color: Colors.white
                .withOpacity(0.7),
            fontSize: 14,
          ),
        ),

        Text(
          value,

          style: const TextStyle(
            color: Colors.white,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ],
    );
  }
}