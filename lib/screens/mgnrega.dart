import 'package:flutter/material.dart';

void main() {
  runApp(myappp());
}

class welcome extends StatelessWidget {
  final String name;

  welcome({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              // Add your camera functionality here
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome $name'),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String selectedLanguage = 'English'; // Initialize with a default value
  TextEditingController bhuvanUserNameController = TextEditingController();
  TextEditingController yourNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController organisationController = TextEditingController();

  List<String> languages = [
    'English',
    'Hindi',
    'Bengali',
    'Marathi',
    'Tamil',
    'Telugu',
    'Malayalam',
    'Kannada',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'GeoMGNREGA Welcome',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: selectedLanguage,
            items: languages.map((String lang) {
              return DropdownMenuItem<String>(
                value: lang,
                child: Text(lang),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedLanguage = value;
                });
              }
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: bhuvanUserNameController,
            decoration: const InputDecoration(
              labelText: 'Bhuvan User Name *',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: yourNameController,
            decoration: const InputDecoration(
              labelText: 'Your Name *',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: mobileNumberController,
            decoration: const InputDecoration(
              labelText: 'Mobile Number *',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: organisationController,
            decoration: const InputDecoration(
              labelText: 'Organisation *',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_validateFields()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => welcome(
                      name: yourNameController.text,
                    ),
                  ),
                );
              }
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }

  bool _validateFields() {
    if (selectedLanguage.isEmpty ||
        bhuvanUserNameController.text.isEmpty ||
        yourNameController.text.isEmpty ||
        mobileNumberController.text.isEmpty ||
        organisationController.text.isEmpty) {
      _showError('Please fill in all required fields');
      return false;
    }
    return true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class myappp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhuvan MGNREGA UI',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false, // Hide debug banner
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.white10],
          ),
        ),
        child: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}
