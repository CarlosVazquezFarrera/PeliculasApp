import 'dart:convert';

class Cast {
  Cast({
    required this.id,
    required this.adult,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.gender,
    this.knownForDepartment,
    this.profilePath,
    this.department,
  });

  bool? adult;
  int gender;
  int id;
  String? knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  String? department;

  String get fullProfilePath {
    return profilePath != null
        ? 'https://image.tmdb.org/t/p/w500/$profilePath'
        : 'https://www.servicioaltoque.online/uploads/services/foo.jpg';
  }

  factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
      );
}
