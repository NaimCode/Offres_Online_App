part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}



class FilterIsLoading extends FilterState {}


class FilterError extends FilterState {
  final dynamic error;
  FilterError({
    required this.error,
  });
}

class FilterGetAll extends FilterState {

}
