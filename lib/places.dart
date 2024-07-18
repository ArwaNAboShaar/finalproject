import 'package:finalpro/widget/myDrawer.dart';
import 'package:finalpro/widget/myPlace.dart';
import 'package:flutter/material.dart';

import 'model/weather.dart';

class Places extends StatefulWidget {
  Places({
    this.w1,
    this.w2,
    this.w3,
    this.w4,
    this.w5,
  });

  Weather? w1;
  Weather? w2;
  Weather? w3;
  Weather? w4;
  Weather? w5;

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Places"),
        centerTitle: true,
        backgroundColor: const Color(0xFF060C31),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/background.jpg"))),
          child: Column(
            children: [
              MyPlace(
                w: widget.w1,
              ),
              SizedBox(
                height: 20,
              ),
              MyPlace(
                w: widget.w2,
              ),
              SizedBox(
                height: 20,
              ),
              MyPlace(
                w: widget.w3,
              ),
              SizedBox(
                height: 20,
              ),
              MyPlace(
                w: widget.w4,
              ),
              SizedBox(
                height: 20,
              ),
              MyPlace(
                w: widget.w5,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(
          w1: widget.w1,
          w2: widget.w2,
          w3: widget.w3,
          w4: widget.w4,
          w5: widget.w5),
    );
  }
}
