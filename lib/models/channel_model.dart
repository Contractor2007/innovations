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
      id: map['id'],
      name: map['name'],
      description: map['description'],
      streamUrl: map['streamUrl'],
      thumbnailUrl: map['thumbnailUrl'],
      category: map['category'],
      viewerCount: map['viewerCount'],
      isLive: map['isLive'],
    );
  }
}