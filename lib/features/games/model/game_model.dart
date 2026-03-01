class GameModel {
  final String id;
  final String title;
  final String imageUrl;
  final int level;
  final int stars;

  const GameModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.level = 1,
    this.stars = 0,
  });

  GameModel copyWith({
    String? id,
    String? title,
    String? imageUrl,
    int? level,
    int? stars,
  }) {
    return GameModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      level: level ?? this.level,
      stars: stars ?? this.stars,
    );
  }
}
