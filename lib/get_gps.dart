import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';

import 'gps_class.dart';

const primaryColor = Color.fromARGB(255, 4, 211, 22);


class SecondScreen extends StatelessWidget {
    const SecondScreen({super.key});
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
       // home: LocationScreenState(),
        ),
        
      body: Center(
           child: ElevatedButton(
                      onPressed: () { Navigator.push(context, MaterialPageRoute(builder:(context) => const LocationScreen()),);},
                      child: const Text('Get GPS'),
                    ), 
           ),
    );
  }
}

