import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selling_meter_app/app.dart';
import 'package:selling_meter_app/scrollBar.dart';

import 'authentication/SIgnInScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      "https://firebasestorage.googleapis.com/v0/b/marcaa-e31c9.appspot.com/o/RP-EXT-12.jpeg?alt=media&token=c1b27138-74b4-4817-a183-833dcab0188f",
      "https://firebasestorage.googleapis.com/v0/b/marcaa-e31c9.appspot.com/o/image_2.jpeg?alt=media&token=ac35d5cd-ce69-4943-9470-d86420a03f3f",
      "https://firebasestorage.googleapis.com/v0/b/marcaa-e31c9.appspot.com/o/image_3.jpeg?alt=media&token=3539e44b-f9f0-42af-a12d-a163ce2a4633",
      "https://firebasestorage.googleapis.com/v0/b/marcaa-e31c9.appspot.com/o/image_4.jpeg?alt=media&token=b470373f-4a13-492c-9de0-af007b73417b"
    ];

    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: true,
              autoPlay: true,
            ),
            items: imageList
                .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Container(
                              child: Image.network(e, fit: BoxFit.fill),
                              padding:
                                  const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0))
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Welcome to Royal Phular",
            style: TextStyle(
              color: Color(0xff123456),
            ),
          ),
        ),
        const Expanded(child: MyScrollBarWidget())
      ],
    ));
  }
}
