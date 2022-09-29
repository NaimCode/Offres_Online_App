import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'favoris_event.dart';
part 'favoris_state.dart';

class FavorisBloc extends Bloc<FavorisEvent, FavorisState> {
  FavorisBloc() : super(FavorisInitial()) {
    on<FavorisGet>((event, emit) {
      // TODO: implement event handler
    });
  }
}



class FavorisGet extends FavorisEvent {
  final List ids;
  FavorisGet({
    required this.ids,
  });
}


class FavorisError extends FavorisState {
  final dynamic error;
  FavorisError({
    required this.error,
  });
}
