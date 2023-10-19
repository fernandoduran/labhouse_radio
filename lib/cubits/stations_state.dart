part of 'stations_cubit.dart';

abstract class StationsState extends Equatable 
{
  @override
  List<Object> get props => [];

  List<StationsModel>? get stations => null;
}

class StationsInitial extends StationsState {}
class StationsLoading extends StationsState {}

class StationsLoaded extends StationsState 
{
  @override
  final List<StationsModel>? stations;


  StationsLoaded(this.stations);  
}

class StationsError extends StationsState
{
  final String? message;

  StationsError({this.message});
}