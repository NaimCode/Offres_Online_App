// To parse this JSON data, do
//
//     final organisme = organismeFromJson(jsonString);

import 'dart:convert';

Organisme organismeFromJson(String str) => Organisme.fromJson(json.decode(str));

String organismeToJson(Organisme data) => json.encode(data.toJson());

class Organisme {
    Organisme({
        this.orgCode,
        this.orgLabel,
        this.orgaObsr,
        this.orgaDfeffet,
        this.orgaDdeffet,
        this.orgaLabela,
        this.nbr,
        this.id,
    });

    String ?orgCode;
    String ?orgLabel;
    String ?orgaObsr;
    dynamic orgaDfeffet;
    dynamic orgaDdeffet;
    dynamic orgaLabela;
    dynamic nbr;
    int? id;

    factory Organisme.fromJson(Map<String, dynamic> json) => Organisme(
        orgCode: json["orgCode"],
        orgLabel: json["orgLabel"] ,
        orgaObsr: json["orgaObsr"] ,
        orgaDfeffet: json["orgaDfeffet"],
        orgaDdeffet: json["orgaDdeffet"],
        orgaLabela: json["orgaLabela"],
        nbr: json["nbr"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "orgCode": orgCode,
        "orgLabel": orgLabel,
        "orgaObsr": orgaObsr,
        "orgaDfeffet": orgaDfeffet,
        "orgaDdeffet": orgaDdeffet,
        "orgaLabela": orgaLabela,
        "nbr": nbr,
        "id": id,
    };
}
