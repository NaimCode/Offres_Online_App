// To parse this JSON data, do
//
//     final pays = paysFromJson(jsonString);

import 'dart:convert';

Pays paysFromJson(String str) => Pays.fromJson(json.decode(str));

String paysToJson(Pays data) => json.encode(data.toJson());

class Pays {
    Pays({
        this.paysCode,
        this.paysLabel,
        this.payObsr,
        this.paylabela,
        this.nbr,
        this.id,
    });

    String? paysCode;
    String? paysLabel;
    String? payObsr;
    String? paylabela;
    dynamic nbr;
    int? id;

   
    factory Pays.fromJson(Map<String, dynamic> json) => Pays(
        paysCode: json["paysCode"],
        paysLabel: json["paysLabel"],
        payObsr: json["payObsr"] ,
        paylabela: json["paylabela"],
        nbr: json["nbr"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "paysCode": paysCode,
        "paysLabel": paysLabel,
        "payObsr": payObsr,
        "paylabela": paylabela,
        "nbr": nbr,
        "id": id,
    };
}
