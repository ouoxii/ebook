class Story {
  final String topic;
  final String image;
  final String text;
  const Story({required this.topic, required this.image, required this.text});
  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      topic: json['topic'],
      image: json['Image'],
      text: json['description'],
    );
  }
}
