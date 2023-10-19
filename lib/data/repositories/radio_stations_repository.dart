import 'package:labhouse_radio/data/models/stations_model.dart';
import 'package:labhouse_radio/data/providers/radios_stations_provider.dart';
import 'package:labhouse_radio/data/utils/api_client.dart';

class RadioStationsRepository 
{
  final _api = ApiClient();

  late final RadioStationsProvider _stationsProvider;

  RadioStationsRepository(){ _stationsProvider = RadioStationsProvider(_api.init()); }

  Future<List<StationsModel>> listSpainStations() async
  {
    List<StationsModel> _spainStations = [];

    try {
      final rawSpainStations = await _stationsProvider.getSpainStations();

      for (var spainStation in rawSpainStations) {
        _spainStations.add(StationsModel.fromJson(spainStation));
      }
    } catch (e) {
      throw Exception("Can't format statios: $e");
    }

    return _spainStations;
  }
}