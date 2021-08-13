// To parse this JSON data, do
//
//     final lessons = lessonsFromJson(jsonString);

import 'dart:convert';

Lessons lessonsFromJson(String str) => Lessons.fromJson(json.decode(str));

String lessonsToJson(Lessons data) => json.encode(data.toJson());

class Lessons {
    Lessons({
        this.id,
        this.title,
        this.images,
        this.notSaleable,
        this.categories,
        this.price,
        this.rating,
        this.featured,
        this.status,
        this.isFavorite,
        this.categoriesObject,
        this.author,
        this.url,
        this.description,
        this.meta,
        this.announcement,
        this.purchaseLabel,
        this.curriculum,
        this.faq,
        this.trial,
        this.firstLesson,
        this.firstLessonType,
        this.hasAccess,
    });

    int id;
    String title;
    Images images;
    bool notSaleable;
    List<String> categories;
    Price price;
    LessonsRating rating;
    dynamic featured;
    dynamic status;
    bool isFavorite;
    List<CategoriesObject> categoriesObject;
    Author author;
    String url;
    String description;
    List<MetaElement> meta;
    String announcement;
    String purchaseLabel;
    List<Curriculum> curriculum;
    dynamic faq;
    bool trial;
    int firstLesson;
    dynamic firstLessonType;
    bool hasAccess;

