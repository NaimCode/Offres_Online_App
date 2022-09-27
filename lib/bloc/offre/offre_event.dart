part of 'offre_bloc.dart';

@immutable
abstract class OffreEvent {}


class OffreEventGetAll extends OffreEvent{}


class OffreFilter extends OffreEvent {
  final Filter filter;
  OffreFilter({
    required this.filter,
  });
}

