import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:offres_onlines/models/activite.dart';
import 'package:offres_onlines/models/organisme.dart';
import 'package:offres_onlines/repository/data_repository.dart';

import '../../models/pays.dart';
import '../../models/ville.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository dataRepository;

  DataBloc({required this.dataRepository}) : super(DataInitial()) {
    on<DataInit>((event, emit) async {
      emit(DataIsLoading());

      try {
        Map<String, dynamic> results = await dataRepository.fakerData();
        emit(DataGetAll(
            organimes: results['organismes'],
            pays: results['pays'],
            activites: results['activites'],
            villes: results['villes']));
      } on Exception catch (e) {
        emit(DataError(error: e));
      }
    });
  }
}
