// To parse this JSON data, do
//
//     final reviews = reviewsFromJson(jsonString);

import 'dart:convert';

Reviews reviewsFromJson(String str) => Reviews.fromJson(json.decode(str));

String reviewsToJson(Reviews data) => json.encode(data.toJson());

class Reviews {
    Reviews({
        this.posts,
        this.total,
    });

    List<Post> posts;
    bool total;

    factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "total": total,
    };
}

class Post {
    Post({
        this.user,
        this.avatarUrl,
        this.time,
        this.title,
        this.content,
        this.mark,
    });

    String user;
    String avatarUrl;
    String time;
    String title;
    String content;
    int mark;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        user: json["user"],
        avatarUrl: json["avatar_url"],
        time: json["time"],
        title: json["title"],
        content: json["content"],
        mark: json["mark"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "avatar_url": avatarUrl,
        "time": time,
        "title": title,
        "content": content,
        "mark": mark,
    };
}
