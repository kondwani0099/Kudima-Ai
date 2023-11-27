import 'package:flutter/material.dart';


class ArticlesScreen extends StatelessWidget {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Tomato Diseases and Farm Yield'),
      actions: [
        // Add any additional app bar actions if needed
      ],
    ),
    body: ListView(
      children: [
        buildImageRow(
          'assets/diagnosis.png', // Replace with your image path
          'Tomato Diseases Overview',
          true,
        ),
        buildTextRow(
          'Tomato plants are susceptible to various diseases, including bacterial wilt, early blight, late blight, and more. These diseases can devastate entire tomato crops, leading to reduced yields, economic losses for farmers, and, ultimately, food insecurity. Zambia\'s tomato farmers have long grappled with these issues, underscoring the need for innovative solutions.',
        ),
        buildImageRow(
          'assets/farm_yield.png', // Replace with your image path
          'How Plant Doc Improves Farm Yield',
          false,
        ),
        buildTextRow(
          'Kudima Ai is a revolutionary app that helps farmers and agriculture enthusiasts tackle one of the most pressing challenges in the industry—plant diseases. This innovative mobile application combines the power of artificial intelligence (AI) and image recognition to identify, diagnose, and provide treatment recommendations for plant diseases quickly and accurately. ',
        ),
        buildImageRow(
          'assets/sdg.png', // Replace with your image path
          'Contributing to SDGs',
          true,
        ),
        buildTextRow(
          'Agriculture plays a pivotal role in achieving the United Nations Sustainable Development Goals (SDGs), and our app is no exception. By focusing on two critical aspects—improving food quality and increasing farm yield—our app aligns directly with SDGs that aim to eradicate poverty, promote sustainable practices, and ensure access to quality food for all. In this article, we will delve into how our app contributes to these goals.',
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


  Widget buildImageRow(
    String imageAsset,
    String text,
    bool isImageOnLeft,
  ) {
    return Row(
      children: [
        if (isImageOnLeft)
          Expanded(
            flex: 1,
            child: Image.asset(
              imageAsset,
              fit: BoxFit.cover,
              height: 250.0,
            
            ),
          ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        if (!isImageOnLeft)
          Expanded(
            flex: 1,
            child: Image.asset(
              imageAsset,
              fit: BoxFit.cover,
              height: 250.0,
        
            ),
          ),
      ],
    );
  }

 Widget buildTextRow(String text) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins', // Set the font family to Poppins
        fontSize: 16, // Adjust the font size
        fontWeight: FontWeight.normal, // Adjust the font weight if needed
      ),
    ),
  );
}

}
