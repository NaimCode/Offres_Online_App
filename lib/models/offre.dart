// To parse this JSON data, do
//
//     final offre = offreFromJson(jsonString?);

import 'dart:convert';

Offre offreFromJson(String? str) => Offre.fromJson(json.decode(str!));

String? offreToJson(Offre data) => json.encode(data.toJson());

class Offre {
    Offre({
        this.mrchSttt,
        this.mrchCps,
        this.mrchObs1,
        this.mrchAvrr,
        this.mrchType,
        this.mrchAvis,
        this.mrchPrcp,
        this.mrchDelx,
        this.mrchCutn,
        this.mrchCprv,
        this.mrchNorg,
        this.mrchDdpt,
        this.mrchMret,
        this.mrchNppl,
        this.mrchCntc,
        this.mrchImgm,
        this.mrchSorg,
        this.mrchVisl,
        this.mrchId,
        this.mrchEtat,
        this.mrchDrss,
        this.mrchObsr,
        this.mrchObs3,
        this.mrchObs4,
        this.mrchObjt,
        this.mrchDatder,
        this.mrchNppla,
        this.mrchLots,
        this.mrchDlmt,
        this.mrchDren,
        this.mrchObjta,
        this.mrchHlmt,
        this.mrchDovr,
        this.mrchDssi,
        this.mrchPrtc,
        this.mrchRc,
        this.mrchMpem,
        this.mrchVisla,
        this.mrchSorga,
        this.idCat,
        this.mrchObsra,
        this.mrchMpema,
        this.mrchLotsa,
        this.mrchDrssa,
        this.mrchDelxa,
        this.idPays,
        this.mrchDechant,
        this.mrchNorga,
        this.mrchCntca,
        this.mrchDlmavant,
        this.mrchHeuravant,
    });

    String? mrchSttt;
    String? mrchCps;
    dynamic mrchObs1;
    dynamic mrchAvrr;
    String? mrchType;
    String? mrchAvis;
    String? mrchPrcp;
    dynamic mrchDelx;
    String? mrchCutn;
    String? mrchCprv;
    String? mrchNorg;
    dynamic mrchDdpt;
    dynamic mrchMret;
    String? mrchNppl;
    String? mrchCntc;
    dynamic mrchImgm;
    String? mrchSorg;
    dynamic mrchVisl;
    int? mrchId;
    String? mrchEtat;
    String? mrchDrss;
    String? mrchObsr;
    String? mrchObs3;
    String? mrchObs4;
    String? mrchObjt;
    DateTime? mrchDatder;
    String? mrchNppla;
    String? mrchLots;
    DateTime? mrchDlmt;
    dynamic mrchDren;
    String? mrchObjta;
    String? mrchHlmt;
    dynamic mrchDovr;
    DateTime? mrchDssi;
    String? mrchPrtc;
    String? mrchRc;
    dynamic mrchMpem;
    dynamic mrchVisla;
    String? mrchSorga;
    int? idCat;
    String? mrchObsra;
    String? mrchMpema;
    String? mrchLotsa;
    String? mrchDrssa;
    dynamic mrchDelxa;
    int? idPays;
    dynamic mrchDechant;
    dynamic mrchNorga;
    String? mrchCntca;
    dynamic mrchDlmavant;
    dynamic mrchHeuravant;

