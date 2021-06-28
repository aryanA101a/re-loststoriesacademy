// To parse this JSON data, do
//
//     final getLessons = getLessonsFromJson(jsonString);

import 'dart:convert';

List<GetLessons> getLessonsFromJson(String str) => List<GetLessons>.from(json.decode(str).map((x) => GetLessons.fromJson(x)));

String getLessonsToJson(List<GetLessons> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetLessons {
    GetLessons({
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
    Status status;
    Type type;
    String link;
    Guid title;
    Content content;
    int author;
    int featuredMedia;
    CommentStatus commentStatus;
    PingStatus pingStatus;
    String template;
    Acf acf;
    Links links;

    factory GetLessons.fromJson(Map<String, dynamic> json) => GetLessons(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: statusValues.map[json["status"]],
        type: typeValues.map[json["type"]],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: commentStatusValues.map[json["comment_status"]],
        pingStatus: pingStatusValues.map[json["ping_status"]],
        template: json["template"],
        acf: Acf.fromJson(json["ACF"]),
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
        "status": statusValues.reverse[status],
        "type": typeValues.reverse[type],
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatusValues.reverse[commentStatus],
        "ping_status": pingStatusValues.reverse[pingStatus],
        "template": template,
        "ACF": acf.toJson(),
        "_links": links.toJson(),
    };
}

class Acf {
    Acf({
        this.contentType,
        this.accessType,
        this.mediaType,
        this.videoUrl,
        this.audioFileUrls,
        this.lessonDescription,
        this.embedFiles,
        this.uploadContentFile,
    });

    ContentType contentType;
    bool accessType;
    bool mediaType;
    String videoUrl;
    List<AudioFileUrl> audioFileUrls;
    String lessonDescription;
    String embedFiles;
    String uploadContentFile;

    factory Acf.fromJson(Map<String, dynamic> json) => Acf(
        contentType: contentTypeValues.map[json["content_type"]],
        accessType: json["access_type"],
        mediaType: json["media_type"] == null ? null : json["media_type"],
        videoUrl: json["video_url"] == null ? null : json["video_url"],
        audioFileUrls: json["audio_file_urls"] == null ? null : List<AudioFileUrl>.from(json["audio_file_urls"].map((x) => AudioFileUrl.fromJson(x))),
        lessonDescription: json["lesson_description"],
        embedFiles: json["embed_files"] == null ? null : json["embed_files"],
        uploadContentFile: json["upload_content_file"] == null ? null : json["upload_content_file"],
    );

    Map<String, dynamic> toJson() => {
        "content_type": contentTypeValues.reverse[contentType],
        "access_type": accessType,
        "media_type": mediaType == null ? null : mediaType,
        "video_url": videoUrl == null ? null : videoUrl,
        "audio_file_urls": audioFileUrls == null ? null : List<dynamic>.from(audioFileUrls.map((x) => x.toJson())),
        "lesson_description": lessonDescription,
        "embed_files": embedFiles == null ? null : embedFiles,
        "upload_content_file": uploadContentFile == null ? null : uploadContentFile,
    };
}

class AudioFileUrl {
    AudioFileUrl({
        this.language,
        this.file,
    });

    Language language;
    String file;

    factory AudioFileUrl.fromJson(Map<String, dynamic> json) => AudioFileUrl(
        language: languageValues.map[json["language"]],
        file: json["file"],
    );

    Map<String, dynamic> toJson() => {
        "language": languageValues.reverse[language],
        "file": file,
    };
}

enum Language { ENGLISH, GUJARATI, HINDI }

final languageValues = EnumValues({
    "English": Language.ENGLISH,
    "Gujarati": Language.GUJARATI,
    "Hindi": Language.HINDI
});

enum ContentType { MULTIPLE_AUDIO, EMBED }

final contentTypeValues = EnumValues({
    "Embed": ContentType.EMBED,
    "Multiple-audio": ContentType.MULTIPLE_AUDIO
});

enum CommentStatus { OPEN }

final commentStatusValues = EnumValues({
    "open": CommentStatus.OPEN
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
        this.wpAttachment,
        this.curies,
        this.predecessorVersion,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<Author> author;
    List<Author> replies;
    List<VersionHistory> versionHistory;
    List<About> wpAttachment;
    List<Cury> curies;
    List<PredecessorVersion> predecessorVersion;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
        predecessorVersion: json["predecessor-version"] == null ? null : List<PredecessorVersion>.from(json["predecessor-version"].map((x) => PredecessorVersion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history": List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
        "predecessor-version": predecessorVersion == null ? null : List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
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

enum PingStatus { CLOSED }

final pingStatusValues = EnumValues({
    "closed": PingStatus.CLOSED
});

enum Status { PUBLISH }

final statusValues = EnumValues({
    "publish": Status.PUBLISH
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
