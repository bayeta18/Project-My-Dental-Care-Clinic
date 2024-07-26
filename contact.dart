import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? fullName, email, reason;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildWelcomeSection(), // Welcome section
              _buildMessageSection(
                  orientation), // Message and appointment form section
              _buildInformationSection(), // Information section
            ],
          ),
        );
      },
    );
  }

  // Welcome section with background image and introductory text
  Widget _buildWelcomeSection() {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'), // Replace with your image
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 50.0,
            left: 20.0,
            right: 20.0,
            child: Card(
              color: Color.fromARGB(255, 109, 182, 230).withAlpha(130),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "We would love to hear from you! Please feel free to reach out to us using the most convenient method for you - whether it's by phone, email, social media, or by sending us a message through this platform. We value your feedback and strive to provide exceptional service, so don't hesitate to contact us with any questions or concerns you may have. We look forward to hearing from you soon!",
                      style: TextStyle(
                        fontSize: 15,
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

  // Message section with two cards: one for general information and one for the appointment form
  Widget _buildMessageSection(Orientation orientation) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: orientation == Orientation.portrait
          ? Column(
              children: <Widget>[
                _buildGeneralInfoCard(),
                SizedBox(height: 16),
                _buildAppointmentFormCard(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(flex: 2, child: _buildGeneralInfoCard()),
                SizedBox(width: 16),
                Expanded(flex: 3, child: _buildAppointmentFormCard()),
              ],
            ),
    );
  }

  // General info card
  Widget _buildGeneralInfoCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Book An Appointment',
              style: TextStyle(
                fontFamily: 'Epilogue-SemiBold',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 87, 163, 213),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "We are delighted to welcome anyone with dental needs and inquiries to our practice. Our team of experienced professionals is committed to providing the highest quality of care for all your oral health needs.\nWe look forward to being able to provide you with exceptional service and an enjoyable experience in a safe, comfortable environment.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Appointment form card
  Widget _buildAppointmentFormCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildAppointmentForm(), // Appointment form
      ),
    );
  }

  // Appointment form with various input fields and validation
  Widget _buildAppointmentForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            // Center the title
            child: Text(
              'Book Your Appointment Request',
              style: TextStyle(
                fontFamily: 'Epilogue-SemiBold',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 87, 163, 213),
              ),
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                'Duration: 30 minutes',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Please let us know the type of consultation you are interested in and the services you are inquiring about. We will get back to you as soon as possible to confirm your booking.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            onSaved: (value) {
              fullName = value!;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            onSaved: (value) {
              email = value!;
            },
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 30)),
              );
              if (picked != null && picked != selectedDate) {
                setState(() {
                  selectedDate = picked;
                });
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: selectedDate == null
                      ? 'Select Date'
                      : '${selectedDate!.toLocal()}'.split(' ')[0],
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (selectedDate == null) {
                    return 'Please select a date';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Reason for Booking',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please provide a reason for booking';
              }
              return null;
            },
            onSaved: (value) {
              reason = value!;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Process booking logic (send data to server, etc.)
                _showBookingConfirmation();
              }
            },
            child: Text('Book Now'),
          ),
        ],
      ),
    );
  }

  // Display a booking confirmation dialog
  void _showBookingConfirmation() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Booking Confirmation'),
          content: Text('Your appointment request has been submitted!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Information section with logo, services, and contact details
  Widget _buildInformationSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 87, 163, 213),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Logo and slogan
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/logo.png'), // Replace with your logo
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Your Convenient, Accommodating,\nand Affordable Dental Care Partner",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          // Services
          Text(
            "Our Services:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "General Dentistry\nCosmetic Dentistry\nOrthodontics\nPeriodontics",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          // Contact Us
          Text(
            "Contact Us:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.white),
              SizedBox(width: 8),
              Text(
                "3rd floor, Nuciti Central Mall, P. Burgos Street,\nBatangas City, Philippines",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, color: Colors.white),
              SizedBox(width: 8),
              Text(
                "0920 907 8518",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, color: Colors.white),
              SizedBox(width: 8),
              Text(
                "ed_panopiolybat@yahoo.com",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_time, color: Colors.white),
              SizedBox(width: 8),
              Text(
                "9 AM - 5 PM\nMonday to Saturday",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
