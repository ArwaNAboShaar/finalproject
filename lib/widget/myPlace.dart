import 'package:finalpro/hpage.dart';
import 'package:finalpro/model/weather.dart';
import 'package:flutter/material.dart';

class MyPlace extends StatefulWidget {
  MyPlace({this.w});

  Weather? w;

  @override
  State<MyPlace> createState() => _MyPlaceState();
}

class _MyPlaceState extends State<MyPlace> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 100,
            width: 380,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.4), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.w == null ? "city" : "${widget?.w?.location}",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 30),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(widget.w == null ? "" : "${widget?.w?.temp}°C",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7), fontSize: 24))
                  ],
                ),
                (widget.w?.img) ==
                    null
                    ? Image.asset(
                  "assets/images/loading.png",
                  height: 40,
                  width: 40,
                )
                    :
                Image.network(
                  ("https:${widget.w?.img}"),
                  scale: 0.7,
                  height: 70,
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePageTwo(
            w: widget.w,
          );
        }));
      },
    );
  }
}
