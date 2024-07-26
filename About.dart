import 'package:flutter/material.dart';
import 'contact.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildWelcomeSection(orientation),
              _buildAboutSection(orientation),
              _buildBookAppointmentButton(context),
              _buildOurDoctorsSection(orientation),
              _buildInformationSection(orientation),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWelcomeSection(Orientation orientation) {
    return Container(
      width: double.infinity,
      height: orientation == Orientation.portrait ? 300.0 : 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: orientation == Orientation.portrait ? 50.0 : 20.0,
            left: orientation == Orientation.portrait ? 20.0 : 50.0,
            right: orientation == Orientation.portrait ? 20.0 : 200.0,
            child: Card(
              color: Color.fromARGB(255, 109, 182, 230).withAlpha(130),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: orientation == Orientation.portrait ? 24 : 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Welcome to My Dental Care Clinic – your trusted source for accessible, welcoming, and budget-friendly dental services.",
                      style: TextStyle(
                        fontSize: orientation == Orientation.portrait ? 14 : 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(Orientation orientation) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: orientation == Orientation.portrait ? 30.0 : 20.0,
        horizontal: orientation == Orientation.portrait ? 20.0 : 50.0,
      ),
      child: orientation == Orientation.portrait
          ? Column(
              children: [
                _buildAboutImage(),
                SizedBox(height: 20.0),
                _buildAboutText(orientation),
              ],
            )
          : Row(
              children: [
                Expanded(child: _buildAboutImage()),
                SizedBox(width: 30.0),
                Expanded(child: _buildAboutText(orientation)),
              ],
            ),
    );
  }

  Widget _buildAboutImage() {
    return Container(
      width: 400.0,
      height: 300.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAboutText(Orientation orientation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Us',
          style: TextStyle(
            fontFamily: 'Epilogue-SemiBold',
            fontSize: orientation == Orientation.portrait ? 14 : 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 87, 163, 213),
          ),
        ),
        Text(
          'Who is My Dental care clinic?',
          style: TextStyle(
            fontFamily: 'Epilogue-SemiBold',
            fontSize: orientation == Orientation.portrait ? 28 : 35,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Welcome to My Dental Care Clinic, a group of dental clinics established in 1985, where we prioritize the health and well-being of every patient. Our commitment to providing family-friendly care means that every member of your family can receive affordable but high-quality dental treatments in a comfortable and welcoming environment.\n\n'
          'Our clinics are equipped with the latest technologies and well-maintained facilities, ensuring that we are able to provide uncompromising quality in every aspect of our services. We believe that the key to providing excellent dental care is through staying up-to-date with the latest advancements in the field, and we are proud to say that our clinics reflect that belief.\n\n'
          'At the heart of our success are our top-trained dentists, who are experts in their fields and bring a wealth of experience to every patient visit. You can trust that our dentists are dedicated to providing the best possible care, using the latest techniques and treatments to help you achieve and maintain a healthy, beautiful smile.\n\n'
          'Thank you for choosing My Dental Care Clinic and we look forward to serving you and your family.',
          style: TextStyle(fontFamily: 'Cardo-Regular', fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildBookAppointmentButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: ElevatedButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUsScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child:
            Text('Book an Appointment', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildOurDoctorsSection(Orientation orientation) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          Text(
            'Meet Our Expert Teams',
            style: TextStyle(
              fontFamily: 'Epilogue-SemiBold',
              fontSize: orientation == Orientation.portrait ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 87, 163, 213),
            ),
          ),
          Text(
            'Our Dentists',
            style: TextStyle(
              fontFamily: 'Epilogue-SemiBold',
              fontSize: orientation == Orientation.portrait ? 24 : 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 87, 163, 213),
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 40.0,
            runSpacing: 30.0,
            children: [
              _buildDoctorCard(
                  'Dr Edgardo A Panopio', 'Head Dentist', 'images/edgar.png'),
              _buildDoctorCard('Dr Josephine Almero-Panopio', 'Partner Dentist',
                  'images/jo.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(String name, String role, String imagePath) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 150.0,
        height: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              role,
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformationSection(Orientation orientation) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 87, 163, 213),
      ),
      child: orientation == Orientation.portrait
          ? Column(
              children: [
                _buildInfoLogo(),
                _buildInfoServices(),
                _buildInfoContact(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildInfoLogo()),
                Expanded(child: _buildInfoServices()),
                Expanded(child: _buildInfoContact()),
              ],
            ),
    );
  }

  Widget _buildInfoLogo() {
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

  Widget _buildInfoServices() {
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
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Epilogue-SemiBold',
                  fontSize: 16)),
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

  Widget _buildInfoContact() {
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
          _buildContactRow(Icons.location_on,
              "3rd floor, Nuciti Central Mall, P. Burgos Street,\nBatangas City, Philippines"),
          _buildContactRow(Icons.phone, "0920 907 8518"),
          _buildContactRow(Icons.email, "ed_panopiolybat@yahoo.com"),
          _buildContactRow(
              Icons.access_time, "9 AM - 5 PM\nMonday to Saturday"),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: 8, height: 10),
        Expanded(
          child:
              Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ],
    );
  }
}
