import 'dart:convert';

class VideoResponse {
  VideoResponse({
    required this.id,
    required this.results,
  });

  int id;
  List<VideoInfo> results;

  factory VideoResponse.fromMap(Map<String, dynamic> json) => VideoResponse(
        id: json["id"],
        results: List<VideoInfo>.from(
            json["results"].map((x) => VideoInfo.fromMap(x))),
      );

  factory VideoResponse.fomJson(String str) =>
      VideoResponse.fromMap(json.decode(str));
}

class VideoInfo {
  VideoInfo({
    required this.name,
    required this.key,
    required this.site,
  });

  String name;
  String key;
  String site;

  factory VideoInfo.fromMap(Map<String, dynamic> json) => VideoInfo(
        name: json["name"],
        key: json["key"],
        site: json["site"],
      );
  factory VideoInfo.fromJson(String str) => VideoInfo.fromMap(json.decode(str));
}
