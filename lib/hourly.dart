import 'package:finalpro/widget/myDrawer.dart';
import 'package:flutter/material.dart';
import 'model/hourlyapi.dart';
import 'model/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Hourly extends StatefulWidget {
  Hourly({this.w});

  Weather? w;

  @override
  State<Hourly> createState() => _HourlyState();
}

class _HourlyState extends State<Hourly> {
  HourlyApi? resLondon;
  HourlyApi? resRafah;
  HourlyApi? resTexas;
  HourlyApi? resOslo;
  HourlyApi? resKualaLumpur;
  HourlyApi? selectedCity;

  @override
  Widget build(BuildContext context) {
    getHourlyWeather();
    String? city = widget.w?.location ?? "Rafah";
    if (city == 'Rafah') {
      selectedCity = resRafah;
    } else if (city == 'London') {
      selectedCity = resLondon;
    } else if (city == 'Texas') {
      selectedCity = resTexas;
    } else if (city == 'Oslo') {
      selectedCity = resOslo;
    } else if (city == 'Kuala Lumpur') {
      selectedCity = resKualaLumpur;
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Hourly"),
        centerTitle: true,
        backgroundColor: const Color(0xFF060C31),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.jpg"))),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 24,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            height: 170,
                            width: 380,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.4),
                                  width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("$index",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      ":00 ",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                (selectedCity?.forecast?.forecastday
                                    ?.elementAt(0).hour
                                            ?.elementAt(index)
                                            .condition
                                            ?.icon) ==
                                        null
                                    ? Image.asset(
                                        "assets/images/loading.png",
                                        height: 40,
                                        width: 40,
                                      )
                                    :
                                     Image.network(
                                        ("https:${selectedCity?.forecast?.forecastday
                                            ?.elementAt(0).hour?.elementAt(index).condition?.icon}")),

                                // (selectedCity?.forecast?.forecastday?.hour?.elementAt(index).tempC) ==
                                //     null
                                //     ?Text(""):
                                Text(
                                  "${selectedCity?.forecast?.forecastday
                      ?.elementAt(0).hour?.elementAt(index).tempC}°C",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  getHourlyWeather() async {
    try {
      resLondon = await fetchData(
          "http://api.weatherapi.com/v1/forecast.json?key=1217f06224474df594c133527240607&q=London&days=1&aqi=no&alerts=no");
      resRafah = await fetchData(
          "http://api.weatherapi.com/v1/forecast.json?key=1217f06224474df594c133527240607&q=rafah&days=1&aqi=no&alerts=no");
      resTexas = await fetchData(
          "http://api.weatherapi.com/v1/forecast.json?key=1217f06224474df594c133527240607&q=texas&days=1&aqi=no&alerts=no");
      resOslo = await fetchData(
          "http://api.weatherapi.com/v1/forecast.json?key=1217f06224474df594c133527240607&q=oslo&days=1&aqi=no&alerts=no");
      resKualaLumpur = await fetchData(
          "http://api.weatherapi.com/v1/forecast.json?key=1217f06224474df594c133527240607&q=kuala lumpur&days=1&aqi=no&alerts=no");
    } catch (e) {
    } finally {}
  }

  Future<HourlyApi> fetchData(String selectedApi) async {
    try {
      final response = await http.get(Uri.parse(selectedApi));
      if (response.statusCode == 200) {
        return HourlyApi.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("failed to load weather 1");
      }
    } catch (e) {
      print(e);
      throw Exception("failed to load weather 2");
    }
  }
}
