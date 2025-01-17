
import 'package:flutter/material.dart';
import 'package:soccerlive/ui/soccermodel.dart';

Widget matchTile(SoccerMatch match){
  
  return Container(
    margin: EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Text(match.home.name, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16.0,),)),
        Image.network(match.home.logoUrl, width: 36.0,),
        Expanded(child: Text("${match.goal.home} - ${match.goal.away}", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16.0,),)),
        Image.network(match.away.logoUrl, width: 36.0,),
        Expanded(child: Text(match.away.name, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16.0,),)),

      ],
    ),
  );
}