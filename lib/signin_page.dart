// import 'package:flutter/material.dart';
// import 'package:markatemate/BusinessCategory.dart';
// import 'signup_page.dart'; // Import the SignUpPage
// import 'forgot_password_page.dart';
// // Import the ForgotPasswordPage

// class SignInPage extends StatefulWidget {
//   final String language;

//   SignInPage({required this.language});

//   Map<String, Map<String, String>> labels = {
//     'English': {
//       'email': 'Enter Email ID',
//       'password': 'Enter Password',
//       'signIn': 'Sign In',
//       'forgotPassword': 'Forgot Password?',
//       'noAccount': 'Don\'t have an account?',
//       'signUp': 'Sign Up',
//     },
//     'Hindi': {
//       'email': 'ईमेल आईडी दर्ज करें',
//       'password': 'पासवर्ड दर्ज करें',
//       'signIn': 'साइन इन करें',
//       'forgotPassword': 'पासवर्ड भूल गए?',
//       'noAccount': 'क्या आपके पास खाता नहीं है?',
//       'signUp': 'साइन अप करें',
//     },
//     'Marathi': {
//       'email': 'ईमेल आयडी प्रविष्ट करा',
//       'password': 'पासवर्ड प्रविष्ट करा',
//       'signIn': 'साइन इन करा',
//       'forgotPassword': 'पासवर्ड विसरलात?',
//       'noAccount': 'आपला खाता नाही का?',
//       'signUp': 'साइन अप करा',
//     },
//     'Gujarati': {
//       'email': 'ઇમેલ આઈડી દાખલ કરો',
//       'password': 'પાસવર્ડ દાખલ કરો',
//       'signIn': 'સાઇન ઇન કરો',
//       'forgotPassword': 'પાસવર્ડ ભૂલી ગયા?',
//       'noAccount': 'તમારા પાસે ખાતું નથી?',
//       'signUp': 'સાઇન અપ કરો',
//     }
//   };

//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final _formKey = GlobalKey<FormState>();

//   // Text Controllers for form fields
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     // Dispose controllers when not in use
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In', style: TextStyle(fontSize: 22)),
//         backgroundColor: Colors.teal,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Welcome Back!',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.teal[700],
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Please sign in to continue.',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 SizedBox(height: 20),

//                 // Email Field
//                 _buildTextField(
//                   controller: _emailController,
//                   labelText: widget.labels[widget.language]!['email']!,
//                   hintText: 'Enter Email',
//                   icon: Icons.email,
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 SizedBox(height: 16),

//                 // Password Field
//                 _buildTextField(
//                   controller: _passwordController,
//                   labelText: widget.labels[widget.language]!['password']!,
//                   hintText: 'Enter Password',
//                   icon: Icons.lock,
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 30),

//                 // Sign In Button
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Perform Sign In action
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               BusinessCategoryPage(), // Navigate to Market Profile
//                         ),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal,
//                     padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: Text(
//                     widget.labels[widget.language]!['signIn']!,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),

//                 SizedBox(height: 10),

//                 // Forgot Password Button
//                 TextButton(
//                   onPressed: () {
//                     // Navigate to Forgot Password Page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             ForgotPasswordPage(language: widget.language),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     widget.labels[widget.language]!['forgotPassword']!,
//                     style: TextStyle(
//                       color: Colors.teal,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 20),

//                 // No Account / Sign Up Button
//                 TextButton(
//                   onPressed: () {
//                     // Navigate to Sign Up
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             SignUpPage(state: '', language: widget.language),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     widget.labels[widget.language]!['noAccount']! +
//                         ' ' +
//                         widget.labels[widget.language]!['signUp']!,
//                     style: TextStyle(
//                       color: Colors.teal,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Function to build attractive text fields
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//     required String hintText,
//     required IconData icon,
//     bool obscureText = false,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       keyboardType: keyboardType,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter $labelText';
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: labelText,
//         hintText: hintText,
//         prefixIcon: Icon(icon, color: Colors.teal),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.teal),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         filled: true,
//         fillColor: Colors.grey[100],
//       ),
//     );
//   }
// }

