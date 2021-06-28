// To parse this JSON data, do
//
//     final coursesCategory = coursesCategoryFromJson(jsonString);

import 'dart:convert';

List<CoursesCategory> coursesCategoryFromJson(String str) =>
    List<CoursesCategory>.from(
        json.decode(str).map((x) => CoursesCategory.fromJson(x)));

String coursesCategoryToJson(List<CoursesCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoursesCategory {
  CoursesCategory({
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
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.template,
    this.meta,
    this.stmLmsCourseTaxonomy,
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
  CoursesCategoryType type;
  String link;
  Guid title;
  Content content;
  Content excerpt;
  int author;
  int featuredMedia;
  String template;
  Meta meta;
  List<int> stmLmsCourseTaxonomy;
  bool acf;
  CoursesCategoryLinks links;
  Embedded embedded;

  factory CoursesCategory.fromJson(Map<String, dynamic> json) =>
      CoursesCategory(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: statusValues.map[json["status"]],
        type: coursesCategoryTypeValues.map[json["type"]],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        template: json["template"],
        meta: Meta.fromJson(json["meta"]),
        stmLmsCourseTaxonomy:
            List<int>.from(json["stm_lms_course_taxonomy"].map((x) => x)),
        acf: json["ACF"],
        links: CoursesCategoryLinks.fromJson(json["_links"]),
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
        "type": coursesCategoryTypeValues.reverse[type],
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "template": template,
        "meta": meta.toJson(),
        "stm_lms_course_taxonomy":
            List<dynamic>.from(stmLmsCourseTaxonomy.map((x) => x)),
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
    this.author,
    this.wpFeaturedmedia,
    this.wpTerm,
  });

  List<EmbeddedAuthor> author;
  List<WpFeaturedmedia> wpFeaturedmedia;
  List<List<EmbeddedWpTerm>> wpTerm;

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
        author: List<EmbeddedAuthor>.from(
            json["author"].map((x) => EmbeddedAuthor.fromJson(x))),
        wpFeaturedmedia: List<WpFeaturedmedia>.from(
            json["wp:featuredmedia"].map((x) => WpFeaturedmedia.fromJson(x))),
        wpTerm: List<List<EmbeddedWpTerm>>.from(json["wp:term"].map((x) =>
            List<EmbeddedWpTerm>.from(
                x.map((x) => EmbeddedWpTerm.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "wp:featuredmedia":
            List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(
            wpTerm.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class EmbeddedAuthor {
  EmbeddedAuthor({
    this.id,
    this.name,
    this.url,
    this.description,
    this.link,
    this.slug,
    this.avatarUrls,
    this.yoastHead,
    this.woocommerceMeta,
    this.links,
  });

  int id;
  AuthorName name;
  String url;
  String description;
  String link;
  Slug slug;
  Map<String, String> avatarUrls;
  String yoastHead;
  WoocommerceMeta woocommerceMeta;
  AuthorLinks links;

  factory EmbeddedAuthor.fromJson(Map<String, dynamic> json) => EmbeddedAuthor(
        id: json["id"],
        name: authorNameValues.map[json["name"]],
        url: json["url"],
        description: json["description"],
        link: json["link"],
        slug: slugValues.map[json["slug"]],
        avatarUrls: Map.from(json["avatar_urls"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        yoastHead: json["yoast_head"],
        woocommerceMeta: WoocommerceMeta.fromJson(json["woocommerce_meta"]),
        links: AuthorLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": authorNameValues.reverse[name],
        "url": url,
        "description": description,
        "link": link,
        "slug": slugValues.reverse[slug],
        "avatar_urls":
            Map.from(avatarUrls).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "yoast_head": yoastHead,
        "woocommerce_meta": woocommerceMeta.toJson(),
        "_links": links.toJson(),
      };
}

class AuthorLinks {
  AuthorLinks({
    this.self,
    this.collection,
  });

  List<About> self;
  List<About> collection;

  factory AuthorLinks.fromJson(Map<String, dynamic> json) => AuthorLinks(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
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

enum AuthorName { LOST_STORIES_ACADEMY }

final authorNameValues =
    EnumValues({"Lost Stories Academy": AuthorName.LOST_STORIES_ACADEMY});

enum Slug { LOST_STORIES_ACADEMY }

final slugValues =
    EnumValues({"lost-stories-academy": Slug.LOST_STORIES_ACADEMY});

class WoocommerceMeta {
  WoocommerceMeta({
    this.activityPanelInboxLastRead,
    this.activityPanelReviewsLastRead,
    this.categoriesReportColumns,
    this.couponsReportColumns,
    this.customersReportColumns,
    this.ordersReportColumns,
    this.productsReportColumns,
    this.revenueReportColumns,
    this.taxesReportColumns,
    this.variationsReportColumns,
    this.dashboardSections,
    this.dashboardChartType,
    this.dashboardChartInterval,
    this.dashboardLeaderboardRows,
    this.homepageLayout,
    this.homepageStats,
    this.taskListTrackedStartedTasks,
    this.helpPanelHighlightShown,
    this.androidAppBannerDismissed,
  });

  String activityPanelInboxLastRead;
  String activityPanelReviewsLastRead;
  String categoriesReportColumns;
  String couponsReportColumns;
  String customersReportColumns;
  String ordersReportColumns;
  String productsReportColumns;
  String revenueReportColumns;
  String taxesReportColumns;
  String variationsReportColumns;
  String dashboardSections;
  String dashboardChartType;
  String dashboardChartInterval;
  String dashboardLeaderboardRows;
  String homepageLayout;
  String homepageStats;
  String taskListTrackedStartedTasks;
  String helpPanelHighlightShown;
  String androidAppBannerDismissed;

  factory WoocommerceMeta.fromJson(Map<String, dynamic> json) =>
      WoocommerceMeta(
        activityPanelInboxLastRead: json["activity_panel_inbox_last_read"],
        activityPanelReviewsLastRead: json["activity_panel_reviews_last_read"],
        categoriesReportColumns: json["categories_report_columns"],
        couponsReportColumns: json["coupons_report_columns"],
        customersReportColumns: json["customers_report_columns"],
        ordersReportColumns: json["orders_report_columns"],
        productsReportColumns: json["products_report_columns"],
        revenueReportColumns: json["revenue_report_columns"],
        taxesReportColumns: json["taxes_report_columns"],
        variationsReportColumns: json["variations_report_columns"],
        dashboardSections: json["dashboard_sections"],
        dashboardChartType: json["dashboard_chart_type"],
        dashboardChartInterval: json["dashboard_chart_interval"],
        dashboardLeaderboardRows: json["dashboard_leaderboard_rows"],
        homepageLayout: json["homepage_layout"],
        homepageStats: json["homepage_stats"],
        taskListTrackedStartedTasks: json["task_list_tracked_started_tasks"],
        helpPanelHighlightShown: json["help_panel_highlight_shown"],
        androidAppBannerDismissed: json["android_app_banner_dismissed"],
      );

  Map<String, dynamic> toJson() => {
        "activity_panel_inbox_last_read": activityPanelInboxLastRead,
        "activity_panel_reviews_last_read": activityPanelReviewsLastRead,
        "categories_report_columns": categoriesReportColumns,
        "coupons_report_columns": couponsReportColumns,
        "customers_report_columns": customersReportColumns,
        "orders_report_columns": ordersReportColumns,
        "products_report_columns": productsReportColumns,
        "revenue_report_columns": revenueReportColumns,
        "taxes_report_columns": taxesReportColumns,
        "variations_report_columns": variationsReportColumns,
        "dashboard_sections": dashboardSections,
        "dashboard_chart_type": dashboardChartType,
        "dashboard_chart_interval": dashboardChartInterval,
        "dashboard_leaderboard_rows": dashboardLeaderboardRows,
        "homepage_layout": homepageLayout,
        "homepage_stats": homepageStats,
        "task_list_tracked_started_tasks": taskListTrackedStartedTasks,
        "help_panel_highlight_shown": helpPanelHighlightShown,
        "android_app_banner_dismissed": androidAppBannerDismissed,
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

  factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) =>
      WpFeaturedmedia(
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
  List<WpFeaturedmediaElement> author;
  List<WpFeaturedmediaElement> replies;

  factory WpFeaturedmediaLinks.fromJson(Map<String, dynamic> json) =>
      WpFeaturedmediaLinks(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<WpFeaturedmediaElement>.from(
            json["author"].map((x) => WpFeaturedmediaElement.fromJson(x))),
        replies: List<WpFeaturedmediaElement>.from(
            json["replies"].map((x) => WpFeaturedmediaElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
      };
}

class WpFeaturedmediaElement {
  WpFeaturedmediaElement({
    this.embeddable,
    this.href,
  });

  bool embeddable;
  String href;

  factory WpFeaturedmediaElement.fromJson(Map<String, dynamic> json) =>
      WpFeaturedmediaElement(
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
        sizes: Map.from(json["sizes"])
            .map((k, v) => MapEntry<String, Size>(k, Size.fromJson(v))),
        imageMeta: ImageMeta.fromJson(json["image_meta"]),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "sizes": Map.from(sizes)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
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

enum MimeType { IMAGE_JPEG }

final mimeTypeValues = EnumValues({"image/jpeg": MimeType.IMAGE_JPEG});

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({"image": MediaType.IMAGE});

enum WpFeaturedmediaType { ATTACHMENT }

final wpFeaturedmediaTypeValues =
    EnumValues({"attachment": WpFeaturedmediaType.ATTACHMENT});

class EmbeddedWpTerm {
  EmbeddedWpTerm({
    this.id,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.yoastHead,
    this.links,
  });

  int id;
  String link;
  String name;
  String slug;
  Taxonomy taxonomy;
  String yoastHead;
  WpTermLinks links;

  factory EmbeddedWpTerm.fromJson(Map<String, dynamic> json) => EmbeddedWpTerm(
        id: json["id"],
        link: json["link"],
        name: json["name"],
        slug: json["slug"],
        taxonomy: taxonomyValues.map[json["taxonomy"]],
        yoastHead: json["yoast_head"],
        links: WpTermLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "name": name,
        "slug": slug,
        "taxonomy": taxonomyValues.reverse[taxonomy],
        "yoast_head": yoastHead,
        "_links": links.toJson(),
      };
}

class WpTermLinks {
  WpTermLinks({
    this.self,
    this.collection,
    this.about,
    this.wpPostType,
    this.curies,
  });

  List<About> self;
  List<About> collection;
  List<About> about;
  List<About> wpPostType;
  List<Cury> curies;

  factory WpTermLinks.fromJson(Map<String, dynamic> json) => WpTermLinks(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        wpPostType: List<About>.from(
            json["wp:post_type"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "wp:post_type": List<dynamic>.from(wpPostType.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
      };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  CuryName name;
  Href href;
  bool templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: curyNameValues.map[json["name"]],
        href: hrefValues.map[json["href"]],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": curyNameValues.reverse[name],
        "href": hrefValues.reverse[href],
        "templated": templated,
      };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues =
    EnumValues({"https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL});

enum CuryName { WP }

final curyNameValues = EnumValues({"wp": CuryName.WP});

enum Taxonomy { STM_LMS_COURSE_TAXONOMY }

final taxonomyValues =
    EnumValues({"stm_lms_course_taxonomy": Taxonomy.STM_LMS_COURSE_TAXONOMY});

class CoursesCategoryLinks {
  CoursesCategoryLinks({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.versionHistory,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About> self;
  List<About> collection;
  List<About> about;
  List<WpFeaturedmediaElement> author;
  List<VersionHistory> versionHistory;
  List<WpFeaturedmediaElement> wpFeaturedmedia;
  List<About> wpAttachment;
  List<LinksWpTerm> wpTerm;
  List<Cury> curies;

  factory CoursesCategoryLinks.fromJson(Map<String, dynamic> json) =>
      CoursesCategoryLinks(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<WpFeaturedmediaElement>.from(
            json["author"].map((x) => WpFeaturedmediaElement.fromJson(x))),
        versionHistory: List<VersionHistory>.from(
            json["version-history"].map((x) => VersionHistory.fromJson(x))),
        wpFeaturedmedia: List<WpFeaturedmediaElement>.from(
            json["wp:featuredmedia"]
                .map((x) => WpFeaturedmediaElement.fromJson(x))),
        wpAttachment: List<About>.from(
            json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm: List<LinksWpTerm>.from(
            json["wp:term"].map((x) => LinksWpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "version-history":
            List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "wp:featuredmedia":
            List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment":
            List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
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

class LinksWpTerm {
  LinksWpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  Taxonomy taxonomy;
  bool embeddable;
  String href;

  factory LinksWpTerm.fromJson(Map<String, dynamic> json) => LinksWpTerm(
        taxonomy: taxonomyValues.map[json["taxonomy"]],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomyValues.reverse[taxonomy],
        "embeddable": embeddable,
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

enum Status { PUBLISH }

final statusValues = EnumValues({"publish": Status.PUBLISH});

enum CoursesCategoryType { STM_COURSES }

final coursesCategoryTypeValues =
    EnumValues({"stm-courses": CoursesCategoryType.STM_COURSES});

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
