class SourceModel {
  final String status;
  final List<Sources> sources;

  SourceModel({required this.status, required this.sources});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      status: json['status'],
      sources: (json['sources'] as List)
          .map((e) => Sources.fromJson(e))
          .toList(),
    );
  }
}

class Sources {
  String id;
  String name;

  Sources({required this.id, required this.name});

  factory Sources.fromJson(Map<String, dynamic> json) {
    return Sources(id: json["id"], name: json["name"]);
  }
}
