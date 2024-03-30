class Chiikawa {
  final String name;
  final String image;
  final String text;
  final String birthday;
  const Chiikawa(
      {required this.name,
      required this.image,
      required this.text,
      required this.birthday});
  factory Chiikawa.fromJson(Map<String, dynamic> json) {
    return Chiikawa(
      name: json['name'],
      image: json['Image'],
      text: json['description'],
      birthday: json['birthday'],
    );
  }
}
