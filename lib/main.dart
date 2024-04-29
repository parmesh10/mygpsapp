import 'package:flutter/material.dart';
//import 'get_gps.dart';
import 'gps_class.dart';
import 'splash_screen.dart';

const primaryColor = Color.fromARGB(255, 4, 211, 22);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home: const HomeScreen(),
      title: 'DATA LOGGER',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(), // Replace HomeScreen with your home screen widget
      },
      );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {   
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/images/TRD1.jpg', width: 30, height: 30,),
            ),
              const SizedBox(width: 10),
              const Expanded(child: Text('TRD GPS DATA LOGGER'),),
            ],
          ),
          
        ),
        
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0,80.0,20.0,80.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () { Navigator.push(context, MaterialPageRoute(builder:(context) => const LocationScreen()),);},
                      child: const Text('Get GPS'),
                    ),
                  ),
                  ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: const SafeArea( 
        child: BottomAppBar(
          color: Color.fromARGB(255, 10, 196, 19), // Set the color of the bottom app bar
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child:Text(
                  '© 2024 mygpsapp (A. Parmesh Yadav, Tech/TRD/RDM)',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                ),
              ],
            ),
          ),
        ),
      ),
      );
    }
}