//import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _signIn() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text,
//         );
//         User? user = userCredential.user;

//         if (user != null) {
//           print("User signed in: ${user.email}");
//           // Navigate to your home page after successful sign-in
//           // For example: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
//         }
//       } on FirebaseAuthException catch (e) {
//         print("Sign in failed: $e");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Failed to sign in: ${e.message}")),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In', style: TextStyle(fontSize: 22)),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               // Email
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               // Password
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),

//               // Sign In Button
//               ElevatedButton(
//                 onPressed: _signIn,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                   padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: Text('Sign In', style: TextStyle(fontSize: 18)),
//               ),

//               // Navigate to Sign Up Page
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SignUpPage()),
//                   );
//                 },
//                 child: Text("Don't have an account? Sign Up"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final _formKey = GlobalKey<FormState>();
//   String email = '';
//   String password = '';
//   String firstName = '';
//   String gstin = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Sign In")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               // Email Field
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 onChanged: (val) => email = val,
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (val) {
//                   if (val == null || val.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val)) {
//                     return 'Please enter a valid email address';
//                   }
//                   return null;
//                 },
//               ),
//               // Password Field
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 onChanged: (val) => password = val,
//                 obscureText: true,
//                 validator: (val) {
//                   if (val == null || val.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//               ),
//               // First Name Field
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'First Name'),
//                 onChanged: (val) => firstName = val,
//                 validator: (val) {
//                   if (val == null || val.isEmpty) {
//                     return 'Please enter your first name';
//                   }
//                   return null;
//                 },
//               ),
//               // GSTIN/CIN Field
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'GSTIN/CIN Number'),
//                 onChanged: (val) => gstin = val,
//                 validator: (val) {
//                   if (val == null || val.isEmpty) {
//                     return 'Please enter your GSTIN/CIN number';
//                   }
//                   if (val.length != 15) {
//                     return 'Please enter a valid GSTIN/CIN number (15 characters)';
//                   }
//                   return null;
//                 },
//               ),
//               // Sign In Button
//               ElevatedButton(
//                 onPressed: _signIn,
//                 child: Text("Sign In"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Sign In Logic
//   void _signIn() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         // Sign in with Firebase Authentication
//         UserCredential userCredential =
//             await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         // Check if the user is in the verified_users collection
//         FirebaseFirestore firestore = FirebaseFirestore.instance;
//         DocumentSnapshot userDoc = await firestore
//             .collection('verified_users')
//             .doc(userCredential.user!.uid)
//             .get();

//         if (userDoc.exists) {
//           // Validate first name and GSTIN/CIN number
//           if (userDoc['first_name'] == firstName && userDoc['gstin'] == gstin) {
//             // Successful sign-in
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("Sign In Successful!")),
//             );
//             // Navigate to the next page or dashboard
//             // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text("First name or GSTIN/CIN number is incorrect."),
//               ),
//             );
//           }
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("User not found in verified users.")),
//           );
//         }
//       } catch (e) {
//         // Handle sign-in error
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Failed to sign in: $e")),
//         );
//       }
//     }
//   }
// }

// import 'package:flutter/material.dart';

// class SignInPage extends StatelessWidget {
//   final String email; // Optional, in case you want to pre-fill

//   SignInPage({this.email = ''});

//   @override
//   Widget build(BuildContext context) {
//     final emailController = TextEditingController(text: email);
//     final cinController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(title: Text("Sign In")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             TextFormField(
//               controller: cinController,
//               decoration: InputDecoration(labelText: 'CIN Number'),
//               keyboardType: TextInputType.text,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 // Sign in logic here
//                 // Use emailController.text and cinController.text for sign-in
//               },
//               child: Text("Sign In"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
