import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with Dhruv'AI"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              children: [
                ChatMessage(
                    text:
                        'The current weather is partly cloudy with a chance of rain. The temperature is around 22°C.',
                    isAbhay: false),
                ChatMessage(
                    text: "Dhruv How's the weather today?", isAbhay: true),
                ChatMessage(
                  isAbhay: false,
                  text:
                      'FASAL (Farmers\' Advisory System for Agriculture Linked Extension Services) provides the following services:\n\n'
                      '1. Weather forecasting: Access localized weather forecasts and advisories for informed agricultural practices.\n\n'
                      '2. Soil health assessment and recommendations: Upload soil samples and receive recommendations for crop selection and fertilizer application.\n\n'
                      '3. Crop pest and disease management: Access information on pest and disease identification and management strategies.\n\n'
                      '4. Market information and recommendations: Get real-time market prices and recommendations for selling agricultural produce.\n\n'
                      '5. Farmer community forum: Connect with other farmers and share knowledge and experiences.',
                ),
                ChatMessage(
                    text:
                        'Hey Dhruv, What are the services available with FASAL in this app?',
                    isAbhay: true),
              ],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.black),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Ask a question...',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.isAbhay});

  final String text;
  final bool isAbhay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text(isAbhay ? 'A' : 'Bot'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isAbhay ? 'Abhinav' : 'Bot',
                    style: Theme.of(context).textTheme.subtitle1),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
