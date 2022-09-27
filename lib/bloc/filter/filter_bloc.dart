import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/activite.dart';
import '../../models/organisme.dart';
import '../../models/pays.dart';
import '../../models/ville.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterInit>((event, emit) {
  emit(FilterData(organimes: const [], activites: const [], villes: const []));
    });
    on<FilterValid>((event, emit) {
      emit(FilterData(organimes: event.organimes, activites: event.activites, villes: event.villes));
    });
  }
}
