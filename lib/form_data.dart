import 'package:flutter/material.dart';


const primaryColor = Color.fromARGB(255, 4, 211, 22);

class FormScreen extends StatefulWidget {
final String latitude_1;
final String longitude_1;
FormScreen({Key? key,
required this.latitude_1, 
required this.longitude_1,
}):super(key: key);
  
  @override
  FormScreenState createState() => FormScreenState();
  
}

class FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
//FormScreenState({required this.latitude_1,required this.longitude_1});
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
        child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('Latitude: ${widget.latitude_1}, Longitude: ${widget.longitude_1}'),
            TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
        //          border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
          //        border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form submitted')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
          ],
        ),
      ),
      ),
    );
  }
 }
