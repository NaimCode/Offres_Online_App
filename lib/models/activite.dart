// To parse this JSON data, do
//
//     final activite = activiteFromJson(jsonString);

import 'dart:convert';

Activite activiteFromJson(String str) => Activite.fromJson(json.decode(str));

String activiteToJson(Activite data) => json.encode(data.toJson());

class Activite {
    Activite({
        this.activId,
        this.activCcls,
        this.activLabel,
    });

    int? activId;
    String? activCcls;
    String? activLabel;

   

    factory Activite.fromJson(Map<String, dynamic> json) => Activite(
        activId: json["activId"],
        activCcls: json["activCcls"],
        activLabel: json["activLabel"],
    );

    Map<String, dynamic> toJson() => {
        "activId": activId,
        "activCcls": activCcls,
        "activLabel": activLabel,
    };
}
