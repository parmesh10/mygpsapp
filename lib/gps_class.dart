import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'form_data.dart';

const primaryColor = Color.fromARGB(255, 4, 211, 22);

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});
  @override
  LocationScreenState createState() => LocationScreenState();

}

class LocationScreenState extends State<LocationScreen> {
  String? _latitude;
  String? _longitude;
//  LocationScreenState({this._latitude,this._longitude});
  String locError = "Error in getting Location";
  //String? _locationMessage = '';
bool loadvar = true;
bool savevar = true;
  Future<void> _getLocation() async {
    setState(() {
      loadvar = false;
    });
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _latitude = position.latitude.toString();
        _longitude = position.longitude.toString();
        loadvar = true;
        savevar = false;
      });
    } catch (e) {
      // ignore_for_file: avoid_print
      print(locError);
    }
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            if (_latitude != null && _longitude != null)
              Text('Latitude: $_latitude, Longitude: $_longitude'),
            if (_latitude != null && _longitude != null)
               ElevatedButton(
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder:(context) => FormScreen(
                latitude_1:_latitude!,
                longitude_1:_longitude!,)),);},
              child: const Text('Save TRD Location'),
            ),
            if(savevar)
            ElevatedButton(
              onPressed: _getLocation,
              child: const Text('Get Location'),
            
            ),
            if(!loadvar)
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
 }

