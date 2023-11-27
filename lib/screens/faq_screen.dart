import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
    home: FAQScreen(),
  ));
}

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        backgroundColor: Colors.green,
      ),
      body: FAQList(),
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
              // Home screen
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

class FAQList extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'What is this app about?',
      answer: 'This app is designed to help users with IoT sensor connections, plant disease detection, community discussions, and a marketplace for agricultural products.',
    ),
    FAQItem(
      question: 'How do I connect my IoT sensors?',
      answer: 'To connect your IoT sensors, go to the IoT Control section and follow the instructions provided.',
    ),
    FAQItem(
      question: 'Can I chat with a bot for assistance?',
      answer: 'Yes, you can use the chatbot feature to get assistance and answers to your questions.',
    ),
    FAQItem(
      question: 'Is there a marketplace for buying and selling agricultural products?',
      answer: 'Yes, our marketplace allows you to buy and sell agricultural products with ease.',
    ),
    FAQItem(
      question: 'How does the plant disease detection work?',
      answer: 'The app uses machine learning and image recognition to detect plant diseases from photos you provide.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqItems.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(faqItems[index].question, style: TextStyle(fontSize: 18)),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(faqItems[index].answer, style: TextStyle(fontSize: 16)),
            ),
          ],
        );
      },
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
