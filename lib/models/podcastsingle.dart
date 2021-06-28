// To parse this JSON data, do
//
//     final podcastSingle = podcastSingleFromJson(jsonString);

import 'dart:convert';

PodcastSingle podcastSingleFromJson(String str) => PodcastSingle.fromJson(json.decode(str));

String podcastSingleToJson(PodcastSingle data) => json.encode(data.toJson());

class PodcastSingle {
    PodcastSingle({
        this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.password,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.content,
        this.featuredMedia,
        this.template,
        this.permalinkTemplate,
        this.generatedSlug,
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
    String password;
    String slug;
    String status;
    String type;
    String link;
    Guid title;
    Content content;
    int featuredMedia;
    String template;
    String permalinkTemplate;
    String generatedSlug;
    String yoastHead;
    Acf acf;
    Links links;

    factory PodcastSingle.fromJson(Map<String, dynamic> json) => PodcastSingle(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        password: json["password"],
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        featuredMedia: json["featured_media"],
        template: json["template"],
        permalinkTemplate: json["permalink_template"],
        generatedSlug: json["generated_slug"],
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
        "password": password,
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "featured_media": featuredMedia,
        "template": template,
        "permalink_template": permalinkTemplate,
        "generated_slug": generatedSlug,
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

    String language;
    String trackFile;

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        language: json["language"],
        trackFile: json["track_file"],
    );

    Map<String, dynamic> toJson() => {
        "language": language,
        "track_file": trackFile,
    };
}

class Content {
    Content({
        this.raw,
        this.rendered,
        this.protected,
        this.blockVersion,
    });

    String raw;
    String rendered;
    bool protected;
    int blockVersion;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        raw: json["raw"],
        rendered: json["rendered"],
        protected: json["protected"],
        blockVersion: json["block_version"],
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "rendered": rendered,
        "protected": protected,
        "block_version": blockVersion,
    };
}

class Guid {
    Guid({
        this.rendered,
        this.raw,
    });

    String rendered;
    String raw;

    factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
        raw: json["raw"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "raw": raw,
    };
}

class Links {
    Links({
        this.self,
        this.collection,
        this.about,
        this.wpFeaturedmedia,
        this.wpAttachment,
        this.wpActionPublish,
        this.wpActionUnfilteredHtml,
        this.curies,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<WpFeaturedmedia> wpFeaturedmedia;
    List<About> wpAttachment;
    List<About> wpActionPublish;
    List<About> wpActionUnfilteredHtml;
    List<Cury> curies;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        wpFeaturedmedia: List<WpFeaturedmedia>.from(json["wp:featuredmedia"].map((x) => WpFeaturedmedia.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        wpActionPublish: List<About>.from(json["wp:action-publish"].map((x) => About.fromJson(x))),
        wpActionUnfilteredHtml: List<About>.from(json["wp:action-unfiltered-html"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:action-publish": List<dynamic>.from(wpActionPublish.map((x) => x.toJson())),
        "wp:action-unfiltered-html": List<dynamic>.from(wpActionUnfilteredHtml.map((x) => x.toJson())),
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

    String name;
    String href;
    bool templated;

    factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
    };
}

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
