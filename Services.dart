import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildWelcomeSection(),
          _buildServicesPage(context),
          _buildInformationSection(),
        ],
      ),
    );
  }

  // Welcome Section Widget
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
            left: 100.0,
            right: 400.0,
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
                      'Services',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "We go beyond making sure your teeth and gums are healthy. Here, your smile gets the makeover that you need and desire through various dedicated treatments covering General Dentistry, Prosthodontics, Orthodontics, and Endodontics.",
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

  // Services Page Widget
  Widget _buildServicesPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          Text(
            'Our Services',
            style: TextStyle(
              fontFamily: 'Epilogue-SemiBold',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 87, 163, 213),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 400, // Set height for the horizontal scroll
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildServiceContainer(
                    context,
                    'General Dentistry',
                    'images/general.jpg',
                    'General Dentistry focuses on preventive care and treatment of oral diseases.',
                    "General dentistry covers the diagnosis, prevention, and treatment of oral health conditions. This means that general dentists are responsible for your routine checkups, examinations, cleanings, and restorations. They develop customized dental hygiene plans for their patients, which include things like teeth cleaning, tooth scaling, and x-rays.\n\nDisease prevention is an important part of general dentistry. Diagnostic equipment and regular checkups allow general dentists to detect and treat problems as early as possible. However, you may be referred to a specialist depending on the condition of your mouth.",
                    [
                      'Preventive Care: Regular check-ups, professional cleanings, and fluoride treatments to prevent cavities and gum disease.',
                      'Diagnostic Services: X-rays and examinations to identify oral health issues.',
                      'Restorative Procedures: Fillings for cavities, crowns for damaged teeth, and bridges for replacing missing teeth.',
                      'Extractions: Removal of problematic teeth, including wisdom teeth.',
                      'Basic Cosmetic Procedures: Teeth whitening and veneers to improve aesthetics.',
                      'Patient Education: Guidance on oral hygiene practices and diet.'
                    ],
                  ),
                  SizedBox(width: 20),
                  _buildServiceContainer(
                    context,
                    'Prosthodontics',
                    'images/prosthodontics.jpg',
                    'Prosthodontics deals with the design, manufacture, and fitting of artificial replacements for teeth and other parts of the mouth.',
                    'Prosthodontics is one of the branches of dentistry that deals with the replacement of missing teeth and the associated soft and hard tissues by prostheses (crowns, bridges, dentures) which may be fixed or removable, or may be supported and retained by implants.\n\nProsthodontics is a specialized field of dentistry focused on the restoration and replacement of lost or damaged teeth and oral structures. It combines the art and science of dentistry to create functional, comfortable, and aesthetically pleasing dental solutions. At Dental Care, our prosthodontists are experts in enhancing your smile’s appearance and your overall oral health through state-of-the-art treatments and biocompatible materials.',
                    [
                      'Crowns: Caps placed over damaged teeth to restore shape and function.',
                      'Bridges: Fixed prosthetics to replace one or more missing teeth by anchoring to adjacent teeth.',
                      'Dentures: Full or partial dentures for those missing multiple teeth.',
                      'Implants: Surgical placement of titanium posts that serve as artificial roots for replacement teeth.',
                      'Cosmetic Enhancements: Procedures like veneers and smile makeovers to enhance the appearance of teeth.',
                      'Rehabilitation: Comprehensive treatment plans for patients with complex dental issues.'
                    ],
                  ),
                  SizedBox(width: 20),
                  _buildServiceContainer(
                    context,
                    'Orthodontics',
                    'images/orthodontics.jpg',
                    'Orthodontics specializes in correcting teeth and jaws that are positioned improperly.',
                    'Orthodontics is a branch of dentistry that treats malocclusion, a condition in which the teeth are not correctly positioned when the mouth is closed. This results in an improper bite. An orthodontist specializes in making the teeth straight. Treatment can be cosmetic, to improve a person’s appearance, but it often aims to improve oral function, too.',
                    [
                      'Braces: Traditional metal, ceramic, or lingual braces for correcting teeth alignment.',
                      'Clear Aligners: Custom-made, removable aligners (like Invisalign) for less visible teeth straightening.',
                      'Retention: Fabrication of retainers to maintain teeth positions post-treatment.',
                      'Bite Correction: Addressing overbites, underbites, and crossbites through various treatment options.',
                      'Jaw Alignment: Orthognathic surgery in some cases for severe jaw misalignments.'
                    ],
                  ),
                  SizedBox(width: 20),
                  _buildServiceContainer(
                    context,
                    'Endodontics',
                    'images/endodontics.jpg',
                    'Endodontics involves the treatment of dental pulp and tissues surrounding the roots of a tooth.',
                    'Endodontic treatments help save teeth that are badly decayed or infected.',
                    [
                      'Root Canal Therapy: Removal of infected or damaged pulp, cleaning the root canals, and sealing them.',
                      'Retreatment: Addressing issues in previously treated root canals.',
                      'Apicoectomy: Surgical procedure to remove the tip of a tooth’s root if infection persists after a root canal.',
                      'Trauma Management: Treatment of dental injuries affecting the pulp or root.'
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Service Container Widget
  Widget _buildServiceContainer(
      BuildContext context,
      String title,
      String imageUrl,
      String description,
      String detailDescription,
      List<String> features) {
    return Container(
      width: 300,
      height: 380,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Epilogue-SemiBold',
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 87, 163, 213),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            description,
            style: TextStyle(fontFamily: 'Cardo-Regular', fontSize: 16),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceDetailScreen(
                    title: title,
                    detailDescription: detailDescription,
                    features: features,
                  ),
                ),
              );
            },
            child: Text('Read More'),
          ),
        ],
      ),
    );
  }

  // Information Section Widget
  Widget _buildInformationSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 87, 163, 213),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // Logo and slogan container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'images/logo.png'), // Replace with your logo
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
            ),
          ),

          // Services container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Our Services:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
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
            ),
          ),

          // Contact Us container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Us:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(
                        width: 8,
                        height: 10,
                      ),
                      Text(
                          "3rd floor, Nuciti Central Mall, P. Burgos Street,\nBatangas City, Philippines",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.white),
                      SizedBox(
                        width: 8,
                        height: 10,
                      ),
                      Text("0920 907 8518",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(
                        width: 8,
                        height: 10,
                      ),
                      Text("ed_panopiolybat@yahoo.com",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.white),
                      SizedBox(
                        width: 8,
                        height: 10,
                      ),
                      Text("9 AM - 5 PM\nMonday to Saturday",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Service Detail Screen Widget
class ServiceDetailScreen extends StatelessWidget {
  final String title;
  final String detailDescription;
  final List<String> features;

  ServiceDetailScreen(
      {required this.title,
      required this.detailDescription,
      required this.features});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                detailDescription,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Overview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              for (String feature in features) _buildFeatureBullet(feature),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureBullet(String text) {
    return Row(
      children: [
        Icon(Icons.check, color: Colors.green),
        SizedBox(width: 8),
        Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
      ],
    );
  }
}
