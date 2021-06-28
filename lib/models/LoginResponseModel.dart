// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
        this.data,
        this.id,
        this.caps,
        this.capKey,
        this.roles,
        this.allcaps,
        this.filter,
    });

    Data data;
    int id;
    Caps caps;
    String capKey;
    List<String> roles;
    Map<String, bool> allcaps;
    dynamic filter;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        data: Data.fromJson(json["data"]),
        id: json["ID"],
        caps: Caps.fromJson(json["caps"]),
        capKey: json["cap_key"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        allcaps: Map.from(json["allcaps"]).map((k, v) => MapEntry<String, bool>(k, v)),
        filter: json["filter"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "ID": id,
        "caps": caps.toJson(),
        "cap_key": capKey,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "allcaps": Map.from(allcaps).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "filter": filter,
    };
}

class Caps {
    Caps({
        this.admin,
        this.bbpParticipant,
        this.aap,
    });

    bool admin;
    bool bbpParticipant;
    bool aap;

    factory Caps.fromJson(Map<String, dynamic> json) => Caps(
        admin: json["admin"],
        bbpParticipant: json["bbp_participant"],
        aap: json["aap"],
    );

    Map<String, dynamic> toJson() => {
        "admin": admin,
        "bbp_participant": bbpParticipant,
        "aap": aap,
    };
}

class Data {
    Data({
        this.id,
        this.userLogin,
        this.userPass,
        this.userNicename,
        this.userEmail,
        this.userUrl,
        this.userRegistered,
        this.userActivationKey,
        this.userStatus,
        this.displayName,
    });

    String id;
    String userLogin;
    String userPass;
    String userNicename;
    String userEmail;
    String userUrl;
    DateTime userRegistered;
    String userActivationKey;
    String userStatus;
    String displayName;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        userLogin: json["user_login"],
        userPass: json["user_pass"],
        userNicename: json["user_nicename"],
        userEmail: json["user_email"],
        userUrl: json["user_url"],
        userRegistered: DateTime.parse(json["user_registered"]),
        userActivationKey: json["user_activation_key"],
        userStatus: json["user_status"],
        displayName: json["display_name"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "user_login": userLogin,
        "user_pass": userPass,
        "user_nicename": userNicename,
        "user_email": userEmail,
        "user_url": userUrl,
        "user_registered": userRegistered.toIso8601String(),
        "user_activation_key": userActivationKey,
        "user_status": userStatus,
        "display_name": displayName,
    };
}
