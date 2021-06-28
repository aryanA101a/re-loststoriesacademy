// To parse this JSON data, do
//
//     final lessonsLists = lessonsListsFromJson(jsonString);

import 'dart:convert';

List<LessonsLists> lessonsListsFromJson(String str) => List<LessonsLists>.from(json.decode(str).map((x) => LessonsLists.fromJson(x)));

String lessonsListsToJson(List<LessonsLists> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonsLists {
    LessonsLists({
        this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.content,
        this.author,
        this.featuredMedia,
        this.commentStatus,
        this.pingStatus,
        this.template,
        this.acf,
        this.links,
    });

    int id;
    DateTime date;
    DateTime dateGmt;
    Guid guid;
    DateTime modified;
    DateTime modifiedGmt;
    String slug;
    StatusEnum status;
    Type type;
    String link;
    Guid title;
    Content content;
    int author;
    int featuredMedia;
    Status commentStatus;
    Status pingStatus;
    String template;
    dynamic acf;
    Links links;

    factory LessonsLists.fromJson(Map<String, dynamic> json) => LessonsLists(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: statusEnumValues.map[json["status"]],
        type: typeValues.map[json["type"]],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: statusValues.map[json["comment_status"]],
        pingStatus: statusValues.map[json["ping_status"]],
        template: json["template"],
        acf: json["ACF"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": statusEnumValues.reverse[status],
        "type": typeValues.reverse[type],
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": statusValues.reverse[commentStatus],
        "ping_status": statusValues.reverse[pingStatus],
        "template": template,
        "ACF": acf,
        "_links": links.toJson(),
    };
}

class AcfClass {
    AcfClass({
        this.contentType,
        this.accessType,
        this.embedFiles,
        this.uploadContentFile,
        this.lessonDescription,
        this.mediaType,
        this.videoUrl,
        this.audioFileUrls,
        this.videoFilesUrls,
    });

    String contentType;
    bool accessType;
    String embedFiles;
    String uploadContentFile;
    String lessonDescription;
    bool mediaType;
    String videoUrl;
    List<Url> audioFileUrls;
    List<Url> videoFilesUrls;

    factory AcfClass.fromJson(Map<String, dynamic> json) => AcfClass(
        contentType: json["content_type"],
        accessType: json["access_type"],
        embedFiles: json["embed_files"] == null ? null : json["embed_files"],
        uploadContentFile: json["upload_content_file"] == null ? null : json["upload_content_file"],
        lessonDescription: json["lesson_description"],
        mediaType: json["media_type"] == null ? null : json["media_type"],
        videoUrl: json["video_url"] == null ? null : json["video_url"],
        audioFileUrls: json["audio_file_urls"] == null ? null : List<Url>.from(json["audio_file_urls"].map((x) => Url.fromJson(x))),
        videoFilesUrls: json["video_files_urls"] == null ? null : List<Url>.from(json["video_files_urls"].map((x) => Url.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "content_type": contentType,
        "access_type": accessType,
        "embed_files": embedFiles == null ? null : embedFiles,
        "upload_content_file": uploadContentFile == null ? null : uploadContentFile,
        "lesson_description": lessonDescription,
        "media_type": mediaType == null ? null : mediaType,
        "video_url": videoUrl == null ? null : videoUrl,
        "audio_file_urls": audioFileUrls == null ? null : List<dynamic>.from(audioFileUrls.map((x) => x.toJson())),
        "video_files_urls": videoFilesUrls == null ? null : List<dynamic>.from(videoFilesUrls.map((x) => x.toJson())),
    };
}

class Url {
    Url({
        this.language,
        this.file,
    });

    Language language;
    String file;

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        language: languageValues.map[json["language"]],
        file: json["file"],
    );

    Map<String, dynamic> toJson() => {
        "language": languageValues.reverse[language],
        "file": file,
    };
}

enum Language { ENGLISH, HINDI, GUJARATI }

final languageValues = EnumValues({
    "English": Language.ENGLISH,
    "Gujarati": Language.GUJARATI,
    "Hindi": Language.HINDI
});

enum Status { OPEN, CLOSED }

final statusValues = EnumValues({
    "closed": Status.CLOSED,
    "open": Status.OPEN
});

class Content {
    Content({
        this.rendered,
        this.protected,
    });

    String rendered;
    bool protected;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
    };
}

class Guid {
    Guid({
        this.rendered,
    });

    String rendered;

    factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}

class Links {
    Links({
        this.self,
        this.collection,
        this.about,
        this.author,
        this.replies,
        this.versionHistory,
        this.predecessorVersion,
        this.wpAttachment,
        this.curies,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<Author> author;
    List<Author> replies;
    List<VersionHistory> versionHistory;
    List<PredecessorVersion> predecessorVersion;
    List<About> wpAttachment;
    List<Cury> curies;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: json["predecessor-version"] == null ? null : List<PredecessorVersion>.from(json["predecessor-version"].map((x) => PredecessorVersion.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history": List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "predecessor-version": predecessorVersion == null ? null : List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
    };
}

class About {
    About({
        this.href,
    });

    String href;

    factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Author {
    Author({
        this.embeddable,
        this.href,
    });

    bool embeddable;
    String href;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
    };
}

class Cury {
    Cury({
        this.name,
        this.href,
        this.templated,
    });

    Name name;
    Href href;
    bool templated;

    factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: nameValues.map[json["name"]],
        href: hrefValues.map[json["href"]],
        templated: json["templated"],
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "href": hrefValues.reverse[href],
        "templated": templated,
    };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
    "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name { WP }

final nameValues = EnumValues({
    "wp": Name.WP
});

class PredecessorVersion {
    PredecessorVersion({
        this.id,
        this.href,
    });

    int id;
    String href;

    factory PredecessorVersion.fromJson(Map<String, dynamic> json) => PredecessorVersion(
        id: json["id"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
    };
}

class VersionHistory {
    VersionHistory({
        this.count,
        this.href,
    });

    int count;
    String href;

    factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
    };
}

enum StatusEnum { PUBLISH }

final statusEnumValues = EnumValues({
    "publish": StatusEnum.PUBLISH
});

enum Type { STM_LESSONS }

final typeValues = EnumValues({
    "stm-lessons": Type.STM_LESSONS
});

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
