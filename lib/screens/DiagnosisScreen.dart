import 'package:flutter/material.dart';
import 'dart:io';

class DiagnosisScreen extends StatelessWidget {
  final String diseaseName;
  final double confidence;
  final String imagePath;
  final Map<String, String> diseaseInfo; // Add this parameter

  DiagnosisScreen({
    required this.diseaseName,
    required this.confidence,
    required this.imagePath,
    required this.diseaseInfo,
  });
   String getDiseaseDetails(String diseaseName) {
    switch (diseaseName) {
      case 'Bacteria Spot':
        return 'Details for Bacterial Spot disease: Remove and destroy infected plant parts, practice crop rotation, avoid overhead watering, apply copper-based fungicides or bactericides, maintain proper plant spacing, and ensure good air circulation';
      case 'Early Blight':
        return 'Details for Early Blight disease: Prune infected leaves, use fungicides, apply mulch, Prune infected leaves, use fungicides such as chlorothalonil, copper-based fungicides, or mancozeb, apply mulch,avoid overhead watering, practice crop rotation, stake and prune, maintain healthy soil, consider resistant varieties, and monitor regularly.';
      case 'Healthy':
        return 'No disease detected. The plant is healthy.';
      case 'Late Blight':
        return 'Details for Late Blight disease: Remove and destroy infected plant parts, practice crop rotation, apply fungicides containing chlorothalonil or copper-based fungicides, ensure good air circulation, and avoid overhead watering.';
      case 'Leaf Mold':
        return 'Details for Leaf Mold disease: Remove and destroy infected plant parts, use proper spacing between plants for good air circulation, avoid overhead watering, and apply fungicides containing copper or other recommended fungicides.';
      case 'Septoria leaf spot':
        return 'Details for Septoria Leaf Spot disease: Remove and destroy infected plant parts, maintain good plant spacing, and avoid overhead watering. Apply fungicides containing copper or other recommended fungicides. Organic treatments like neem oil can also be effective.';
      case 'Target Spot':
        return 'Details for Target Spot disease: Prune and remove infected leaves, maintain good air circulation, and avoid overhead watering. Apply appropriate fungicides or bactericides as recommended by agricultural experts or garden centers. Organic treatments like neem oil may also help control the disease.';
      case 'Tomato Yellow Leaf Curl Virus':
        return 'Details for Tomato Yellow Leaf Curl Virus disease: TYLCV is a viral disease transmitted by whiteflies. To manage it, use physical barriers like insect nets to prevent whitefly infestation. Remove and destroy infected plants to prevent the spread of the virus. Regularly monitor your tomato plants for early symptoms, and use resistant tomato varieties when available. Additionally, whitefly control methods can help reduce the risk of TYLCV infection.';
      case 'Tomato Mosaic Virus':
        return 'Details for Tomato Mosaic Virus disease: Tomato Mosaic Virus is a viral disease that affects tomato plants. There is no cure for viral infections. To prevent its spread, promptly remove and destroy infected plants. Ensure good insect control to prevent aphids, which can transmit the virus. Use resistant tomato varieties when available to reduce the risk of infection.';
      case 'Two spotted spider mite':
        return 'Details for Two-Spotted Spider Mite disease: Two-Spotted Spider Mites are common pests that feed on the underside of plant leaves, causing stippling and discoloration. To manage this issue, regularly hose down your plants to reduce mite populations. Use insecticidal soap or neem oil to control the mites. Isolate infected plants to prevent the spread of the pests.';
      default:
        return 'Details not available for this disease.';
    }
  }

  @override
  Widget build(BuildContext context) {
    // String diseaseDetails = diseaseInfo[diseaseName] ?? 'Details not available for this disease';
    String diseaseDetails = getDiseaseDetails(diseaseName);
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagnosis Result'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Disease: $diseaseName',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Confidence: ${(confidence * 100).toStringAsFixed(2)}%',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Image.file(
                File(imagePath), // Load the image from the provided path
                width: 400,
                height: 400,
              ),
              SizedBox(height: 16),
              Text(
                'Treatment Details:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                // diseaseInfo[diseaseName] ?? 'Details not available for this disease.',
                diseaseDetails,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green, // Set the selected item color
        unselectedItemColor: Colors.black, // Set the unselected item color
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
