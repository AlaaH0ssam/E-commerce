import 'package:app/StartPage.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter/services.dart';
import 'dart:async';
class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> 
with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=> const StartPage(), ),);
    });

  }
@override
  void dispose() {  
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays:SystemUiOverlay.values);
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[Color(0xfff49c63),Colors.white ],
          begin: Alignment.topCenter ,end: AlignmentDirectional.bottomEnd ),
          ),
        child: Column( mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Icon(Icons.pets,size: 80,color: Colors.white,)
         ,SizedBox(height: 20,),Text('Happy Pet!',style: TextStyle(fontStyle: FontStyle.italic,
        color:Colors.white,fontSize: 30)
         )],
        ),
        ),
      );
    
  }
}
