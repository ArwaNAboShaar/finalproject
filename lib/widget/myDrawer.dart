import 'package:finalpro/daily.dart';
import 'package:finalpro/hourly.dart';
import 'package:finalpro/hpage.dart';
import 'package:finalpro/model/weather.dart';
import 'package:finalpro/places.dart';
import 'package:flutter/material.dart';



class MyDrawer extends StatefulWidget {
  MyDrawer({this.w1, this.w2, this.w3, this.w4, this.w5,this.sw});

  Weather? w1;
  Weather? w2;
  Weather? w3;
  Weather? w4;
  Weather? w5;
  Weather? sw;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: const Color(0xFF060C31)),
              child: Center(
                  child: Text(
                "Weather App",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
            ),
            InkWell(
              child: ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF261748),
                        fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.home,
                    size: 30,
                    color: const Color(0xFF261748),
                  )),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePageTwo();
                }));
              },
            ),
            InkWell(
              child: ListTile(
                  title: Text(
                    "Daily",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF261748),
                        fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.date_range,
                    size: 30,
                    color: const Color(0xFF261748),
                  )),
              onTap: () {
                // Get.toNamed(RouteHelper.tabletfirst);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Daily(w:widget.sw);
                }));
              },
            ),
            InkWell(
              child: ListTile(
                  title: Text(
                    "Hourly",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF261748),
                        fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.timelapse,
                    size: 30,
                    color: const Color(0xFF261748),
                  )),
              onTap: () {
                // Get.toNamed(RouteHelper.tabletfirst);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Hourly();
                }));
              },
            ),
            InkWell(
              child: ListTile(
                  title: Text(
                    "Places",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF261748),
                        fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.location_on,
                    size: 30,
                    color: const Color(0xFF261748),
                  )),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Places(
                    w1: widget.w1,
                    w2: widget.w2,
                    w3: widget.w3,
                    w4: widget.w4,
                    w5: widget.w5,
                  );
                }));
              },
            ),
          ],
        ),
        decoration: BoxDecoration(color: const Color(0xFF948BC2)),
      ),
    );
  }
}