    factory Offre.fromJson(Map<String?, dynamic> json) => Offre(
        mrchSttt: json["mrch_STTT"],
        mrchCps: json["mrch_CPS"],
        mrchObs1: json["mrch_OBS1"],
        mrchAvrr: json["mrch_AVRR"],
        mrchType: json["mrch_TYPE"],
        mrchAvis: json["mrch_AVIS"],
        mrchPrcp: json["mrch_PRCP"],
        mrchDelx: json["mrch_DELX"],
        mrchCutn: json["mrch_CUTN"],
        mrchCprv: json["mrch_CPRV"],
        mrchNorg: json["mrch_NORG"],
        mrchDdpt: json["mrch_DDPT"],
        mrchMret: json["mrch_MRET"],
        mrchNppl: json["mrch_NPPL"],
        mrchCntc: json["mrch_CNTC"],
        mrchImgm: json["mrch_IMGM"],
        mrchSorg: json["mrch_SORG"],
        mrchVisl: json["mrch_VISL"],
        mrchId: json["mrch_ID"] ,
        mrchEtat: json["mrch_ETAT"],
        mrchDrss: json["mrch_DRSS"],
        mrchObsr: json["mrch_OBSR"],
        mrchObs3: json["mrch_OBS3"],
        mrchObs4: json["mrch_OBS4"],
        mrchObjt: json["mrch_OBJT"],
        mrchDatder: json["mrch_DATDER"] == null ? null : DateTime.parse(json["mrch_DATDER"]),
        mrchNppla: json["mrch_NPPLA"],
        mrchLots: json["mrch_LOTS"],
        mrchDlmt: json["mrch_DLMT"] == null ? null : DateTime.parse(json["mrch_DLMT"]),
        mrchDren: json["mrch_DREN"],
        mrchObjta: json["mrch_OBJTA"],
        mrchHlmt: json["mrch_HLMT"],
        mrchDovr: json["mrch_DOVR"],
        mrchDssi: json["mrch_DSSI"] == null ? null : DateTime.parse(json["mrch_DSSI"]),
        mrchPrtc: json["mrch_PRTC"],
        mrchRc: json["mrch_RC"],
        mrchMpem: json["mrch_MPEM"],
        mrchVisla: json["mrch_VISLA"],
        mrchSorga: json["mrch_SORGA"],
        idCat: json["id_CAT"],
        mrchObsra: json["mrch_OBSRA"],
        mrchMpema: json["mrch_MPEMA"],
        mrchLotsa: json["mrch_LOTSA"],
        mrchDrssa: json["mrch_DRSSA"],
        mrchDelxa: json["mrch_DELXA"],
        idPays: json["id_PAYS"],
        mrchDechant: json["mrch_DECHANT"],
        mrchNorga: json["mrch_NORGA"],
        mrchCntca: json["mrch_CNTCA"],
        mrchDlmavant: json["mrch_DLMAVANT"],
        mrchHeuravant: json["mrch_HEURAVANT"],
    );

    Map<String?, dynamic> toJson() => {
        "mrch_STTT": mrchSttt,
        "mrch_CPS": mrchCps,
        "mrch_OBS1": mrchObs1,
        "mrch_AVRR": mrchAvrr,
        "mrch_TYPE": mrchType,
        "mrch_AVIS": mrchAvis,
        "mrch_PRCP": mrchPrcp,
        "mrch_DELX": mrchDelx,
        "mrch_CUTN": mrchCutn,
        "mrch_CPRV": mrchCprv,
        "mrch_NORG": mrchNorg,
        "mrch_DDPT": mrchDdpt,
        "mrch_MRET": mrchMret,
        "mrch_NPPL": mrchNppl,
        "mrch_CNTC": mrchCntc,
        "mrch_IMGM": mrchImgm,
        "mrch_SORG": mrchSorg,
        "mrch_VISL": mrchVisl,
        "mrch_ID": mrchId,
        "mrch_ETAT": mrchEtat,
        "mrch_DRSS": mrchDrss,
        "mrch_OBSR": mrchObsr,
        "mrch_OBS3": mrchObs3,
        "mrch_OBS4": mrchObs4,
        "mrch_OBJT": mrchObjt,
        "mrch_DATDER": mrchDatder == null ? null : mrchDatder?.toIso8601String != null,
        "mrch_NPPLA": mrchNppla,
        "mrch_LOTS": mrchLots,
        "mrch_DLMT": mrchDlmt == null ? null : mrchDlmt?.toIso8601String != null,
        "mrch_DREN": mrchDren,
        "mrch_OBJTA": mrchObjta,
        "mrch_HLMT": mrchHlmt,
        "mrch_DOVR": mrchDovr,
        "mrch_DSSI": mrchDssi == null ? null : mrchDssi?.toIso8601String != null,
        "mrch_PRTC": mrchPrtc,
        "mrch_RC": mrchRc,
        "mrch_MPEM": mrchMpem,
        "mrch_VISLA": mrchVisla,
        "mrch_SORGA": mrchSorga,
        "id_CAT": idCat,
        "mrch_OBSRA": mrchObsra,
        "mrch_MPEMA": mrchMpema,
        "mrch_LOTSA": mrchLotsa,
        "mrch_DRSSA": mrchDrssa,
        "mrch_DELXA": mrchDelxa,
        "id_PAYS": idPays,
        "mrch_DECHANT": mrchDechant,
        "mrch_NORGA": mrchNorga,
        "mrch_CNTCA": mrchCntca,
        "mrch_DLMAVANT": mrchDlmavant,
        "mrch_HEURAVANT": mrchHeuravant,
    };
}
