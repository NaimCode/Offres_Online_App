part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {
 final List<Organisme> organimes=[];
//  final List<Pays> pays;
 final List<Activite> activites=[];
 final List<Ville> villes=[];
}



class FilterIsLoading extends FilterState {}


class FilterError extends FilterState {
  final dynamic error;
  FilterError({
    required this.error,
  });
}

class FilterData extends FilterState {
 final List<Organisme> organimes;
//  final List<Pays> pays;
 final List<Activite> activites;
 final List<Ville> villes;
  FilterData({
    required this.organimes,
    // required this.pays,
    required this.activites,
    required this.villes,
  });
}
