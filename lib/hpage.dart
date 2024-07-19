import 'package:finalpro/widget/myDrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:finalpro/model/weather.dart';
import 'package:flutter/material.dart';
import 'model/weatherapi.dart';

class HomePageTwo extends StatefulWidget {
  HomePageTwo({this.w});

  Weather? w;

  @override
  State<HomePageTwo> createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> {
  WeatherApi? resLondon;
  WeatherApi? resRafah;
  WeatherApi? resTexas;
  WeatherApi? resOslo;
  WeatherApi? resKualaLumpur;
  @override

  @override
  Widget build(BuildContext context) {
    getWeather();
    Weather rafah = Weather(
        location: "Rafah",
        img: resRafah?.current?.condition?.icon,
        states: resRafah?.current?.condition?.text.toString() ?? "",
        temp: resRafah?.current?.tempC);
    Weather london = Weather(
        location: "London",
        img: resLondon?.current?.condition?.icon,
        states: resLondon?.current?.condition?.text.toString() ?? "",
        temp: resLondon?.current?.tempC);
    Weather texas = Weather(
        location: "Texas",
        img: resTexas?.current?.condition?.icon,
        states: resTexas?.current?.condition?.text.toString() ?? "",
        temp: resTexas?.current?.tempC);
    Weather oslo = Weather(
        location: "Oslo",
        img: resOslo?.current?.condition?.icon,
        states: resOslo?.current?.condition?.text.toString() ?? "",
        temp: resOslo?.current?.tempC);
    Weather kualaLumpur = Weather(
        location: "Kuala Lumpur",
        img: resKualaLumpur?.current?.condition?.icon,
        states: resKualaLumpur?.current?.condition?.text.toString() ?? "",
        temp: resKualaLumpur?.current?.tempC);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: Text("Weather App"),
          centerTitle: true,
          backgroundColor: const Color(0xFF060C31),
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/background.jpg"))),
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        (widget.w) == null ? "Rafah" : "${widget.w?.location}",
                        style: TextStyle(
                            fontSize: 37,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  (rafah.img == null) && (widget.w?.img == null)
                      ? Image.asset(
                          "assets/images/loading.png",
                          height: 100,
                          width: 100,
                        )
                      :
                  Image.network(
                          ("https:${(widget.w) == null ? rafah.img : widget.w?.img}")
                              .replaceAll("64x64", "128x128"),
                          scale: 0.7,
                          height: 200,
                        ),

                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    (widget.w) == null
                        ? "${rafah.states}"
                        : "${widget.w?.states}",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  (rafah.temp==null) && (widget.w?.temp==null)?
                  Text(""):
                  Text(
                    (widget.w) == null
                        ? "${rafah.temp}°C"
                        : "${widget.w?.temp}°C",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
        drawer: MyDrawer(
            w1: rafah,
            w2: london,
            w3: texas,
            w4: oslo,
            w5: kualaLumpur,
            sw: widget.w));
  }

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
