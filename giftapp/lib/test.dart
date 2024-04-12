// ignore_for_file: library_private_types_in_public_api, duplicate_ignore, unused_import, use_super_parameters, avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giftapp/LiveForms.dart';
import 'package:camera/camera.dart';
import 'package:giftapp/camera_utils.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


//import 'package:http/http.dart' as http;
//import 'package:giftapp/share.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CameraUtils.initializeCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gift Finder',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gift Finder',
          style: TextStyle(
            fontFamily: 'PermanentMarker',
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0)
          ),
        ),
        centerTitle: true, // Center the title horizontally
        backgroundColor: const Color.fromARGB(255, 0, 146, 204), // Change the color of the app bar
      ),
    body: Container(
        color: const Color.fromARGB(255, 170, 170, 170), // Set the background color of the whole page
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Gift Finder',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 20.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                  child: GestureDetector( 

              onHorizontalDragEnd: (details) { 

                  if (details.primaryVelocity! > 0) { 
                  
                      _showSwipeAlert(context, 'Swiped Right'); 

                } else if (details.primaryVelocity! < 0) { 

                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CarsPage()),
                  );

                  } 

      }, // Adjust the border radius as needed
                child: Image.asset(
                  'assets/gift.png',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              
          )],
          ),
        ),
      ),
           bottomNavigationBar: Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0), // Add top and bottom margins
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0), 
        // Dark grey background for the row
        boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 146, 204),
              blurRadius: 0.0, // Adjust the blur radius as needed
              spreadRadius: 0.7, // Adjust the spread radius as needed
              offset: Offset(0, -2), // Offset for shadow, negative y to place it at the top
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [








    ElevatedButton(
  onPressed: () {
    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
              
    // Handle home button tap
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 0, 146, 204), // Button background color
    fixedSize: const Size(40, 40), // Button size
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1000.0), // Circular button shape
    ),
  ),
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.home, // Replace Icons.home with your desired icon
        size: 19, 
        color:  Color.fromARGB(255, 255, 255, 255),// Adjust the size of the icon as needed
      ),
    ],
  ),
),

       ElevatedButton(
  onPressed: () {
                // Handle home button tap
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CarsPage()),
                  );
              },

  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 0, 146, 204), // Button background color
    fixedSize: const Size(40, 40), // Button size
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1000.0), // Circular button shape
    ),
  ),

  child: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.content_paste, // Replace Icons.home with your desired icon
        size: 19, 
        color:  Color.fromARGB(255, 255, 255, 255),// Adjust the size of the icon as needed
      ),
    ],
  ),
),
            
            ElevatedButton(
  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CameraScreen()),
                  );

    // Handle home button tap
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 0, 146, 204), // Button background color
    fixedSize: const Size(40, 40), // Button size
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1000.0), // Circular button shape
    ),
  ),
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.camera_enhance, // Replace Icons.home with your desired icon
        size: 19, 
        color:  Color.fromARGB(255, 255, 255, 255),// Adjust the size of the icon as needed
      ),
    ],
  ),
),
            
            ElevatedButton(
  onPressed: () {
    // Handle home button tap
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 0, 146, 204), // Button background color
    fixedSize: const Size(40, 40), // Button size
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1000.0), // Circular button shape
    ),
  ),
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.settings, // Replace Icons.home with your desired icon
        size: 19, 
        color:  Color.fromARGB(255, 255, 255, 255),// Adjust the size of the icon as needed
      ),
    ],
  ),
),
          ],
        ),
      ),
    );
  }
}


void _showSwipeAlert(BuildContext context, String alertText) { 


 showDialog( 

context: context, 

builder: (BuildContext context) { 
 return AlertDialog( 
 title: Text(alertText), 
 actions: <Widget>[ 
 TextButton( 
 onPressed: () { 
 Navigator.of(context).pop(); 
 }, 
 child: const Text('Ok'), 
), 
], 
 ); 
 }, 
); 
} 



//Go Next Page
class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CarsPageState createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  List<Car> cars = [];
  
  get http => null;

  @override
  void initState() {
    super.initState();
    loadCars();
  }

  Future<void> loadCars() async {
    final String data = await rootBundle.loadString('assets/cars.json');
    final List<dynamic> jsonList = json.decode(data);
    final List<Car> loadedCars = jsonList.map((json) => Car.fromJson(json)).toList();
    final response = await http.get(Uri.parse('http://www.bloxlox.net/cars.json'));

    setState(() {
      cars = loadedCars;
    });
  }

 @override
Widget build(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  double imageWidthPercentage = 0.2; // Adjust this value to set the percentage width of the image
  double imageHeightPercentage = 0.2;

  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Gift Forms',
        style: TextStyle(
          fontFamily: 'PermanentMarker',
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      centerTitle: true, // Center the title horizontally
      backgroundColor: const Color.fromARGB(255, 0, 146, 204), // Change the color of the app bar
    ),
    backgroundColor: const Color.fromARGB(255, 170, 170, 170),
    body: ListView.builder(
      itemCount: cars.length,
      itemBuilder: (context, index) {
        final car = cars[index];
        return Column(
          children: [
            ListTile(
              title: Text(
                '${car.name} ${car.status}',
                textAlign: TextAlign.right, // Align text to the right
              ),
              leading: SizedBox(
                width: screenSize.width * imageWidthPercentage,
                height: screenSize.height * imageHeightPercentage,
                child: Image.asset(
                  'assets/${car.image}',
                  fit: BoxFit.cover, // Ensure the image covers the entire box
                  alignment: Alignment.centerLeft, // Align image to the left
                ),
              ),
            ),
            const SizedBox(height: 10), // Adjust the height according to your spacing preference
          ],
        );
      },
    ),
  );
}
}

















//camera page
class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(CameraUtils.cameras[0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

Future<void> _takePicture() async {
  try {
    await _initializeControllerFuture;

    final XFile file = await _controller.takePicture();

    // Save the captured image to the gallery
    await GallerySaver.saveImage(file.path);

    // Show a Thank-You dialog after taking the picture
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thank You!'),
          content: const Text('Thank you for raking this photo. We will attempt to identify this item, and we will get back to you'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  } catch (e) {
    print("Error taking or saving picture: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift Findr'),
        backgroundColor: const Color.fromARGB(255, 0, 146, 204),
      ),backgroundColor: Color.fromARGB(255, 0, 0, 0), 
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        backgroundColor: Color.fromARGB(255, 0, 146, 204),
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}