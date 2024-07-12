import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:soccerlive/ui/soccermodel.dart';

class SoccerApi{

  final String apiUrl = "https://v3.football.api-sports.io/fixtures?live=all";

  static const api_Key = "2c3fa9f813361a756b8021d88c3f60fe";

  static const headers = { 'x-rapidapi-key': '$api_Key','x-rapidapi-host': "v3.football.api-sports.io"};


  Future<List<SoccerMatch>?> getAllMatches() async {

    Uri uri = Uri.parse(apiUrl);

    Response res = await get(uri, headers: headers);

    var body;
    debugPrint("API SERVICE: ${res.statusCode}");


    if(res.statusCode == 200){
      body = jsonDecode(res.body);

      List<dynamic> matchesList = body['response'];

      debugPrint("API SERVICE: ${body}");

      try{
        List<SoccerMatch> matches = matchesList.map((dynamic item) => SoccerMatch.fromJson(item)).toList();
            return matches;

      }catch(ex){
        debugPrint("API Error: ${ex.toString()}");

      }
    
    }

    


  }



}