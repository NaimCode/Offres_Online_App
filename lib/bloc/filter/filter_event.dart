part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent {}

class FilterInit extends FilterEvent{}

class FilterValid extends FilterEvent{
 final List<Organisme> organimes;
 final List<Pays> pays;
 final List<Activite> activites;
 final List<Ville> villes;
  FilterValid({
    required this.organimes,
    required this.pays,
    required this.activites,
    required this.villes,
  });
}