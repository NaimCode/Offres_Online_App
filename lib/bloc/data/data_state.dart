part of 'data_bloc.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class DataIsLoading extends DataState {}


class DataError extends DataState {
  final dynamic error;
  DataError({
    required this.error,
  });
}

class DataGetAll extends DataState {
 final List<Organisme> organimes;
 final List<Pays> pays;
 final List<Activite> activites;
 final List<Ville> villes;
  DataGetAll({
    required this.organimes,
    required this.pays,
    required this.activites,
    required this.villes,
  });
}
