import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:plantdoc/screens/DiagnosisScreen.dart';
import 'dart:io';
import 'package:flutter/services.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io' if (dart.library.html) 'dart:typed_data';
import 'package:flutter/foundation.dart'; // Import the foundation package

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  List<dynamic> recognitions = [];
  CameraController? cameraController;
  XFile? imageFile;

  // Define a map that maps disease labels to information about the disease and its treatment
  final Map<String, Map<String, String>> diseaseInfoMap = {
    'diseaseLabel1': {
      'about': 'Information about Disease 1.',
      'treatment': 'Treatment for disease 1.',
      'imagePath': 'assets/diseases/disease1.jpg',
    },
    'diseaseLabel2': {
      'about': 'Information about Disease 2.',
      'treatment': 'Treatment for disease 2.',
      'imagePath': 'assets/diseases/disease2.jpg',
    },
       'diseaseLabel3': {
      'about': 'Information about Disease 2.',
      'treatment': 'Treatment for disease 2.',
      'imagePath': 'assets/diseases/disease2.jpg',
    },
       'diseaseLabel4': {
      'about': 'Information about Disease 2.',
      'treatment': 'Treatment for disease 2.',
      'imagePath': 'assets/diseases/disease2.jpg',
    },
       'diseaseLabel5': {
      'about': 'Information about Disease 2.',
      'treatment': 'Treatment for disease 2.',
      'imagePath': 'assets/diseases/disease2.jpg',
    },
       'diseaseLabel6': {
      'about': 'Information about Disease 2.',
      'treatment': 'Treatment for disease 2.',
      'imagePath': 'assets/diseases/disease2.jpg',
    },
       'diseaseLabel7': {
      'about': 'Information about Disease 2.',
      'treatment': 'Treatment for disease 2.',
      'imagePath': 'assets/diseases/disease2.jpg',
    },
       'diseaseLabel8': {
      'about': 'Information about Disease 2.',
      'treatment': 'Treatment for disease 2.',
      'imagePath': 'assets/diseases/disease2.jpg',
    },
    'diseaseLabel9': {
      'about': 'Information about Disease 2.',
      'treatment': 'Treatment for disease 2.',
      'imagePath': 'assets/diseases/disease2.jpg',
    },
    'diseaseLabel10': {
      'about': 'Information about Disease 2.',
      'treatment': 'Treatment for disease 2.',
      'imagePath': 'assets/diseases/disease2.jpg',
    },

    // Add more disease labels, information, and image paths here
  };

  @override
  void initState() {
    super.initState();
    initializeCamera();
    loadTFLiteModel();
  }

  void initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    cameraController = CameraController(firstCamera, ResolutionPreset.medium);
    await cameraController!.initialize();
  }

//   Future<void> pickImageFromGallery() async {
//   try {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//     );

//     if (result != null) {
//       PlatformFile file = result.files.first;
//       String imagePath = file.path ??'';

//       // Now you can run your model with the selected image path
//       runModelOnImage(imagePath);
//       print('Error picking image: ');
//     }
//   } on PlatformException catch (e) {
//     // Handle errors or exceptions here
//     print('Error picking image: $e');
//   }
// }
// Future<void> pickImageFromGallery() async {
//   try {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//     );

//     if (result != null) {
//       PlatformFile file = result.files.first;

//       // Check if the app is running on the web
//       if (kIsWeb) {
//         if (file.bytes != null) {
//           Uint8List uint8list = Uint8List.fromList(file.bytes!);
//           // Now you can use uint8list for image processing
//           print('Image bytes length: ${uint8list.length}');
//         } else {
//           print('No image bytes available.');
//         }
//       } else {
//         // For non-web platforms
//         String imagePath = file.path ?? '';

//         // Now you can run your model with the selected image path
//         runModelOnImage(imagePath);
//         print('Selected image path: $imagePath');
//       }
//     } else {
//       print('No image selected.');
//     }
//   } on PlatformException catch (e) {
//     // Handle errors or exceptions here
//     print('Error picking image: $e');
//   }
// }


  Future<void> captureImage() async {
    if (cameraController != null) {
      final XFile image = await cameraController!.takePicture();
      setState(() {
        imageFile = image;
      });
      runModelOnImage(image.path);
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = image;
      });
      runModelOnImage(image.path);
    }
  }

  void loadTFLiteModel() async {
    await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/plant_disease_labels.txt',
    );
  }

  Future<void> runModelOnImage(String imagePath) async {
    final List<dynamic>? results = await Tflite.runModelOnImage(
      path: imagePath,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 1,
      threshold: 0.2,
    );

    if (results != null && results.isNotEmpty) {
      final String label = results.first['label'];
      final double confidence = results.first['confidence'];

      // Retrieve disease information and image path
      final Map<String, String> diseaseInfo = getDiseaseInfo(label);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DiagnosisScreen(
            diseaseName: label,
            confidence: confidence,
            imagePath: imagePath,
            diseaseInfo: diseaseInfo,
          ),
        ),
      );
    }
  }

  // Function to retrieve disease information based on the label
  Map<String, String> getDiseaseInfo(String label) {
    // Check if the label exists in the map
    if (diseaseInfoMap.containsKey(label)) {
      return diseaseInfoMap[label]!;
    } else {
      // Return default information if the label is not found
      return {
        'about': 'Information not available for this disease.',
        'treatment': 'Treatment details not available.',
        'imagePath': 'assets/diseases/health.jpg', // Provide a default image path
      };
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Screen'),
      ),
     body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300.0,
              height: 300.0,
              child: imageFile == null
                  ? Placeholder()
                  : Image.file(File(imageFile!.path)),
            ),
            
            SizedBox(height: 20.0),
            ElevatedButton(
  onPressed: captureImage,
  child: Container(
    width: 200, // Set your desired width
    height: 60,  // Set your desired height
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.camera_alt),
        Text('Capture Image'),
      ],
    ),
  ),
),


            SizedBox(height: 20.0),
            
            ElevatedButton(
          onPressed: pickImage,
          //  onPressed: pickImageFromGallery,

           child: Container(
            width: 200, // Set your desired width
             height: 60,  // Set your desired height
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.photo_library),
        Text('Pick Image from Gallery'),
      ],
    ),
  ),
),

          ],
        ),
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
