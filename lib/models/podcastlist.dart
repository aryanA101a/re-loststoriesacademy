// To parse this JSON data, do
//
//     final podcastsLists = podcastsListsFromJson(jsonString);

import 'dart:convert';

List<PodcastsLists> podcastsListsFromJson(String str) => List<PodcastsLists>.from(json.decode(str).map((x) => PodcastsLists.fromJson(x)));

String podcastsListsToJson(List<PodcastsLists> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PodcastsLists {
    PodcastsLists({
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
    int featuredMedia;
    String template;
    String yoastHead;
    Acf acf;
    Links links;

    factory PodcastsLists.fromJson(Map<String, dynamic> json) => PodcastsLists(
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
        featuredMedia: json["featured_media"],
        template: json["template"],
        yoastHead: json["yoast_head"],
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
        "featured_media": featuredMedia,
        "template": template,
        "yoast_head": yoastHead,
        "ACF": acf.toJson(),
        "_links": links.toJson(),
    };
}

class Acf {
    Acf({
        this.track,
        this.allAccessPassOnly,
    });

    List<Track> track;
    bool allAccessPassOnly;

    factory Acf.fromJson(Map<String, dynamic> json) => Acf(
        track: List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
        allAccessPassOnly: json["all_access_pass_only"],
    );

    Map<String, dynamic> toJson() => {
        "track": List<dynamic>.from(track.map((x) => x.toJson())),
        "all_access_pass_only": allAccessPassOnly,
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
        this.wpFeaturedmedia,
        this.wpAttachment,
        this.curies,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<WpFeaturedmedia> wpFeaturedmedia;
    List<About> wpAttachment;
    List<Cury> curies;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        wpFeaturedmedia: List<WpFeaturedmedia>.from(json["wp:featuredmedia"].map((x) => WpFeaturedmedia.fromJson(x))),
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

class WpFeaturedmedia {
    WpFeaturedmedia({
        this.embeddable,
        this.href,
    });

    bool embeddable;
    String href;

    factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) => WpFeaturedmedia(
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
    };
}

enum Status { PUBLISH }

final statusValues = EnumValues({
    "publish": Status.PUBLISH
});

enum Type { PODCASTS }

final typeValues = EnumValues({
    "podcasts": Type.PODCASTS
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
