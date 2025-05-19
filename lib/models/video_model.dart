class VideoModel {
  int? id;
  String videoPath;
  String title;
  String description;

  VideoModel({
    this.id,
    required this.videoPath,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'videoPath': videoPath,
      'title': title,
      'description': description,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'],
      videoPath: map['videoPath'],
      title: map['title'],
      description: map['description'],
    );
  }
}
