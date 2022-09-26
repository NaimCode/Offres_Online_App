// To parse this JSON data, do
//
//     final ville = villeFromJson(jsonString);

import 'dart:convert';

Ville villeFromJson(String str) => Ville.fromJson(json.decode(str));

String villeToJson(Ville data) => json.encode(data.toJson());

class Ville {
    Ville({
        this.villId,
        this.villCode,
        this.villLabel,
        this.payeId,
        this.nbre,
    });

    int? villId;
    String? villCode;
    String? villLabel;
    int? payeId;
    int? nbre;

    
    factory Ville.fromJson(Map<String, dynamic> json) => Ville(
        villId: json["VILL_ID"],
        villCode: json["VILL_CODE"],
        villLabel: json["VILL_LABEL"],
        payeId: json["PAYE_ID"],
        nbre: json["NBRE"],
    );

    Map<String, dynamic> toJson() => {
        "VILL_ID": villId ,
        "VILL_CODE": villCode,
        "VILL_LABEL": villLabel,
        "PAYE_ID": payeId,
        "NBRE": nbre,
    };
}
