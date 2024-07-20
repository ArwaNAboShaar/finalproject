import 'package:finalpro/model/weather.dart';
import 'package:finalpro/model/weatherapi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class GetCityWeather{
  WeatherApi? resLondon ;
  WeatherApi? resRafah;
  WeatherApi? resTexas;
  WeatherApi? resOslo;
  WeatherApi? resKualaLumpur;
  getWeather() async {

    try {
      resLondon = await fetchData(
          "http://api.weatherapi.com/v1/current.json?key=1217f06224474df594c133527240607&q=London&aqi=no");
      resRafah = await fetchData(
          "http://api.weatherapi.com/v1/current.json?key=1217f06224474df594c133527240607&q=rafah&aqi=no");
      resTexas = await fetchData(
          "http://api.weatherapi.com/v1/current.json?key=1217f06224474df594c133527240607&q=texas&aqi=no");
      resOslo = await fetchData(
          "http://api.weatherapi.com/v1/current.json?key=1217f06224474df594c133527240607&q=oslo&aqi=no");
      resKualaLumpur = await fetchData(
          "http://api.weatherapi.com/v1/current.json?key=1217f06224474df594c133527240607&q=Kuala Lumpur&aqi=no");
    } catch (e) {
    } finally {

    }
  }
  Future<WeatherApi> fetchData(String selectedApi) async {
    try {
      final response = await http.get(Uri.parse(selectedApi));
      if (response.statusCode == 200) {
        return WeatherApi.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("failed to load weather 1");
      }
    } catch (e) {
      print(e);
      throw Exception("failed to load weather 2");
    }
  }

}

