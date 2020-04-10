import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  String type;
  String numberOfCase;

  InfoCard({
    @required this.type,
    this.numberOfCase = "0",
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: this.type == "kasus"
            ? Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffffdd94),
                    ),
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.add,
                      size: 12,
                      color: Colors.orange,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      this.numberOfCase.toString(),
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    "KASUS",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            : this.type == "sembuh"
                ? Column(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.greenAccent,
                      ),
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.person,
                        size: 12,
                        color: Colors.green,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        this.numberOfCase.toString(),
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      "SEMBUH",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ])
                : Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xfffcb7a7),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.close,
                          size: 12,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          this.numberOfCase.toString(),
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        "WAFAT",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
