// To parse this JSON data, do
//
//     final podcastsList = podcastsListFromJson(jsonString);

import 'dart:convert';

List<PodcastsList> podcastsListFromJson(String str) => List<PodcastsList>.from(json.decode(str).map((x) => PodcastsList.fromJson(x)));

String podcastsListToJson(List<PodcastsList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PodcastsList {
    PodcastsList({
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
        this.template,
        this.yoastHead,
        this.yoastHeadJson,
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
    PodcastsListType type;
    String link;
    Guid title;
    Content content;
    int featuredMedia;
    String template;
    String yoastHead;
    PodcastsListYoastHeadJson yoastHeadJson;
    Acf acf;
    PodcastsListLinks links;
    Embedded embedded;

    factory PodcastsList.fromJson(Map<String, dynamic> json) => PodcastsList(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: statusValues.map[json["status"]],
        type: podcastsListTypeValues.map[json["type"]],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        featuredMedia: json["featured_media"],
        template: json["template"],
        yoastHead: json["yoast_head"],
        yoastHeadJson: PodcastsListYoastHeadJson.fromJson(json["yoast_head_json"]),
        acf: Acf.fromJson(json["ACF"]),
        links: PodcastsListLinks.fromJson(json["_links"]),
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
        "type": podcastsListTypeValues.reverse[type],
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "featured_media": featuredMedia,
        "template": template,
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson.toJson(),
        "ACF": acf.toJson(),
        "_links": links.toJson(),
        "_embedded": embedded.toJson(),
    };
}

class Acf {
    Acf({
        this.track,
        this.allAccessPassOnly,
        this.description,
    });

    List<Track> track;
    bool allAccessPassOnly;
    String description;

    factory Acf.fromJson(Map<String, dynamic> json) => Acf(
        track: List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
        allAccessPassOnly: json["all_access_pass_only"],
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toJson() => {
        "track": List<dynamic>.from(track.map((x) => x.toJson())),
        "all_access_pass_only": allAccessPassOnly,
        "description": description == null ? null : description,
    };
}

class Track {
    Track({
        this.language,
        this.trackFile,
    });

    Language language;
    String trackFile;

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        language: languageValues.map[json["language"]],
        trackFile: json["track_file"],
    );

    Map<String, dynamic> toJson() => {
        "language": languageValues.reverse[language],
        "track_file": trackFile,
    };
}

enum Language { ENGLISH, HINDI, GUJARATI, LANGUAGE_GUJARATI }

final languageValues = EnumValues({
    "English": Language.ENGLISH,
    "Gujarati": Language.GUJARATI,
    "Hindi": Language.HINDI,
    "Gujarati ": Language.LANGUAGE_GUJARATI
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
        this.yoastHeadJson,
        this.smush,
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
    PurpleType type;
    String link;
    Guid title;
    int author;
    String yoastHead;
    WpFeaturedmediaYoastHeadJson yoastHeadJson;
    Smush smush;
    Guid caption;
    String altText;
    MediaType mediaType;
    MimeTypeEnum mimeType;
    MediaDetails mediaDetails;
    String sourceUrl;
    WpFeaturedmediaLinks links;

    factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) => WpFeaturedmedia(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        slug: json["slug"],
        type: purpleTypeValues.map[json["type"]],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        author: json["author"],
        yoastHead: json["yoast_head"],
        yoastHeadJson: WpFeaturedmediaYoastHeadJson.fromJson(json["yoast_head_json"]),
        smush: Smush.fromJson(json["smush"]),
        caption: Guid.fromJson(json["caption"]),
        altText: json["alt_text"],
        mediaType: mediaTypeValues.map[json["media_type"]],
        mimeType: mimeTypeEnumValues.map[json["mime_type"]],
        mediaDetails: MediaDetails.fromJson(json["media_details"]),
        sourceUrl: json["source_url"],
        links: WpFeaturedmediaLinks.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "slug": slug,
        "type": purpleTypeValues.reverse[type],
        "link": link,
        "title": title.toJson(),
        "author": author,
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson.toJson(),
        "smush": smush.toJson(),
        "caption": caption.toJson(),
        "alt_text": altText,
        "media_type": mediaTypeValues.reverse[mediaType],
        "mime_type": mimeTypeEnumValues.reverse[mimeType],
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
    MediaDetailsSizes sizes;
    ImageMeta imageMeta;

    factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        sizes: MediaDetailsSizes.fromJson(json["sizes"]),
        imageMeta: ImageMeta.fromJson(json["image_meta"]),
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "sizes": sizes.toJson(),
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

class MediaDetailsSizes {
    MediaDetailsSizes({
        this.medium,
        this.thumbnail,
        this.img300225,
        this.img7575,
        this.full,
    });

    PurpleFull medium;
    PurpleFull thumbnail;
    PurpleFull img300225;
    PurpleFull img7575;
    PurpleFull full;

    factory MediaDetailsSizes.fromJson(Map<String, dynamic> json) => MediaDetailsSizes(
        medium: PurpleFull.fromJson(json["medium"]),
        thumbnail: PurpleFull.fromJson(json["thumbnail"]),
        img300225: PurpleFull.fromJson(json["img-300-225"]),
        img7575: PurpleFull.fromJson(json["img-75-75"]),
        full: PurpleFull.fromJson(json["full"]),
    );

    Map<String, dynamic> toJson() => {
        "medium": medium.toJson(),
        "thumbnail": thumbnail.toJson(),
        "img-300-225": img300225.toJson(),
        "img-75-75": img7575.toJson(),
        "full": full.toJson(),
    };
}

class PurpleFull {
    PurpleFull({
        this.file,
        this.width,
        this.height,
        this.mimeType,
        this.sourceUrl,
    });

    String file;
    int width;
    int height;
    MimeTypeEnum mimeType;
    String sourceUrl;

    factory PurpleFull.fromJson(Map<String, dynamic> json) => PurpleFull(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        mimeType: mimeTypeEnumValues.map[json["mime_type"]],
        sourceUrl: json["source_url"],
    );

    Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "mime_type": mimeTypeEnumValues.reverse[mimeType],
        "source_url": sourceUrl,
    };
}

enum MimeTypeEnum { IMAGE_JPEG }

final mimeTypeEnumValues = EnumValues({
    "image/jpeg": MimeTypeEnum.IMAGE_JPEG
});

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({
    "image": MediaType.IMAGE
});

class Smush {
    Smush({
        this.stats,
        this.sizes,
        this.webpFlag,
    });

    Stats stats;
    SmushSizes sizes;
    String webpFlag;

    factory Smush.fromJson(Map<String, dynamic> json) => Smush(
        stats: Stats.fromJson(json["stats"]),
        sizes: SmushSizes.fromJson(json["sizes"]),
        webpFlag: json["webp_flag"],
    );

    Map<String, dynamic> toJson() => {
        "stats": stats.toJson(),
        "sizes": sizes.toJson(),
        "webp_flag": webpFlag,
    };
}

class SmushSizes {
    SmushSizes({
        this.medium,
        this.thumbnail,
        this.img300225,
        this.img7575,
        this.full,
    });

    FluffyFull medium;
    FluffyFull thumbnail;
    FluffyFull img300225;
    FluffyFull img7575;
    FluffyFull full;

    factory SmushSizes.fromJson(Map<String, dynamic> json) => SmushSizes(
        medium: FluffyFull.fromJson(json["medium"]),
        thumbnail: FluffyFull.fromJson(json["thumbnail"]),
        img300225: FluffyFull.fromJson(json["img-300-225"]),
        img7575: FluffyFull.fromJson(json["img-75-75"]),
        full: FluffyFull.fromJson(json["full"]),
    );

    Map<String, dynamic> toJson() => {
        "medium": medium.toJson(),
        "thumbnail": thumbnail.toJson(),
        "img-300-225": img300225.toJson(),
        "img-75-75": img7575.toJson(),
        "full": full.toJson(),
    };
}

class FluffyFull {
    FluffyFull({
        this.percent,
        this.bytes,
        this.sizeBefore,
        this.sizeAfter,
        this.time,
    });

    double percent;
    int bytes;
    int sizeBefore;
    int sizeAfter;
    double time;

    factory FluffyFull.fromJson(Map<String, dynamic> json) => FluffyFull(
        percent: json["percent"].toDouble(),
        bytes: json["bytes"],
        sizeBefore: json["size_before"],
        sizeAfter: json["size_after"],
        time: json["time"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "percent": percent,
        "bytes": bytes,
        "size_before": sizeBefore,
        "size_after": sizeAfter,
        "time": time,
    };
}

class Stats {
    Stats({
        this.percent,
        this.bytes,
        this.sizeBefore,
        this.sizeAfter,
        this.time,
        this.apiVersion,
        this.lossy,
        this.keepExif,
    });

    double percent;
    int bytes;
    int sizeBefore;
    int sizeAfter;
    double time;
    String apiVersion;
    bool lossy;
    int keepExif;

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        percent: json["percent"].toDouble(),
        bytes: json["bytes"],
        sizeBefore: json["size_before"],
        sizeAfter: json["size_after"],
        time: json["time"].toDouble(),
        apiVersion: json["api_version"],
        lossy: json["lossy"],
        keepExif: json["keep_exif"],
    );

    Map<String, dynamic> toJson() => {
        "percent": percent,
        "bytes": bytes,
        "size_before": sizeBefore,
        "size_after": sizeAfter,
        "time": time,
        "api_version": apiVersion,
        "lossy": lossy,
        "keep_exif": keepExif,
    };
}

enum PurpleType { ATTACHMENT }

final purpleTypeValues = EnumValues({
    "attachment": PurpleType.ATTACHMENT
});

class WpFeaturedmediaYoastHeadJson {
    WpFeaturedmediaYoastHeadJson({
        this.title,
        this.robots,
        this.ogLocale,
        this.ogType,
        this.ogTitle,
        this.ogUrl,
        this.ogSiteName,
        this.articleModifiedTime,
        this.ogImage,
        this.twitterCard,
        this.schema,
    });

    String title;
    PurpleRobots robots;
    OgLocale ogLocale;
    OgType ogType;
    String ogTitle;
    String ogUrl;
    OgSiteName ogSiteName;
    DateTime articleModifiedTime;
    List<OgImage> ogImage;
    TwitterCard twitterCard;
    Schema schema;

    factory WpFeaturedmediaYoastHeadJson.fromJson(Map<String, dynamic> json) => WpFeaturedmediaYoastHeadJson(
        title: json["title"],
        robots: PurpleRobots.fromJson(json["robots"]),
        ogLocale: ogLocaleValues.map[json["og_locale"]],
        ogType: ogTypeValues.map[json["og_type"]],
        ogTitle: json["og_title"],
        ogUrl: json["og_url"],
        ogSiteName: ogSiteNameValues.map[json["og_site_name"]],
        articleModifiedTime: DateTime.parse(json["article_modified_time"]),
        ogImage: List<OgImage>.from(json["og_image"].map((x) => OgImage.fromJson(x))),
        twitterCard: twitterCardValues.map[json["twitter_card"]],
        schema: Schema.fromJson(json["schema"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "robots": robots.toJson(),
        "og_locale": ogLocaleValues.reverse[ogLocale],
        "og_type": ogTypeValues.reverse[ogType],
        "og_title": ogTitle,
        "og_url": ogUrl,
        "og_site_name": ogSiteNameValues.reverse[ogSiteName],
        "article_modified_time": articleModifiedTime.toIso8601String(),
        "og_image": List<dynamic>.from(ogImage.map((x) => x.toJson())),
        "twitter_card": twitterCardValues.reverse[twitterCard],
        "schema": schema.toJson(),
    };
}

class OgImage {
    OgImage({
        this.width,
        this.height,
        this.url,
        this.path,
        this.size,
        this.id,
        this.alt,
        this.pixels,
        this.type,
    });

    int width;
    int height;
    String url;
    String path;
    Size size;
    int id;
    String alt;
    int pixels;
    MimeTypeEnum type;

    factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        path: json["path"],
        size: sizeValues.map[json["size"]],
        id: json["id"],
        alt: json["alt"],
        pixels: json["pixels"],
        type: mimeTypeEnumValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "path": path,
        "size": sizeValues.reverse[size],
        "id": id,
        "alt": alt,
        "pixels": pixels,
        "type": mimeTypeEnumValues.reverse[type],
    };
}

enum Size { FULL }

final sizeValues = EnumValues({
    "full": Size.FULL
});

enum OgLocale { EN_US }

final ogLocaleValues = EnumValues({
    "en_US": OgLocale.EN_US
});

enum OgSiteName { LOST_STORIES_ACADEMY }

final ogSiteNameValues = EnumValues({
    "Lost Stories Academy": OgSiteName.LOST_STORIES_ACADEMY
});

enum OgType { ARTICLE }

final ogTypeValues = EnumValues({
    "article": OgType.ARTICLE
});

class PurpleRobots {
    PurpleRobots({
        this.index,
        this.follow,
    });

    PurpleIndex index;
    Follow follow;

    factory PurpleRobots.fromJson(Map<String, dynamic> json) => PurpleRobots(
        index: purpleIndexValues.map[json["index"]],
        follow: followValues.map[json["follow"]],
    );

    Map<String, dynamic> toJson() => {
        "index": purpleIndexValues.reverse[index],
        "follow": followValues.reverse[follow],
    };
}

enum Follow { FOLLOW }

final followValues = EnumValues({
    "follow": Follow.FOLLOW
});

enum PurpleIndex { NOINDEX }

final purpleIndexValues = EnumValues({
    "noindex": PurpleIndex.NOINDEX
});

class Schema {
    Schema({
        this.context,
        this.graph,
    });

    String context;
    List<Graph> graph;

    factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": List<dynamic>.from(graph.map((x) => x.toJson())),
    };
}

class Graph {
    Graph({
        this.type,
        this.id,
        this.name,
        this.url,
        this.sameAs,
        this.logo,
        this.image,
        this.description,
        this.publisher,
        this.potentialAction,
        this.inLanguage,
        this.isPartOf,
        this.datePublished,
        this.dateModified,
        this.breadcrumb,
        this.itemListElement,
        this.contentUrl,
        this.width,
        this.height,
        this.caption,
        this.primaryImageOfPage,
    });

    GraphType type;
    String id;
    String name;
    String url;
    List<dynamic> sameAs;
    Logo logo;
    Breadcrumb image;
    String description;
    Breadcrumb publisher;
    List<PotentialAction> potentialAction;
    InLanguage inLanguage;
    Breadcrumb isPartOf;
    DateTime datePublished;
    DateTime dateModified;
    Breadcrumb breadcrumb;
    List<ItemListElement> itemListElement;
    String contentUrl;
    int width;
    int height;
    String caption;
    Breadcrumb primaryImageOfPage;

    factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: graphTypeValues.map[json["@type"]],
        id: json["@id"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
        sameAs: json["sameAs"] == null ? null : List<dynamic>.from(json["sameAs"].map((x) => x)),
        logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
        image: json["image"] == null ? null : Breadcrumb.fromJson(json["image"]),
        description: json["description"] == null ? null : json["description"],
        publisher: json["publisher"] == null ? null : Breadcrumb.fromJson(json["publisher"]),
        potentialAction: json["potentialAction"] == null ? null : List<PotentialAction>.from(json["potentialAction"].map((x) => PotentialAction.fromJson(x))),
        inLanguage: json["inLanguage"] == null ? null : inLanguageValues.map[json["inLanguage"]],
        isPartOf: json["isPartOf"] == null ? null : Breadcrumb.fromJson(json["isPartOf"]),
        datePublished: json["datePublished"] == null ? null : DateTime.parse(json["datePublished"]),
        dateModified: json["dateModified"] == null ? null : DateTime.parse(json["dateModified"]),
        breadcrumb: json["breadcrumb"] == null ? null : Breadcrumb.fromJson(json["breadcrumb"]),
        itemListElement: json["itemListElement"] == null ? null : List<ItemListElement>.from(json["itemListElement"].map((x) => ItemListElement.fromJson(x))),
        contentUrl: json["contentUrl"] == null ? null : json["contentUrl"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        caption: json["caption"] == null ? null : json["caption"],
        primaryImageOfPage: json["primaryImageOfPage"] == null ? null : Breadcrumb.fromJson(json["primaryImageOfPage"]),
    );

    Map<String, dynamic> toJson() => {
        "@type": graphTypeValues.reverse[type],
        "@id": id,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
        "sameAs": sameAs == null ? null : List<dynamic>.from(sameAs.map((x) => x)),
        "logo": logo == null ? null : logo.toJson(),
        "image": image == null ? null : image.toJson(),
        "description": description == null ? null : description,
        "publisher": publisher == null ? null : publisher.toJson(),
        "potentialAction": potentialAction == null ? null : List<dynamic>.from(potentialAction.map((x) => x.toJson())),
        "inLanguage": inLanguage == null ? null : inLanguageValues.reverse[inLanguage],
        "isPartOf": isPartOf == null ? null : isPartOf.toJson(),
        "datePublished": datePublished == null ? null : datePublished.toIso8601String(),
        "dateModified": dateModified == null ? null : dateModified.toIso8601String(),
        "breadcrumb": breadcrumb == null ? null : breadcrumb.toJson(),
        "itemListElement": itemListElement == null ? null : List<dynamic>.from(itemListElement.map((x) => x.toJson())),
        "contentUrl": contentUrl == null ? null : contentUrl,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "caption": caption == null ? null : caption,
        "primaryImageOfPage": primaryImageOfPage == null ? null : primaryImageOfPage.toJson(),
    };
}

class Breadcrumb {
    Breadcrumb({
        this.id,
    });

    String id;

    factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json["@id"],
    );

    Map<String, dynamic> toJson() => {
        "@id": id,
    };
}

enum InLanguage { EN_US }

final inLanguageValues = EnumValues({
    "en-US": InLanguage.EN_US
});

class ItemListElement {
    ItemListElement({
        this.type,
        this.position,
        this.name,
        this.item,
    });

    ItemListElementType type;
    int position;
    String name;
    String item;

    factory ItemListElement.fromJson(Map<String, dynamic> json) => ItemListElement(
        type: itemListElementTypeValues.map[json["@type"]],
        position: json["position"],
        name: json["name"],
        item: json["item"] == null ? null : json["item"],
    );

    Map<String, dynamic> toJson() => {
        "@type": itemListElementTypeValues.reverse[type],
        "position": position,
        "name": name,
        "item": item == null ? null : item,
    };
}

enum ItemListElementType { LIST_ITEM }

final itemListElementTypeValues = EnumValues({
    "ListItem": ItemListElementType.LIST_ITEM
});

class Logo {
    Logo({
        this.type,
        this.id,
        this.inLanguage,
        this.url,
        this.contentUrl,
        this.width,
        this.height,
        this.caption,
    });

    GraphType type;
    String id;
    InLanguage inLanguage;
    String url;
    String contentUrl;
    int width;
    int height;
    OgSiteName caption;

    factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        type: graphTypeValues.map[json["@type"]],
        id: json["@id"],
        inLanguage: inLanguageValues.map[json["inLanguage"]],
        url: json["url"],
        contentUrl: json["contentUrl"],
        width: json["width"],
        height: json["height"],
        caption: ogSiteNameValues.map[json["caption"]],
    );

    Map<String, dynamic> toJson() => {
        "@type": graphTypeValues.reverse[type],
        "@id": id,
        "inLanguage": inLanguageValues.reverse[inLanguage],
        "url": url,
        "contentUrl": contentUrl,
        "width": width,
        "height": height,
        "caption": ogSiteNameValues.reverse[caption],
    };
}

enum GraphType { ORGANIZATION, WEB_SITE, WEB_PAGE, BREADCRUMB_LIST, IMAGE_OBJECT }

final graphTypeValues = EnumValues({
    "BreadcrumbList": GraphType.BREADCRUMB_LIST,
    "ImageObject": GraphType.IMAGE_OBJECT,
    "Organization": GraphType.ORGANIZATION,
    "WebPage": GraphType.WEB_PAGE,
    "WebSite": GraphType.WEB_SITE
});

class PotentialAction {
    PotentialAction({
        this.type,
        this.target,
        this.queryInput,
    });

    PotentialActionType type;
    dynamic target;
    QueryInput queryInput;

    factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
        type: potentialActionTypeValues.map[json["@type"]],
        target: json["target"],
        queryInput: json["query-input"] == null ? null : queryInputValues.map[json["query-input"]],
    );

    Map<String, dynamic> toJson() => {
        "@type": potentialActionTypeValues.reverse[type],
        "target": target,
        "query-input": queryInput == null ? null : queryInputValues.reverse[queryInput],
    };
}

enum QueryInput { REQUIRED_NAME_SEARCH_TERM_STRING }

final queryInputValues = EnumValues({
    "required name=search_term_string": QueryInput.REQUIRED_NAME_SEARCH_TERM_STRING
});

class TargetClass {
    TargetClass({
        this.type,
        this.urlTemplate,
    });

    TargetType type;
    UrlTemplate urlTemplate;

    factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type: targetTypeValues.map[json["@type"]],
        urlTemplate: urlTemplateValues.map[json["urlTemplate"]],
    );

    Map<String, dynamic> toJson() => {
        "@type": targetTypeValues.reverse[type],
        "urlTemplate": urlTemplateValues.reverse[urlTemplate],
    };
}

enum TargetType { ENTRY_POINT }

final targetTypeValues = EnumValues({
    "EntryPoint": TargetType.ENTRY_POINT
});

enum UrlTemplate { HTTPS_WWW_LOSTSTORIESACADEMY_COM_S_SEARCH_TERM_STRING }

final urlTemplateValues = EnumValues({
    "https://www.loststoriesacademy.com/?s={search_term_string}": UrlTemplate.HTTPS_WWW_LOSTSTORIESACADEMY_COM_S_SEARCH_TERM_STRING
});

enum PotentialActionType { SEARCH_ACTION, READ_ACTION }

final potentialActionTypeValues = EnumValues({
    "ReadAction": PotentialActionType.READ_ACTION,
    "SearchAction": PotentialActionType.SEARCH_ACTION
});

enum TwitterCard { SUMMARY_LARGE_IMAGE }

final twitterCardValues = EnumValues({
    "summary_large_image": TwitterCard.SUMMARY_LARGE_IMAGE
});

class PodcastsListLinks {
    PodcastsListLinks({
        this.self,
        this.collection,
        this.about,
        this.wpFeaturedmedia,
        this.wpAttachment,
        this.curies,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<AuthorElement> wpFeaturedmedia;
    List<About> wpAttachment;
    List<Cury> curies;

    factory PodcastsListLinks.fromJson(Map<String, dynamic> json) => PodcastsListLinks(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        wpFeaturedmedia: List<AuthorElement>.from(json["wp:featuredmedia"].map((x) => AuthorElement.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
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

enum Status { PUBLISH }

final statusValues = EnumValues({
    "publish": Status.PUBLISH
});

enum PodcastsListType { PODCASTS }

final podcastsListTypeValues = EnumValues({
    "podcasts": PodcastsListType.PODCASTS
});

class PodcastsListYoastHeadJson {
    PodcastsListYoastHeadJson({
        this.title,
        this.description,
        this.robots,
        this.canonical,
        this.ogLocale,
        this.ogType,
        this.ogTitle,
        this.ogDescription,
        this.ogUrl,
        this.ogSiteName,
        this.articleModifiedTime,
        this.ogImage,
        this.twitterCard,
        this.schema,
        this.twitterMisc,
    });

    String title;
    String description;
    FluffyRobots robots;
    String canonical;
    OgLocale ogLocale;
    OgType ogType;
    String ogTitle;
    String ogDescription;
    String ogUrl;
    OgSiteName ogSiteName;
    DateTime articleModifiedTime;
    List<OgImage> ogImage;
    TwitterCard twitterCard;
    Schema schema;
    TwitterMisc twitterMisc;

    factory PodcastsListYoastHeadJson.fromJson(Map<String, dynamic> json) => PodcastsListYoastHeadJson(
        title: json["title"],
        description: json["description"],
        robots: FluffyRobots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: ogLocaleValues.map[json["og_locale"]],
        ogType: ogTypeValues.map[json["og_type"]],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        ogUrl: json["og_url"],
        ogSiteName: ogSiteNameValues.map[json["og_site_name"]],
        articleModifiedTime: DateTime.parse(json["article_modified_time"]),
        ogImage: List<OgImage>.from(json["og_image"].map((x) => OgImage.fromJson(x))),
        twitterCard: twitterCardValues.map[json["twitter_card"]],
        schema: Schema.fromJson(json["schema"]),
        twitterMisc: json["twitter_misc"] == null ? null : TwitterMisc.fromJson(json["twitter_misc"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "robots": robots.toJson(),
        "canonical": canonical,
        "og_locale": ogLocaleValues.reverse[ogLocale],
        "og_type": ogTypeValues.reverse[ogType],
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteNameValues.reverse[ogSiteName],
        "article_modified_time": articleModifiedTime.toIso8601String(),
        "og_image": List<dynamic>.from(ogImage.map((x) => x.toJson())),
        "twitter_card": twitterCardValues.reverse[twitterCard],
        "schema": schema.toJson(),
        "twitter_misc": twitterMisc == null ? null : twitterMisc.toJson(),
    };
}

class FluffyRobots {
    FluffyRobots({
        this.index,
        this.follow,
        this.maxSnippet,
        this.maxImagePreview,
        this.maxVideoPreview,
    });

    FluffyIndex index;
    Follow follow;
    MaxSnippet maxSnippet;
    MaxImagePreview maxImagePreview;
    MaxVideoPreview maxVideoPreview;

    factory FluffyRobots.fromJson(Map<String, dynamic> json) => FluffyRobots(
        index: fluffyIndexValues.map[json["index"]],
        follow: followValues.map[json["follow"]],
        maxSnippet: maxSnippetValues.map[json["max-snippet"]],
        maxImagePreview: maxImagePreviewValues.map[json["max-image-preview"]],
        maxVideoPreview: maxVideoPreviewValues.map[json["max-video-preview"]],
    );

    Map<String, dynamic> toJson() => {
        "index": fluffyIndexValues.reverse[index],
        "follow": followValues.reverse[follow],
        "max-snippet": maxSnippetValues.reverse[maxSnippet],
        "max-image-preview": maxImagePreviewValues.reverse[maxImagePreview],
        "max-video-preview": maxVideoPreviewValues.reverse[maxVideoPreview],
    };
}

enum FluffyIndex { INDEX }

final fluffyIndexValues = EnumValues({
    "index": FluffyIndex.INDEX
});

enum MaxImagePreview { MAX_IMAGE_PREVIEW_LARGE }

final maxImagePreviewValues = EnumValues({
    "max-image-preview:large": MaxImagePreview.MAX_IMAGE_PREVIEW_LARGE
});

enum MaxSnippet { MAX_SNIPPET_1 }

final maxSnippetValues = EnumValues({
    "max-snippet:-1": MaxSnippet.MAX_SNIPPET_1
});

enum MaxVideoPreview { MAX_VIDEO_PREVIEW_1 }

final maxVideoPreviewValues = EnumValues({
    "max-video-preview:-1": MaxVideoPreview.MAX_VIDEO_PREVIEW_1
});

class TwitterMisc {
    TwitterMisc({
        this.estReadingTime,
    });

    String estReadingTime;

    factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
        estReadingTime: json["Est. reading time"],
    );

    Map<String, dynamic> toJson() => {
        "Est. reading time": estReadingTime,
    };
}

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
