// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:everis_fridays_pubs_app/pub_card.dart';
import 'package:flutter/material.dart';

import 'models/pubs.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

void main() => runApp(EverisFridayApp());

class EverisFridayApp extends StatefulWidget {
  @override
  EverisFridayState createState() => EverisFridayState();
}

class EverisFridayState extends State<EverisFridayApp> {

  final List<Pubs> _listPubs = <Pubs>[];
  
Future<String>? futurePubs;
  
  @override
  void initState() {
    super.initState();
    futurePubs = getPubs(_listPubs);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Everis Fridays Pub',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Everis Fridays Pub'),
          backgroundColor: Color(0xff9aae04),
        ),
        body: Center(
          child: _buildPubs(),
        ),
      ),
    );
  }

  Widget _buildPubs() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return Container();
        }
        return ListView.builder(
          itemCount: _listPubs.length,
          itemBuilder: (context, index) {
            return PubCard(_listPubs[index]);
          },
        );
      },
      future: futurePubs,
    );
  }
}

Future<String> getPubs(_listPubs) async {
  final Response response = await http.get('http://192.168.68.111:1337/pubs');

  if (response.statusCode == 200) {
    List<dynamic> pubsListRaw = jsonDecode(response.body);
    for (var i = 0; i < pubsListRaw.length; i++) {
      _listPubs.add(Pubs.fromJson(pubsListRaw[i]));
    }

    return "Success!";
  } else {
    throw Exception('Failed to load data');
  }
}
