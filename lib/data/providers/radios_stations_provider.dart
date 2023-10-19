import 'package:dio/dio.dart';

class RadioStationsProvider 
{
  Dio api;

  RadioStationsProvider(this.api);

  Future<dynamic> getSpainStations() async
  {
    try {
      var resp = await api.get('/stations/bycountry/spain');

      return resp.data;
    } catch (e) {
      throw Exception("Can't load stations: \n$e");
    }
  }  
}