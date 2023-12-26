import 'package:flutter/material.dart';
import 'package:testapp/comp/my_textfield.dart';
import 'package:testapp/main.dart';
import 'home.dart';
import 'auth_page.dart';

class hfa extends StatelessWidget {
  hfa({super.key});

  final userID = TextEditingController();
  final fullName = TextEditingController();
  final designation = TextEditingController();
  final mobileNumber = TextEditingController();
  final organistion = TextEditingController();
  final state = TextEditingController();
  final district = TextEditingController();
  final town = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black38,
              ))
        ],
        title: Text(
          'HFA by bhuvan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          MyTextField(
            controller: userID,
            hintText: 'User ID',
            obscureText: false,
          ),
          SizedBox(
            height: 10,
          ),
          MyTextField(
              controller: fullName, hintText: 'Full Name', obscureText: false),
          SizedBox(
            height: 10,
          ),
          MyTextField(
              controller: designation,
              hintText: 'Your Designation',
              obscureText: false),
          SizedBox(
            height: 10,
          ),
          MyTextField(
              controller: mobileNumber,
              hintText: "Mobile Number",
              obscureText: false),
          SizedBox(
            height: 10,
          ),
          MyTextField(
              controller: organistion,
              hintText: "Your Organisation",
              obscureText: false),
          SizedBox(
            height: 10,
          ),
          MyTextField(controller: state, hintText: 'State', obscureText: false),
          SizedBox(
            height: 10,
          ),
          MyTextField(
              controller: district, hintText: 'District', obscureText: false),
          SizedBox(
            height: 10,
          ),
          MyTextField(controller: town, hintText: 'Town', obscureText: false),
          SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.map,
                    size: 80,
                    color: Colors.blue,
                  ),
                  Text('GPS')
                ],
              ),
              Column(
                children: [Icon(Icons.camera, size: 80), Text('Photo')],
              ),
              Column(
                children: [
                  Icon(Icons.save, size: 80, color: Colors.red[900]),
                  Text('Save')
                ],
              ),
              Column(
                children: [
                  Icon(Icons.send, size: 80, color: Colors.lightGreen),
                  Text('Send')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
