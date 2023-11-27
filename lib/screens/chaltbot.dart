import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Chatbolt extends StatefulWidget {
  @override
  _ChatboltState createState() => _ChatboltState();
}

class _ChatboltState extends State<Chatbolt> {
  TextEditingController _textInputController = TextEditingController();
  List<String> chatMessages = [];

  Future<String> sendTextToChatGPT(String text) async {
    final apiKey = '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';
    final endpoint = 'https://api.openai.com/v1/engines/text-davinci-003/completions';
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    final data = {
      'prompt': text,
      'max_tokens': 100, // Adjust as needed
    };

    final response = await http.post(Uri.parse(endpoint), headers: headers, body: json.encode(data));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['choices'][0]['text'];
    } else {
      throw Exception('Failed to connect to ChatGPT');
    }
  }

  void _sendMessage(String message) async {
    setState(() {
      chatMessages.add("You: $message");
      _textInputController.clear();
    });

    try {
      final response = await sendTextToChatGPT(message);
      setState(() {
        chatMessages.add("ChatGPT: $response");
      });
    } catch (e) {
      print('Error calling ChatGPT API: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Li Chat Ai'),
        backgroundColor: Colors.green, // Set the app bar color to green
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 27, 61, 27),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      chatMessages[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white, // Set the text input background color to white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _textInputController,
                        decoration: InputDecoration(
                          labelText: 'Type a message',
                          border: InputBorder.none, // Remove the border
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: IconButton(
                    onPressed: () {
                      String message = _textInputController.text;
                      if (message.isNotEmpty) {
                        _sendMessage(message);
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.of(context).pushReplacementNamed('/home');
              break;
            case 1:
              Navigator.of(context).pushReplacementNamed('/articles');
              break;
            case 2:
              Navigator.of(context).pushReplacementNamed('/scan');
              break;
            case 3:
              Navigator.of(context).pushReplacementNamed('/calendar');
              break;
            case 4:
              Navigator.of(context).pushReplacementNamed('/settings');
              break;
          }
        },
      ),
    );
  }
}
