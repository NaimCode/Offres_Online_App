part of 'offre_bloc.dart';

@immutable
abstract class OffreEvent {}


class OffreEventGetAll extends OffreEvent{}

class OffreSearch extends OffreEvent {
  final String text;
  OffreSearch({
    required this.text,
  });
}
