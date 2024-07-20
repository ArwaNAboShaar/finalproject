import 'package:intl/intl.dart';
import 'package:finalpro/widget/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/dailyapi.dart';
import 'model/getCityWeather.dart';
import 'model/weather.dart';


class Daily extends StatefulWidget {
  Daily({this.w});

  Weather? w;

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  DailyApi? resLondon;
  DailyApi? resRafah;
  DailyApi? resTexas;
  DailyApi? resOslo;
  DailyApi? resKualaLumpur;
  DailyApi? selectedCity;
  String day1 = "";
  String day2 = "";
  String day3 = "";
  String day4 = "";
  String day5 = "";
  String day6 = "";
  String day7 = "";
  GetCityWeather c = GetCityWeather();

  var currDay = DateFormat('EEEE').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    if (currDay == 'Thursday') {
      day1 = 'Thursday';
      day2 = 'Friday';
      day3 = 'Saturday';
      day4 = 'Sunday';
      day5 = 'Monday';
      day6 = 'Tuesday';
      day7 = 'Wednesday';
    } else if (currDay == 'Friday') {
      day1 = 'Friday';
      day2 = 'Saturday';
      day3 = 'Sunday';
      day4 = 'Monday';
      day5 = 'Tuesday';
      day6 = 'Wednesday';
      day7 = 'Thursday';
    } else if (currDay == 'Saturday') {
      day1 = 'Saturday';
      day2 = 'Sunday';
      day3 = 'Monday';
      day4 = 'Tuesday';
      day5 = 'Wednesday';
      day6 = 'Thursday';
      day7 = 'Friday';
    } else if (currDay == 'Sunday') {
      day1 = 'Sunday';
      day2 = 'Monday';
      day3 = 'Tuesday';
      day4 = 'Wednesday';
      day5 = 'Thursday';
      day6 = 'Friday';
      day7 = 'Saturday';
    } else if (currDay == 'Monday') {
      day1 = 'Monday';
      day2 = 'Tuesday';
      day3 = 'Wednesday';
      day4 = 'Thursday';
      day5 = 'Friday';
      day6 = 'Saturday';
      day7 = 'Sunday';
    } else if (currDay == 'Tuesday') {
      day1 = 'Tuesday';
      day2 = 'Wednesday';
      day3 = 'Thursday';
      day4 = 'Friday';
      day5 = 'Saturday';
      day6 = 'Sunday';
      day7 = 'Monday';
    } else if (currDay == 'Wednesday') {
      day1 = 'Wednesday';
      day2 = 'Thursday';
      day3 = 'Friday';
      day4 = 'Saturday';
      day5 = 'Sunday';
      day6 = 'Monday';
      day7 = 'Tuesday';
    }
    List days = [day1, day2, day3, day4, day5, day6, day7];
    getDailyWeather();
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
    c.getWeather();
    Weather rafah = Weather(
        location: "Rafah",
        img: c.resRafah?.current?.condition?.icon,
        states: c.resRafah?.current?.condition?.text.toString() ?? "",
        temp: c.resRafah?.current?.tempC);
    Weather london = Weather(
        location: "London",
        img: c.resLondon?.current?.condition?.icon,
        states: c.resLondon?.current?.condition?.text.toString() ?? "",
        temp: c.resLondon?.current?.tempC);
    Weather texas = Weather(
        location: "Texas",
        img: c.resTexas?.current?.condition?.icon,
        states: c.resTexas?.current?.condition?.text.toString() ?? "",
        temp: c.resTexas?.current?.tempC);
    Weather oslo = Weather(
        location: "Oslo",
        img: c.resOslo?.current?.condition?.icon,
        states: c.resOslo?.current?.condition?.text.toString() ?? "",
        temp: c.resOslo?.current?.tempC);
    Weather kualaLumpur = Weather(
        location: "Kuala Lumpur",
        img: c.resKualaLumpur?.current?.condition?.icon,
        states: c.resKualaLumpur?.current?.condition?.text.toString() ?? "",
        temp: c.resKualaLumpur?.current?.tempC);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text("Daily"),
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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 17, horizontal: 10),
                            height: 200,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          days[index] ?? "Day ${index}",
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Hight ",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 20),
                                    ),
                                    (selectedCity?.forecast?.forecastday
                                        ?.elementAt(index)
                                        .day
                                        ?.maxtempC) ==
                                        null
                                        ?Text(""):
                                    Text(
                                      "${selectedCity?.forecast?.forecastday?.elementAt(index).day?.maxtempC}°C",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Low ",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 20),
                                    ),

                                    (selectedCity?.forecast?.forecastday
                                        ?.elementAt(index)
                                        .day
                                        ?.mintempC) ==
                                        null
                                        ?Text(""):
                                    Text(
                                      "${selectedCity?.forecast?.forecastday?.elementAt(index).day?.mintempC}°C",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                                (selectedCity?.forecast?.forecastday
                                            ?.elementAt(index)
                                            .day
                                            ?.condition
                                            ?.icon) ==
                                        null
                                    ? Image.asset(
                                        "assets/images/loading.png",
                                        height: 40,
                                        width: 40,
                                      )
                                    : Image.network(
                                        ("https:${selectedCity?.forecast?.forecastday?.elementAt(index).day?.condition?.icon}"))
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
      drawer: MyDrawer( w1: rafah,
          w2: london,
          w3: texas,
          w4: oslo,
          w5: kualaLumpur,
          sw: widget.w),
    );
  }

  getDailyWeather() async {
    try {
      resLondon = await fetchData(
          "http://api.weatherapi.com/v1/forecast.json?key=1217f06224474df594c133527240607&q=London&days=5&aqi=no&alerts=no");
      resRafah = await fetchData(
          "http://api.weatherapi.com/v1/forecast.json?key=1217f06224474df594c133527240607&q=rafah&days=5&aqi=no&alerts=no");
      resTexas = await fetchData(
          "http://api.weatherapi.com/v1/forecast.json?key=1217f06224474df594c133527240607&q=texas&days=5&aqi=no&alerts=no");
      resOslo = await fetchData(
          "http://api.weatherapi.com/v1/forecast.json?key=1217f06224474df594c133527240607&q=oslo&days=5&aqi=no&alerts=no");
      resKualaLumpur = await fetchData(
          "http://api.weatherapi.com/v1/forecast.json?key=1217f06224474df594c133527240607&q=kuala lumpur&days=5&aqi=no&alerts=no");
    } catch (e) {
    } finally {}
  }

  Future<DailyApi> fetchData(String selectedApi) async {
    try {
      final response = await http.get(Uri.parse(selectedApi));
      if (response.statusCode == 200) {
        return DailyApi.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("failed to load weather 1");
      }
    } catch (e) {
      print(e);
      throw Exception("failed to load weather 2");
    }
  }
}
