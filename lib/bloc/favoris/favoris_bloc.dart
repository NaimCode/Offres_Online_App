import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/offre.dart';
import '../../repository/offre_repository.dart';




part 'favoris_event.dart';

class FavorisBloc extends Bloc<FavorisEvent, FavorisState> {
   final OffreRepository offreRepository;
  FavorisBloc({required this.offreRepository}) : super(FavorisInitial()) {
    on<FavorisGet>((event, emit) async{
          emit(FavorisLoading());
      try {
        List<Offre> offres = await offreRepository.fakerOffresFavoris(ids: event.ids);
        emit(FavorisData(offres: offres));
      } on Exception catch (e) {
        emit(FavorisError(error: e));
      }
    });
  }
}







abstract class FavorisState {}

class FavorisInitial extends FavorisState {}


class FavorisData extends FavorisState {
 final List<Offre> offres;
  FavorisData({
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


class FavorisError extends FavorisState {
  final dynamic error;
  FavorisError({
    required this.error,
  });
}

class FavorisLoading extends FavorisState {
  
}