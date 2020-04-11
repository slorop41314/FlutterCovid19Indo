import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  String type;
  int numberOfCase;
  int gapYesterday;

  InfoCard({@required this.type, this.numberOfCase = 0, this.gapYesterday});
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
                      color: Color(0xff66deff),
                    ),
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.add,
                      size: 12,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      this.numberOfCase.toString(),
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    "KASUS",
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  this.gapYesterday == null
                      ? Container()
                      : Column(
                          children: <Widget>[
                            Divider(
                              indent: 8,
                              endIndent: 8,
                            ),
                            Text(
                              "+ $gapYesterday",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "today",
                              style: TextStyle(fontSize: 8),
                            )
                          ],
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
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        this.numberOfCase.toString(),
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      "SEMBUH",
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                    this.gapYesterday == null
                        ? Container()
                        : Column(
                            children: <Widget>[
                              Divider(
                                indent: 8,
                                endIndent: 8,
                              ),
                              Text(
                                "+ $gapYesterday",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "today",
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                  ])
                : this.type == "wafat"
                    ? Column(
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
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              this.numberOfCase.toString(),
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            "WAFAT",
                            style: TextStyle(
                              fontSize: 8,
                            ),
                          ),
                          this.gapYesterday == null
                              ? Container()
                              : Column(
                                  children: <Widget>[
                                    Divider(
                                      indent: 8,
                                      endIndent: 8,
                                    ),
                                    Text(
                                      "+ $gapYesterday",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "today",
                                      style: TextStyle(fontSize: 8),
                                    )
                                  ],
                                ),
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffffdd94),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.healing,
                              size: 12,
                              color: Colors.orange,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              this.numberOfCase.toString(),
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            "DIRAWAT",
                            style: TextStyle(
                              fontSize: 8,
                            ),
                          ),
                          this.gapYesterday == null
                              ? Container()
                              : Column(
                                  children: <Widget>[
                                    Divider(
                                      indent: 8,
                                      endIndent: 8,
                                    ),
                                    Text(
                                      "+ $gapYesterday",
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "today",
                                      style: TextStyle(fontSize: 8),
                                    )
                                  ],
                                ),
                        ],
                      ),
      ),
    );
  }
}
