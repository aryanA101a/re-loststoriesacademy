// To parse this JSON data, do
//
//     final fourmList = fourmListFromJson(jsonString);

import 'dart:convert';

List<FourmList> fourmListFromJson(String str) => List<FourmList>.from(json.decode(str).map((x) => FourmList.fromJson(x)));

String fourmListToJson(List<FourmList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FourmList {
    FourmList({
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
        this.featuredMedia,
        this.parent,
        this.template,
        this.yoastHead,
        this.acf,
        this.links,
        this.embedded,
    });

    int id;
    DateTime date;
    DateTime dateGmt;
    Guid guid;
    DateTime modified;
    DateTime modifiedGmt;
    String slug;
    Status status;
    FourmListType type;
    String link;
    Guid title;
    Content content;
    int featuredMedia;
    int parent;
    String template;
    String yoastHead;
    bool acf;
    FourmListLinks links;
    Embedded embedded;

    factory FourmList.fromJson(Map<String, dynamic> json) => FourmList(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: statusValues.map[json["status"]],
        type: fourmListTypeValues.map[json["type"]],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        featuredMedia: json["featured_media"],
        parent: json["parent"],
        template: json["template"],
        yoastHead: json["yoast_head"],
        acf: json["ACF"],
        links: FourmListLinks.fromJson(json["_links"]),
        embedded: Embedded.fromJson(json["_embedded"]),
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
        "type": fourmListTypeValues.reverse[type],
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "featured_media": featuredMedia,
        "parent": parent,
        "template": template,
        "yoast_head": yoastHead,
        "ACF": acf,
        "_links": links.toJson(),
        "_embedded": embedded.toJson(),
    };
}

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

class Embedded {
    Embedded({
        this.wpFeaturedmedia,
    });

    List<WpFeaturedmedia> wpFeaturedmedia;

    factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
        wpFeaturedmedia: List<WpFeaturedmedia>.from(json["wp:featuredmedia"].map((x) => WpFeaturedmedia.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
    };
}

class WpFeaturedmedia {
    WpFeaturedmedia({
        this.id,
        this.date,
        this.slug,
        this.type,
        this.link,
        this.title,
        this.author,
        this.yoastHead,
        this.caption,
        this.altText,
        this.mediaType,
        this.mimeType,
        this.mediaDetails,
        this.sourceUrl,
        this.links,
    });

    int id;
    DateTime date;
    String slug;
    WpFeaturedmediaType type;
    String link;
    Guid title;
    int author;
    String yoastHead;
    Guid caption;
    String altText;
    MediaType mediaType;
    MimeType mimeType;
    MediaDetails mediaDetails;
    String sourceUrl;
    WpFeaturedmediaLinks links;

    factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) => WpFeaturedmedia(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        slug: json["slug"],
        type: wpFeaturedmediaTypeValues.map[json["type"]],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        author: json["author"],
        yoastHead: json["yoast_head"],
        caption: Guid.fromJson(json["caption"]),
        altText: json["alt_text"],
        mediaType: mediaTypeValues.map[json["media_type"]],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        mediaDetails: MediaDetails.fromJson(json["media_details"]),
        sourceUrl: json["source_url"],
        links: WpFeaturedmediaLinks.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "slug": slug,
        "type": wpFeaturedmediaTypeValues.reverse[type],
        "link": link,
        "title": title.toJson(),
        "author": author,
        "yoast_head": yoastHead,
        "caption": caption.toJson(),
        "alt_text": altText,
        "media_type": mediaTypeValues.reverse[mediaType],
        "mime_type": mimeTypeValues.reverse[mimeType],
        "media_details": mediaDetails.toJson(),
        "source_url": sourceUrl,
        "_links": links.toJson(),
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

class WpFeaturedmediaLinks {
    WpFeaturedmediaLinks({
        this.self,
        this.collection,
        this.about,
        this.author,
        this.replies,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<AuthorElement> author;
    List<AuthorElement> replies;

    factory WpFeaturedmediaLinks.fromJson(Map<String, dynamic> json) => WpFeaturedmediaLinks(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<AuthorElement>.from(json["author"].map((x) => AuthorElement.fromJson(x))),
        replies: List<AuthorElement>.from(json["replies"].map((x) => AuthorElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
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

class AuthorElement {
    AuthorElement({
        this.embeddable,
        this.href,
    });

    bool embeddable;
    String href;

    factory AuthorElement.fromJson(Map<String, dynamic> json) => AuthorElement(
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
    };
}

class MediaDetails {
    MediaDetails({
        this.width,
        this.height,
        this.file,
        this.sizes,
        this.imageMeta,
    });

    int width;
    int height;
    String file;
    Map<String, Size> sizes;
    ImageMeta imageMeta;

    factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        sizes: Map.from(json["sizes"]).map((k, v) => MapEntry<String, Size>(k, Size.fromJson(v))),
        imageMeta: ImageMeta.fromJson(json["image_meta"]),
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "sizes": Map.from(sizes).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "image_meta": imageMeta.toJson(),
    };
}

class ImageMeta {
    ImageMeta({
        this.aperture,
        this.credit,
        this.camera,
        this.caption,
        this.createdTimestamp,
        this.copyright,
        this.focalLength,
        this.iso,
        this.shutterSpeed,
        this.title,
        this.orientation,
        this.keywords,
    });

    String aperture;
    String credit;
    String camera;
    String caption;
    String createdTimestamp;
    String copyright;
    String focalLength;
    String iso;
    String shutterSpeed;
    String title;
    String orientation;
    List<dynamic> keywords;

    factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
        aperture: json["aperture"],
        credit: json["credit"],
        camera: json["camera"],
        caption: json["caption"],
        createdTimestamp: json["created_timestamp"],
        copyright: json["copyright"],
        focalLength: json["focal_length"],
        iso: json["iso"],
        shutterSpeed: json["shutter_speed"],
        title: json["title"],
        orientation: json["orientation"],
        keywords: List<dynamic>.from(json["keywords"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "orientation": orientation,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
    };
}

class Size {
    Size({
        this.file,
        this.width,
        this.height,
        this.mimeType,
        this.sourceUrl,
    });

    String file;
    int width;
    int height;
    MimeType mimeType;
    String sourceUrl;

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        sourceUrl: json["source_url"],
    );

    Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "source_url": sourceUrl,
    };
}

enum MimeType { IMAGE_PNG }

final mimeTypeValues = EnumValues({
    "image/png": MimeType.IMAGE_PNG
});

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({
    "image": MediaType.IMAGE
});

enum WpFeaturedmediaType { ATTACHMENT }

final wpFeaturedmediaTypeValues = EnumValues({
    "attachment": WpFeaturedmediaType.ATTACHMENT
});

class FourmListLinks {
    FourmListLinks({
        this.self,
        this.collection,
        this.about,
        this.versionHistory,
        this.wpFeaturedmedia,
        this.wpAttachment,
        this.curies,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<VersionHistory> versionHistory;
    List<AuthorElement> wpFeaturedmedia;
    List<About> wpAttachment;
    List<Cury> curies;

    factory FourmListLinks.fromJson(Map<String, dynamic> json) => FourmListLinks(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        versionHistory: List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
        wpFeaturedmedia: List<AuthorElement>.from(json["wp:featuredmedia"].map((x) => AuthorElement.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "version-history": List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
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

enum Status { PUBLISH }

final statusValues = EnumValues({
    "publish": Status.PUBLISH
});

enum FourmListType { FORUM }

final fourmListTypeValues = EnumValues({
    "forum": FourmListType.FORUM
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
