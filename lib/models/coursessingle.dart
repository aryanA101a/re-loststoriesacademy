// To parse this JSON data, do
//
//     final coursesSingle = coursesSingleFromJson(jsonString);

import 'dart:convert';

CoursesSingle coursesSingleFromJson(String str) => CoursesSingle.fromJson(json.decode(str));

String coursesSingleToJson(CoursesSingle data) => json.encode(data.toJson());

class CoursesSingle {
    CoursesSingle({
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
        this.excerpt,
        this.author,
        this.featuredMedia,
        this.template,
        this.meta,
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
    Content excerpt;
    int author;
    int featuredMedia;
    String template;
    Meta meta;
    String permalinkTemplate;
    String generatedSlug;
    String yoastHead;
    bool acf;
    Links links;

    factory CoursesSingle.fromJson(Map<String, dynamic> json) => CoursesSingle(
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
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        template: json["template"],
        meta: Meta.fromJson(json["meta"]),
        permalinkTemplate: json["permalink_template"],
        generatedSlug: json["generated_slug"],
        yoastHead: json["yoast_head"],
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
        "password": password,
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "template": template,
        "meta": meta.toJson(),
        "permalink_template": permalinkTemplate,
        "generated_slug": generatedSlug,
        "yoast_head": yoastHead,
        "ACF": acf,
        "_links": links.toJson(),
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
        blockVersion: json["block_version"] == null ? null : json["block_version"],
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "rendered": rendered,
        "protected": protected,
        "block_version": blockVersion == null ? null : blockVersion,
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
        this.author,
        this.versionHistory,
        this.predecessorVersion,
        this.wpFeaturedmedia,
        this.wpAttachment,
        this.wpActionPublish,
        this.wpActionUnfilteredHtml,
        this.wpActionAssignAuthor,
        this.curies,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<Author> author;
    List<VersionHistory> versionHistory;
    List<PredecessorVersion> predecessorVersion;
    List<Author> wpFeaturedmedia;
    List<About> wpAttachment;
    List<About> wpActionPublish;
    List<About> wpActionUnfilteredHtml;
    List<About> wpActionAssignAuthor;
    List<Cury> curies;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: List<PredecessorVersion>.from(json["predecessor-version"].map((x) => PredecessorVersion.fromJson(x))),
        wpFeaturedmedia: List<Author>.from(json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        wpActionPublish: List<About>.from(json["wp:action-publish"].map((x) => About.fromJson(x))),
        wpActionUnfilteredHtml: List<About>.from(json["wp:action-unfiltered-html"].map((x) => About.fromJson(x))),
        wpActionAssignAuthor: List<About>.from(json["wp:action-assign-author"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "version-history": List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "predecessor-version": List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
        "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:action-publish": List<dynamic>.from(wpActionPublish.map((x) => x.toJson())),
        "wp:action-unfiltered-html": List<dynamic>.from(wpActionUnfilteredHtml.map((x) => x.toJson())),
        "wp:action-assign-author": List<dynamic>.from(wpActionAssignAuthor.map((x) => x.toJson())),
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

class Meta {
    Meta({
        this.bbpTopicCount,
        this.bbpReplyCount,
        this.bbpTotalTopicCount,
        this.bbpTotalReplyCount,
        this.bbpVoiceCount,
        this.bbpAnonymousReplyCount,
        this.bbpTopicCountHidden,
        this.bbpReplyCountHidden,
        this.bbpForumSubforumCount,
        this.spayEmail,
    });

    int bbpTopicCount;
    int bbpReplyCount;
    int bbpTotalTopicCount;
    int bbpTotalReplyCount;
    int bbpVoiceCount;
    int bbpAnonymousReplyCount;
    int bbpTopicCountHidden;
    int bbpReplyCountHidden;
    int bbpForumSubforumCount;
    String spayEmail;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        bbpTopicCount: json["_bbp_topic_count"],
        bbpReplyCount: json["_bbp_reply_count"],
        bbpTotalTopicCount: json["_bbp_total_topic_count"],
        bbpTotalReplyCount: json["_bbp_total_reply_count"],
        bbpVoiceCount: json["_bbp_voice_count"],
        bbpAnonymousReplyCount: json["_bbp_anonymous_reply_count"],
        bbpTopicCountHidden: json["_bbp_topic_count_hidden"],
        bbpReplyCountHidden: json["_bbp_reply_count_hidden"],
        bbpForumSubforumCount: json["_bbp_forum_subforum_count"],
        spayEmail: json["spay_email"],
    );

    Map<String, dynamic> toJson() => {
        "_bbp_topic_count": bbpTopicCount,
        "_bbp_reply_count": bbpReplyCount,
        "_bbp_total_topic_count": bbpTotalTopicCount,
        "_bbp_total_reply_count": bbpTotalReplyCount,
        "_bbp_voice_count": bbpVoiceCount,
        "_bbp_anonymous_reply_count": bbpAnonymousReplyCount,
        "_bbp_topic_count_hidden": bbpTopicCountHidden,
        "_bbp_reply_count_hidden": bbpReplyCountHidden,
        "_bbp_forum_subforum_count": bbpForumSubforumCount,
        "spay_email": spayEmail,
    };
}
