part of 'offre_bloc.dart';

@immutable
abstract class OffreState {}

class OffreInitial extends OffreState {}

class OffreIsLoading extends OffreState {}

class OffreData extends OffreState {
  final List<Offre> offres;
  OffreData({
    required this.offres,
  });

  List<Offre> data({required String? searchText}) {
    List<Offre> data = [];
    if (searchText == null ||searchText.isEmpty) {
      data.addAll(offres);
    } else {
      data.addAll(search(text: searchText));
    }
    return data;
  }

  List<Offre> search({required String text}) {
    List<Offre> data = [];

    for (Offre offre in offres) {
      if (offre.mrchSorga != null) {
        if (offre.mrchSorga!.toLowerCase().contains(text)) {
          data.add(offre);
          continue;
        }
      }
      if (offre.mrchObjt != null) {
        if (offre.mrchObjt!.toLowerCase().contains(text)) {
          data.add(offre);
          continue;
        }
      }
      if (offre.pays != null) {
        if (offre.pays!.paysLabel!.toLowerCase().contains(text)) {
          data.add(offre);
          continue;
        }
      }
    }
    return data;
  }
}


class OffreDataFavoris extends OffreState {
  final List<Offre> offres;
  OffreDataFavoris({
    required this.offres,
  });

  List<Offre> data({required String? searchText}) {
    // List<Offre> data = [];
    // if (searchText == null ||searchText.isEmpty) {
    //   data.addAll(offres);
    // } else {
    //   data.addAll(search(text: searchText));
    // }
    return offres;
  }

  // List<Offre> search({required String text}) {
  //   List<Offre> data = [];

  //   for (Offre offre in offres) {
  //     if (offre.mrchSorga != null) {
  //       if (offre.mrchSorga!.toLowerCase().contains(text)) {
  //         data.add(offre);
  //         continue;
  //       }
  //     }
  //     if (offre.mrchObjt != null) {
  //       if (offre.mrchObjt!.toLowerCase().contains(text)) {
  //         data.add(offre);
  //         continue;
  //       }
  //     }
  //     if (offre.pays != null) {
  //       if (offre.pays!.paysLabel!.toLowerCase().contains(text)) {
  //         data.add(offre);
  //         continue;
  //       }
  //     }
  //   }
  //   return data;
  // }
}


class OffreError extends OffreState {
  final dynamic error;
  OffreError({
    required this.error,
  });
}

