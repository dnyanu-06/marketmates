import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signup_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marketmate',
      theme: _isDarkMode
          ? ThemeData.dark().copyWith(
              primaryColor: Colors.teal,
              scaffoldBackgroundColor: const Color.fromARGB(255, 48, 47, 47),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Color.fromARGB(255, 237, 234, 234)),
                bodyMedium:
                    TextStyle(color: Color.fromARGB(255, 243, 240, 240)),
              ),
            )
          : ThemeData.light().copyWith(
              primaryColor: Colors.teal,
              scaffoldBackgroundColor: Colors.white,
            ),
      home: HomePage(
        isDarkMode: _isDarkMode,
        onThemeChange: (bool value) {
          setState(() {
            _isDarkMode = value;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChange;

  const HomePage(
      {Key? key, required this.isDarkMode, required this.onThemeChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketmate'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? Icons.wb_sunny
                : Icons.nights_stay), // Sun or Moon icon
            onPressed: () {
              onThemeChange(!isDarkMode); // Toggle theme
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images.jpg', // Your image asset here
              height: 250,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Marketmate!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Instantly connect with larger markets and grow your business. '
              'Sign up, create your profile, explore opportunities, and secure '
              'transactions all in one place. Your journey to business success starts here!',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Sign Up page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Welcome to Marketmate',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// authentication

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'signup_page.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'signup_page.dart';
// import 'libre_translation_service.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isDarkMode = false;
//   String _selectedLanguage = 'en'; // Default Language

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Marketmate',
//       theme: _isDarkMode
//           ? ThemeData.dark().copyWith(
//               primaryColor: Colors.teal,
//               scaffoldBackgroundColor: const Color.fromARGB(255, 48, 47, 47),
//               textTheme: const TextTheme(
//                 bodyLarge: TextStyle(color: Color.fromARGB(255, 237, 234, 234)),
//                 bodyMedium:
//                     TextStyle(color: Color.fromARGB(255, 243, 240, 240)),
//               ),
//             )
//           : ThemeData.light().copyWith(
//               primaryColor: Colors.teal,
//               scaffoldBackgroundColor: Colors.white,
//             ),
//       home: HomePage(
//         isDarkMode: _isDarkMode,
//         onThemeChange: (bool value) {
//           setState(() {
//             _isDarkMode = value;
//           });
//         },
//         selectedLanguage: _selectedLanguage,
//         onLanguageChange: (String language) {
//           setState(() {
//             _selectedLanguage = language;
//           });
//         },
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   final bool isDarkMode;
//   final ValueChanged<bool> onThemeChange;
//   final String selectedLanguage;
//   final ValueChanged<String> onLanguageChange;

//   const HomePage({
//     Key? key,
//     required this.isDarkMode,
//     required this.onThemeChange,
//     required this.selectedLanguage,
//     required this.onLanguageChange,
//   }) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   LibreTranslationService translator = LibreTranslationService();
//   String _translatedWelcomeText = 'Welcome to Marketmate!';
//   String _translatedDescription =
//       'Instantly connect with larger markets and grow your business.';

//   @override
//   void initState() {
//     super.initState();
//     _translateTexts(); // Translate text when page loads
//   }

//   Future<void> _translateTexts() async {
//     String welcomeText = await translator.translateText(
//       'Welcome to Marketmate!',
//       widget.selectedLanguage,
//     );
//     String descriptionText = await translator.translateText(
//       'Instantly connect with larger markets and grow your business.',
//       widget.selectedLanguage,
//     );
//     setState(() {
//       _translatedWelcomeText = welcomeText;
//       _translatedDescription = descriptionText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Marketmate'),
//         actions: [
//           IconButton(
//             icon: Icon(widget.isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
//             onPressed: () {
//               widget.onThemeChange(!widget.isDarkMode);
//             },
//           ),
//           DropdownButton<String>(
//             value: widget.selectedLanguage,
//             items: const [
//               DropdownMenuItem(value: 'en', child: Text('English')),
//               DropdownMenuItem(value: 'hi', child: Text('Hindi')),
//               DropdownMenuItem(value: 'es', child: Text('Spanish')),
//               DropdownMenuItem(value: 'fr', child: Text('French')),
//               DropdownMenuItem(value: 'de', child: Text('German')),
//             ],
//             onChanged: (String? value) {
//               widget.onLanguageChange(value ?? 'en');
//               _translateTexts();
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images.jpg',
//               height: 250,
//             ),
//             const SizedBox(height: 20),
//             Text(
//               _translatedWelcomeText,
//               style: const TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 10),
//             Text(
//               _translatedDescription,
//               style: const TextStyle(fontSize: 16),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignUpPage()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               ),
//               child: const Text(
//                 'Sign Up Now',
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