    factory Lessons.fromJson(Map<String, dynamic> json) => Lessons(
        id: json["id"],
        title: json["title"],
        images: Images.fromJson(json["images"]),
        notSaleable: json["not_saleable"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        price: Price.fromJson(json["price"]),
        rating: LessonsRating.fromJson(json["rating"]),
        featured: json["featured"],
        status: json["status"],
        isFavorite: json["is_favorite"],
        categoriesObject: List<CategoriesObject>.from(json["categories_object"].map((x) => CategoriesObject.fromJson(x))),
        author: Author.fromJson(json["author"]),
        url: json["url"],
        description: json["description"],
        meta: List<MetaElement>.from(json["meta"].map((x) => MetaElement.fromJson(x))),
        announcement: json["announcement"],
        purchaseLabel: json["purchase_label"],
        curriculum: List<Curriculum>.from(json["curriculum"].map((x) => Curriculum.fromJson(x))),
        faq: json["faq"],
        trial: json["trial"],
        firstLesson: json["first_lesson"],
        firstLessonType: json["first_lesson_type"],
        hasAccess: json["has_access"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "images": images.toJson(),
        "not_saleable": notSaleable,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "price": price.toJson(),
        "rating": rating.toJson(),
        "featured": featured,
        "status": status,
        "is_favorite": isFavorite,
        "categories_object": List<dynamic>.from(categoriesObject.map((x) => x.toJson())),
        "author": author.toJson(),
        "url": url,
        "description": description,
        "meta": List<dynamic>.from(meta.map((x) => x.toJson())),
        "announcement": announcement,
        "purchase_label": purchaseLabel,
        "curriculum": List<dynamic>.from(curriculum.map((x) => x.toJson())),
        "faq": faq,
        "trial": trial,
        "first_lesson": firstLesson,
        "first_lesson_type": firstLessonType,
        "has_access": hasAccess,
    };
}

class Author {
    Author({
        this.id,
        this.login,
        this.avatarUrl,
        this.url,
        this.meta,
        this.rating,
        this.totalCourses,
    });

    int id;
    String login;
    String avatarUrl;
    String url;
    AuthorMeta meta;
    AuthorRating rating;
    int totalCourses;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        login: json["login"],
        avatarUrl: json["avatar_url"],
        url: json["url"],
        meta: AuthorMeta.fromJson(json["meta"]),
        rating: AuthorRating.fromJson(json["rating"]),
        totalCourses: json["total_courses"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "avatar_url": avatarUrl,
        "url": url,
        "meta": meta.toJson(),
        "rating": rating.toJson(),
        "total_courses": totalCourses,
    };
}

class AuthorMeta {
    AuthorMeta({
        this.facebook,
        this.twitter,
        this.instagram,
        this.googlePlus,
        this.position,
        this.description,
        this.firstName,
        this.lastName,
    });

    dynamic facebook;
    dynamic twitter;
    dynamic instagram;
    dynamic googlePlus;
    dynamic position;
    dynamic description;
    String firstName;
    String lastName;

    factory AuthorMeta.fromJson(Map<String, dynamic> json) => AuthorMeta(
        facebook: json["facebook"],
        twitter: json["twitter"],
        instagram: json["instagram"],
        googlePlus: json["google-plus"],
        position: json["position"],
        description: json["description"],
        firstName: json["first_name"],
        lastName: json["last_name"],
    );

    Map<String, dynamic> toJson() => {
        "facebook": facebook,
        "twitter": twitter,
        "instagram": instagram,
        "google-plus": googlePlus,
        "position": position,
        "description": description,
        "first_name": firstName,
        "last_name": lastName,
    };
}

class AuthorRating {
    AuthorRating({
        this.total,
        this.average,
        this.marksNum,
        this.totalMarks,
        this.percent,
    });

    int total;
    int average;
    int marksNum;
    String totalMarks;
    int percent;

    factory AuthorRating.fromJson(Map<String, dynamic> json) => AuthorRating(
        total: json["total"],
        average: json["average"],
        marksNum: json["marks_num"],
        totalMarks: json["total_marks"],
        percent: json["percent"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "average": average,
        "marks_num": marksNum,
        "total_marks": totalMarks,
        "percent": percent,
    };
}

class CategoriesObject {
    CategoriesObject({
        this.id,
        this.name,
        this.count,
        this.color,
        this.image,
    });

    int id;
    String name;
    int count;
    dynamic color;
    dynamic image;

    factory CategoriesObject.fromJson(Map<String, dynamic> json) => CategoriesObject(
        id: json["id"],
        name: json["name"],
        count: json["count"],
        color: json["color"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "count": count,
        "color": color,
        "image": image,
    };
}

class Curriculum {
    Curriculum({
        this.type,
        this.view,
        this.label,
        this.duration,
        this.excerpt,
        this.lessonId,
        this.previewUrl,
        this.hasPreview,
    });

    String type;
    String view;
    String label;
    dynamic duration;
    dynamic excerpt;
    String lessonId;
    dynamic previewUrl;
    bool hasPreview;

    factory Curriculum.fromJson(Map<String, dynamic> json) => Curriculum(
        type: json["type"],
        view: json["view"] == null ? null : json["view"],
        label: json["label"] == null ? null : json["label"],
        duration: json["duration"],
        excerpt: json["excerpt"],
        lessonId: json["lesson_id"] == null ? null : json["lesson_id"],
        previewUrl: json["preview_url"],
        hasPreview: json["has_preview"] == null ? null : json["has_preview"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "view": view == null ? null : view,
        "label": label == null ? null : label,
        "duration": duration,
        "excerpt": excerpt,
        "lesson_id": lessonId == null ? null : lessonId,
        "preview_url": previewUrl,
        "has_preview": hasPreview == null ? null : hasPreview,
    };
}

class Images {
    Images({
        this.full,
        this.small,
    });

    String full;
    String small;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        full: json["full"],
        small: json["small"],
    );

    Map<String, dynamic> toJson() => {
        "full": full,
        "small": small,
    };
}

class MetaElement {
    MetaElement({
        this.type,
        this.label,
        this.text,
    });

    String type;
    String label;
    String text;

    factory MetaElement.fromJson(Map<String, dynamic> json) => MetaElement(
        type: json["type"],
        label: json["label"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "text": text,
    };
}

class Price {
    Price({
        this.free,
        this.price,
        this.oldPrice,
    });

    bool free;
    dynamic price;
    dynamic oldPrice;

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        free: json["free"],
        price: json["price"],
        oldPrice: json["old_price"],
    );

    Map<String, dynamic> toJson() => {
        "free": free,
        "price": price,
        "old_price": oldPrice,
    };
}

class LessonsRating {
    LessonsRating({
        this.average,
        this.total,
        this.percent,
        this.details,
    });

    int average;
    int total;
    int percent;
    Map<String, int> details;

    factory LessonsRating.fromJson(Map<String, dynamic> json) => LessonsRating(
        average: json["average"],
        total: json["total"],
        percent: json["percent"],
        details: Map.from(json["details"]).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "average": average,
        "total": total,
        "percent": percent,
        "details": Map.from(details).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
