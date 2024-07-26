import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildWelcomeSection(),
              _buildAboutSection(),
              _buildServicesSection(),
              _buildGallerySection(),
              _buildInformationSection(orientation),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'), // Replace with your image
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WELCOME TO MY DENTAL',
                  style: TextStyle(
                    fontFamily: 'Anton-Regular',
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 10.0,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
                Text(
                  'CARE CLINIC',
                  style: TextStyle(
                    fontFamily: 'Anton-Regular',
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 10.0,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Save Your Smile!',
                  style: TextStyle(
                    fontFamily: 'CantataOne-Regular',
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Builds the about section with a title, description, and an image.
  Widget _buildAboutSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Experience World Class Dental Care',
                  style: TextStyle(
                    fontFamily: 'Epilogue-SemiBold',
                    fontSize: 24,
                    color: Color.fromARGB(255, 87, 163, 213),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'We at My Dental Care Clinic take pride in the level of treatments and services we offer. '
                  'Aside from state-of-the-art equipment, our dental team is fully equipped with knowledge and experience in the field.',
                  style: TextStyle(fontFamily: 'Cardo-Regular', fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            flex: 1,
            child: Container(
              height: 250.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/C2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Builds the services section with a title, description, and a horizontal scroll gallery.
  Widget _buildServicesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        children: [
          Text(
            'Our Services',
            style: TextStyle(
              fontFamily: 'Epilogue-SemiBold',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 87, 163, 213),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'We provide comprehensive dental care that includes General Dentistry, Prosthodontics, Orthodontics, and Endodontics.',
            style: TextStyle(fontFamily: 'Cardo-Regular', fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          _buildServicesGallery(),
        ],
      ),
    );
  }

  // Builds a horizontal scroll view for the services gallery.
  Widget _buildServicesGallery() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildServiceCard('General Dentistry', 'images/general.jpg'),
          SizedBox(width: 20),
          _buildServiceCard('Prosthodontics', 'images/prosthodontics.jpg'),
          SizedBox(width: 20),
          _buildServiceCard('Orthodontics', 'images/orthodontics.jpg'),
          SizedBox(width: 20),
          _buildServiceCard('Endodontics', 'images/endodontics.jpg'),
        ],
      ),
    );
  }

  // Builds a card for each service with an image and title.
  Widget _buildServiceCard(String title, String imagePath) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // Builds the gallery section with a title and horizontal scroll gallery.
  Widget _buildGallerySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        children: [
          Text(
            'Gallery',
            style: TextStyle(
              fontFamily: 'Epilogue-SemiBold',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 87, 163, 213),
            ),
          ),
          SizedBox(height: 20.0),
          _buildGallery(),
        ],
      ),
    );
  }

  // Builds a horizontal scroll view for the gallery.
  Widget _buildGallery() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildGalleryCard('', 'images/gallery.png'),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  // Builds a card for the gallery with an image and optional title.
  Widget _buildGalleryCard(String title, String imagePath) {
    return Container(
      width: 1200,
      height: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // Builds the information section with logo, services list, and contact details based on orientation.
  Widget _buildInformationSection(Orientation orientation) {
    bool isLandscape = orientation == Orientation.landscape;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 87, 163, 213),
      ),
      child: isLandscape
          ? Row(
              children: <Widget>[
                Expanded(child: _buildLogoAndSlogan()),
                Expanded(child: _buildServicesList()),
                Expanded(child: _buildContactDetails()),
              ],
            )
          : Column(
              children: <Widget>[
                _buildLogoAndSlogan(),
                _buildServicesList(),
                _buildContactDetails(),
              ],
            ),
    );
  }

  Widget _buildLogoAndSlogan() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: 250,
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/logo.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Your Convenient, Accommodating,\nand Affordable Dental Care Partner",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildServicesList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Our Services:",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text("General Dentistry",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Text("Cosmetic Dentistry",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Text("Orthodontics",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Text("Periodontics",
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildContactDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact Us:",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.white),
              SizedBox(
                width: 8,
                height: 10,
              ),
              Expanded(
                child: Text(
                  "3rd floor, Nuciti Central Mall, P. Burgos Street,\nBatangas City, Philippines",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.white),
              SizedBox(
                width: 8,
                height: 10,
              ),
              Expanded(
                child: Text(
                  "0920 907 8518",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.email, color: Colors.white),
              SizedBox(
                width: 8,
                height: 10,
              ),
              Expanded(
                child: Text(
                  "ed_panopiolybat@yahoo.com",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.white),
              SizedBox(
                width: 8,
                height: 10,
              ),
              Expanded(
                child: Text(
                  "9 AM - 5 PM\nMonday to Saturday",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
