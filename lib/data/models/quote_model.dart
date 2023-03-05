// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
  Quote({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    required this.lastItemIndex,
    required this.results,
  });

  int count;
  int totalCount;
  int page;
  int totalPages;
  int lastItemIndex;
  List<Result> results;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        count: json["count"],
        totalCount: json["totalCount"],
        page: json["page"],
        totalPages: json["totalPages"],
        lastItemIndex: json["lastItemIndex"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "totalCount": totalCount,
        "page": page,
        "totalPages": totalPages,
        "lastItemIndex": lastItemIndex,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  String id;
  String author;
  String content;
  List<Tag> tags;
  String authorSlug;
  int length;
  DateTime dateAdded;
  DateTime dateModified;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        author: json["author"],
        content: json["content"],
        tags: List<Tag>.from(json["tags"].map((x) => tagValues.map[x]!)),
        authorSlug: json["authorSlug"],
        length: json["length"],
        dateAdded: DateTime.parse(json["dateAdded"]),
        dateModified: DateTime.parse(json["dateModified"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "author": author,
        "content": content,
        "tags": List<dynamic>.from(tags.map((x) => tagValues.reverse[x])),
        "authorSlug": authorSlug,
        "length": length,
        "dateAdded":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "dateModified":
            "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
      };
}

enum Tag { SPORTS, HUMOROUS, COMPETITION, BUSINESS, FAMOUS_QUOTES }

final tagValues = EnumValues({
  "business": Tag.BUSINESS,
  "competition": Tag.COMPETITION,
  "famous-quotes": Tag.FAMOUS_QUOTES,
  "humorous": Tag.HUMOROUS,
  "sports": Tag.SPORTS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
