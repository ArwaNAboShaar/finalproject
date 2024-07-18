import 'package:finalpro/widget/myDrawer.dart';
import 'package:flutter/material.dart';





class Hourly extends StatefulWidget {
  const Hourly({super.key});

  @override
  State<Hourly> createState() => _HourlyState();
}

class _HourlyState extends State<Hourly> {
  @override
  Widget build(BuildContext context) {
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
                            height: 120,
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
                                  children: [Text("$index",style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 30,fontWeight: FontWeight.bold)),
                                    Text(
                                      ":00 ",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 30,fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),

                                Image.asset("assets/images/sny.jpg",height: 30,width: 30,)
                               , Text(
                                  "27 ",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),fontSize: 20
                                  ),
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
}
