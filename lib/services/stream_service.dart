import '../models/channel_model.dart';

class StreamService {
  static final StreamService _instance = StreamService._internal();

  factory StreamService() {
    return _instance;
  }

  StreamService._internal();

  final List<Channel> _channels = [
    const Channel(
      id: '1',
      name: 'DW News',
      description: 'International news from Deutsche Welle',
      streamUrl: 'https://dwamdstream102.akamaized.net/hls/live/2015525/dwstream102/index.m3u8',
      thumbnailUrl: 'https://images.unsplash.com/photo-1504711434969-e33886168f5c?q=80&w=1200&auto=format&fit=crop',
      category: 'English News',
      viewerCount: 0,
      isLive: true,
    ),
    const Channel(
      id: '2',
      name: 'CNA News',
      description: 'Channel News Asia - Latest news and updates',
      streamUrl: 'https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index_5.m3u8',
      thumbnailUrl: 'https://images.unsplash.com/photo-1586339949916-3e9457bef6d3?q=80&w=1200&auto=format&fit=crop',
      category: 'English News',
      viewerCount: 0,
      isLive: true,
    ),
    const Channel(
      id: '3',
      name: 'FOX NEWS',
      description: '24/7 news coverage and analysis',
      streamUrl: 'https://fox-foxnewsnow-vizio.amagi.tv/playlist.m3u8',
      thumbnailUrl: 'https://images.unsplash.com/photo-1447420146891-3b09ae35bb47?q=80&w=1200&auto=format&fit=crop',
      category: 'English News',
      viewerCount: 0,
      isLive: true,
    ),
    const Channel(
      id: '4',
      name: 'Live Sports',
      description: 'Live sports coverage and events',
      streamUrl: 'https://starsportshindiii.pages.dev/index.m3u8',
      thumbnailUrl: 'https://images.unsplash.com/photo-1461896836934-bd45ba9cf2b7?q=80&w=1200&auto=format&fit=crop',
      category: 'Live Sports',
      viewerCount: 0,
      isLive: true,
    ),
    const Channel(
      id: '5',
      name: 'Live Sports HD',
      description: 'High definition live sports coverage',
      streamUrl: 'https://starsportshindiii.pages.dev/720p.m3u8',
      thumbnailUrl: 'https://images.unsplash.com/photo-1574629810360-7efbbe195018?q=80&w=1200&auto=format&fit=crop',
      category: 'Live Sports',
      viewerCount: 0,
      isLive: true,
    ),
    const Channel(
      id: '6',
      name: 'BBC News',
      description: 'Trusted news from the British Broadcasting Corporation',
      streamUrl: 'https://tplay.live/out/news/bbc-news/index.m3u8',
      thumbnailUrl: 'https://images.unsplash.com/photo-1586339949916-3e9457bef6d3?q=80&w=1200&auto=format&fit=crop',
      category: 'News',
      viewerCount: 0,
      isLive: true,
    ),
    const Channel(
      id: '7',
      name: 'Al Jazeera',
      description: 'Independent news from the Middle East and around the world',
      streamUrl: 'https://live-hls-web-aje-fa.thehlive.com/AJE/01.m3u8',
      thumbnailUrl: 'https://images.unsplash.com/photo-1504711434969-e33886168f5c?q=80&w=1200&auto=format&fit=crop',
      category: 'News',
      viewerCount: 0,
      isLive: true,
    ),
    const Channel(
      id: '8',
      name: 'FIFA Plus',
      description: 'Live football matches and highlights',
      streamUrl: 'https://cffda8ff.wurl.com/master/f36d25e7e52f1ba8d7e56eb859c636563214f541/U2Ftc3VuZy1nYl9GSUZBUGx1c3dvbWVuX0hMUw/playlist.m3u8',
      thumbnailUrl: 'https://images.unsplash.com/photo-1574629810360-7efbbe195018?q=80&w=1200&auto=format&fit=crop',
      category: 'Sports',
      viewerCount: 12450,
      isLive: true,
    ),
    const Channel(
      id: '9',
      name: 'Bein Sport Extra Espanyol',
      description: '24/7 sports coverage and analysis',
      streamUrl: 'https://dc1644a9jazgj.cloudfront.net/beIN_Sports_Xtra_Espanol.m3u8',
      thumbnailUrl: 'https://images.unsplash.com/photo-1461896836934-bd45ba9cf2b7?q=80&w=1200&auto=format&fit=crop',
      category: 'Sports',
      viewerCount: 15200,
      isLive: true,
    ),
    const Channel(
      id: '10',
      name: 'Africa Sport 24',
      description: 'Basketball games and highlights',
      streamUrl: 'https://africa24.vedge.infomaniak.com/livecast/ik:africa24sport/manifest.m3u8',
      thumbnailUrl: 'https://images.unsplash.com/photo-1546519638-68e109498ffc?q=80&w=1200&auto=format&fit=crop',
      category: 'Sports',
      viewerCount: 18900,
      isLive: true,
    ),
    const Channel(
      id: '11',
      name: 'Tbc 2',
      description: 'Music videos and live performances',
      streamUrl: 'https://stream-134630.castr.net/5fe35eae8c53540cab83659a/live_17ad3c50323511f08f79733d2dd68583/index.fmp4.m3u8',
      thumbnailUrl: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?q=80&w=1200&auto=format&fit=crop',
      category: 'Music',
      viewerCount: 5300,
      isLive: true,
    ),
  ];

  List<Channel> getChannels() {
    return _channels;
  }
}