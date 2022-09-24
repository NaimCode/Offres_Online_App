part of 'offre_bloc.dart';

@immutable
abstract class OffreState {}

class OffreInitial extends OffreState {}

class OffreIsLoading extends OffreState{}

class OffreData extends OffreState {

  final List<Offre> offres;
  OffreData({
    required this.offres,
  });

}


class OffreError extends OffreState {
  final dynamic error;
  OffreError({
    required this.error,
  });

}
