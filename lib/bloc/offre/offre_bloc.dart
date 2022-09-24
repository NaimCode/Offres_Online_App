import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offres_onlines/repository/offre_repository.dart';
import '../../models/offre.dart';
part 'offre_event.dart';
part 'offre_state.dart';

class OffreBloc extends Bloc<OffreEvent, OffreState> {
  final OffreRepository offreRepository;
  OffreBloc({required this.offreRepository}) : super(OffreInitial()) {
    on<OffreEvent>((event, emit) {});
    on<OffreEventGetAll>(((event, emit) async {
      emit(OffreIsLoading());
      try {
        List<Offre> offres = await offreRepository.fakerOffres();
        emit(OffreData(offres: offres));
      } on Exception catch (e) {
        emit(OffreError(error: e));
      }
    }));
  }
}
