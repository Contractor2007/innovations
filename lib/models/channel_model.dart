class Channel {
  final String id;
  final String name;
  final String description;
  final String streamUrl;
  final String thumbnailUrl;
  final String category;
  final int viewerCount;
  final bool isLive;

  const Channel({
    required this.id,
    required this.name,
    required this.description,
    required this.streamUrl,
    required this.thumbnailUrl,
    required this.category,
    required this.viewerCount,
    required this.isLive,
  });

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      streamUrl: map['stream_url'] ?? '',
      thumbnailUrl: map['thumbnail_url'] ?? '',
      category: map['category'] ?? '',
      viewerCount: map['viewer_count'] ?? 0,
      isLive: map['is_live'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'stream_url': streamUrl,
      'thumbnail_url': thumbnailUrl,
      'category': category,
      'viewer_count': viewerCount,
      'is_live': isLive,
    };
  }
}