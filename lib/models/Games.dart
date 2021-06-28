// To parse this JSON data, do
//
//     final gameData = gameDataFromJson(jsonString);

import 'dart:convert';

List<GameData> gameDataFromJson(str) =>
    List<GameData>.from((str).map((x) => GameData.fromJson(x)));

String gameDataToJson(List<GameData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GameData {
  GameData({
    this.gameName,
    this.details,
    this.parentCardHex,
  });

  String gameName;
  List<Detail> details;
  String parentCardHex;

  factory GameData.fromJson(Map<String, dynamic> json) => GameData(
        gameName: json["game_name"],
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
        parentCardHex: json["parent_card_hex"],
      );

  Map<String, dynamic> toJson() => {
        "game_name": gameName,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
        "parent_card_hex": parentCardHex,
      };
}

class Detail {
  Detail({
    this.name,
    this.category,
    this.file,
    this.allAccessPassOnly,
    this.gamelink,
  });

  String name;
  String category;
  dynamic file;
  bool allAccessPassOnly;
  String gamelink;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        name: json["name"],
        category: json["category"],
        file: json["file"],
        allAccessPassOnly: json["all_access_pass_only"],
        gamelink: json["gamelink"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "file": file,
        "all_access_pass_only": allAccessPassOnly,
        "gamelink": gamelink,
      };
}

class FileClass {
  FileClass({
    this.id,
    this.fileId,
    this.title,
    this.filename,
    this.filesize,
    this.url,
    this.link,
    this.alt,
    this.author,
    this.description,
    this.caption,
    this.name,
    this.status,
    this.uploadedTo,
    this.date,
    this.modified,
    this.menuOrder,
    this.mimeType,
    this.type,
    this.subtype,
    this.icon,
  });

  int id;
  int fileId;
  String title;
  String filename;
  int filesize;
  String url;
  String link;
  String alt;
  String author;
  String description;
  String caption;
  String name;
  Status status;
  int uploadedTo;
  DateTime date;
  DateTime modified;
  int menuOrder;
  MimeType mimeType;
  Type type;
  Subtype subtype;
  String icon;

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        id: json["ID"],
        fileId: json["id"],
        title: json["title"],
        filename: json["filename"],
        filesize: json["filesize"],
        url: json["url"],
        link: json["link"],
        alt: json["alt"],
        author: json["author"],
        description: json["description"],
        caption: json["caption"],
        name: json["name"],
        status: statusValues.map[json["status"]],
        uploadedTo: json["uploaded_to"],
        date: DateTime.parse(json["date"]),
        modified: DateTime.parse(json["modified"]),
        menuOrder: json["menu_order"],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        type: typeValues.map[json["type"]],
        subtype: subtypeValues.map[json["subtype"]],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "id": fileId,
        "title": title,
        "filename": filename,
        "filesize": filesize,
        "url": url,
        "link": link,
        "alt": alt,
        "author": author,
        "description": description,
        "caption": caption,
        "name": name,
        "status": statusValues.reverse[status],
        "uploaded_to": uploadedTo,
        "date": date.toIso8601String(),
        "modified": modified.toIso8601String(),
        "menu_order": menuOrder,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "type": typeValues.reverse[type],
        "subtype": subtypeValues.reverse[subtype],
        "icon": icon,
      };
}

enum MimeType { APPLICATION_ZIP }

final mimeTypeValues =
    EnumValues({"application/zip": MimeType.APPLICATION_ZIP});

enum Status { INHERIT }

final statusValues = EnumValues({"inherit": Status.INHERIT});

enum Subtype { ZIP }

final subtypeValues = EnumValues({"zip": Subtype.ZIP});

enum Type { APPLICATION }

final typeValues = EnumValues({"application": Type.APPLICATION});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
