import 'package:flutter/material.dart';
import 'package:soccerlive/service/api_manager.dart';
import 'package:soccerlive/ui/pagebody.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  const SoccerApp({super.key});


  @override
  State<SoccerApp> createState() => _MySoccerAppState();
}

class _MySoccerAppState extends State<SoccerApp> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0.0,
        centerTitle: true,
        title: Text("SOCCERBOARD", style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: SoccerApi().getAllMatches(),
        builder: (context, snapshot){
          debugPrint("${snapshot.data}");
          if(snapshot.hasData){
            return PageBody(snapshot.data!);

          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },),
    );
  }
}
