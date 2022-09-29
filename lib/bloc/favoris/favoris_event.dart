part of 'favoris_bloc.dart';

abstract class FavorisEvent {}


class FavorisGet extends FavorisEvent {
  final List ids;
  FavorisGet({
    required this.ids,
  });
}
