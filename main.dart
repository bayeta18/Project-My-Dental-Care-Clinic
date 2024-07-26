import 'package:flutter/material.dart';
import 'Home.dart';
import 'About.dart';
import 'Services.dart';
import 'Contact.dart'; // Adjusted import path assuming file name 'Contact.dart'

void main() {
  runApp(MyApp()); //root
}

// Root widget of the application
class MyApp extends StatelessWidget {
  //material app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: ProfileApp(), // Sets the home widget
    );
  }
}

// Main profile application widget with tabs
class ProfileApp extends StatelessWidget {
  //myhomepage
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs adjusted to 4
      child: Scaffold(
        //scaffold
        appBar: AppBar(
          //appbar
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/logo1.png',
                fit: BoxFit.contain,
                height: 50,
              ),
              SizedBox(width: 10),
              Text("My Dental Care Clinic"), // Title of the app bar
            ],
          ),
          bottom: TabBar(
            tabs: [
              // Define each tab with an icon and text
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.info), text: 'About'),
              Tab(icon: Icon(Icons.medical_services), text: 'Services'),
              Tab(icon: Icon(Icons.contact_mail), text: 'Contact'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Corresponding screens for each tab
            HomeScreen(), // Home screen widget
            AboutScreen(), // About screen widget
            ServicesScreen(), // Services screen widget
            ContactUsScreen(), // Contact screen widget
          ],
        ),
      ),
    );
  }
}
