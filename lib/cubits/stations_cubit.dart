import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labhouse_radio/data/models/stations_model.dart';
import 'package:labhouse_radio/data/repositories/radio_stations_repository.dart';

part 'stations_state.dart';

class StationsCubit extends Cubit<StationsState> 
{
  StationsCubit() : super(StationsInitial());

  final _stationsRepository = RadioStationsRepository();

  Future<void> loadSpainStations() async
  {
    emit(StationsLoading());
    List<StationsModel>? spainStations;

    try {

      spainStations = await _stationsRepository.listSpainStations();
      emit(StationsLoaded(spainStations));

    } catch (e) {
      emit(StationsError(message: e.toString()));
    }
  }  
}
