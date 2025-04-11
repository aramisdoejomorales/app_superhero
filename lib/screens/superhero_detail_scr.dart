import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroDetailScr extends StatelessWidget {
  final SuperheroDetailResponse superhero;

  const SuperheroDetailScr({super.key, required this.superhero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("<<<{ ${superhero.name} }>>>"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              superhero.url,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment(0.0, -0.5),
            ),
          ),
          Text(
            superhero.name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w300,
              color: Colors.red,
            ),
          ),
          Text(
            "Real Name: ${superhero.realName}",
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerStatsResponse.intelligence,
                        ),
                        width: 20,
                        color: Colors.blue,
                      ),
                      Text("Intelligence"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerStatsResponse.strength,
                        ),
                        width: 20,
                        color: Colors.yellowAccent,
                      ),
                      Text("Strength"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerStatsResponse.speed,
                        ),
                        width: 20,
                        color: Colors.green,
                      ),
                      Text("Speed"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerStatsResponse.durability,
                        ),
                        width: 20,
                        color: Colors.orange,
                      ),
                      Text("Durability"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerStatsResponse.power,
                        ),
                        width: 20,
                        color: Colors.red,
                      ),
                      Text("Power"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.parse(
                          superhero.powerStatsResponse.combat,
                        ),
                        width: 20,
                        color: Colors.black,
                      ),
                      Text("Combat"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
