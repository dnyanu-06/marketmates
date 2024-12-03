// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // //import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'welcome_page.dart'; // Import Welcome Page

// // class LoginPage extends StatefulWidget {
// //   @override
// //   _LoginPageState createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   String email = '';
// //   String password = '';

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Login"),
// //         backgroundColor: const Color.fromARGB(255, 2, 220, 209),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Form(
// //             key: _formKey,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: <Widget>[
// //                 Text(
// //                   'Sign In',
// //                   style: TextStyle(
// //                     fontSize: 28,
// //                     fontWeight: FontWeight.bold,
// //                     color: const Color.fromARGB(255, 39, 148, 199),
// //                   ),
// //                   textAlign: TextAlign.center,
// //                 ),
// //                 SizedBox(height: 20),
// //                 _buildTextField(
// //                   'Email',
// //                   (val) => email = val,
// //                   'Please enter your email',
// //                   TextInputType.emailAddress,
// //                 ),
// //                 _buildTextField(
// //                   'Password',
// //                   (val) => password = val,
// //                   'Please enter your password',
// //                   TextInputType.visiblePassword,
// //                   obscureText: true,
// //                 ),
// //                 SizedBox(height: 20),
// //                 ElevatedButton(
// //                   onPressed: _signIn,
// //                   style: ElevatedButton.styleFrom(
// //                     padding: EdgeInsets.symmetric(vertical: 16),
// //                     backgroundColor: const Color.fromARGB(255, 3, 202, 220),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                     ),
// //                   ),
// //                   child: Text("Login",
// //                       style: TextStyle(
// //                           fontSize: 18,
// //                           color: const Color.fromARGB(255, 72, 71, 71))),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildTextField(String label, Function(String) onChanged,
// //       String validatorMessage, TextInputType keyboardType,
// //       {bool obscureText = false}) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 16.0),
// //       child: TextFormField(
// //         decoration: InputDecoration(
// //           labelText: label,
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(8),
// //             borderSide: BorderSide(color: Colors.blueAccent),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(8),
// //             borderSide: BorderSide(color: Colors.blueAccent, width: 2),
// //           ),
// //           filled: true,
// //           fillColor: const Color.fromARGB(255, 1, 72, 72),
// //         ),
// //         onChanged: onChanged,
// //         validator: (val) {
// //           if (val == null || val.isEmpty) {
// //             return validatorMessage;
// //           }
// //           return null;
// //         },
// //         keyboardType: keyboardType,
// //         obscureText: obscureText,
// //       ),
// //     );
// //   }

// //   Future<void> _signIn() async {
// //     if (_formKey.currentState!.validate()) {
// //       try {
// //         UserCredential userCredential =
// //             await FirebaseAuth.instance.signInWithEmailAndPassword(
// //           email: email,
// //           password: password,
// //         );

// //         // Check if the email is verified
// //         if (userCredential.user!.emailVerified) {
// //           // Navigate to the Welcome Page
// //           Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(builder: (context) => WelcomePage()),
// //           );
// //         } else {
// //           // Sign out the user if email is not verified
// //           await FirebaseAuth.instance.signOut();
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(
// //                 content: Text("Please verify your email before logging in.")),
// //           );
// //         }
// //       } catch (e) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text("Login failed: $e")),
// //         );
// //       }
// //     }
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'admin_dashboard.dart'; // Import the admin dashboard page
// import 'welcome_page.dart'; // Import the welcome page for normal users

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   String email = '';
//   String password = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 onChanged: (val) => email = val,
//                 validator: (val) =>
//                     val!.isEmpty ? 'Please enter your email' : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 onChanged: (val) => password = val,
//                 obscureText: true,
//                 validator: (val) =>
//                     val!.isEmpty ? 'Please enter your password' : null,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Function to log in the user/admin
//   void _login() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         // Authenticate the user with Firebase
//         UserCredential userCredential = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: email, password: password);

//         // Check if the user is an admin by fetching from Firestore
//         DocumentSnapshot adminSnapshot = await FirebaseFirestore.instance
//             .collection('admin')
//             .doc(email)
//             .get();

//         if (adminSnapshot.exists) {
//           // If admin, navigate to the admin dashboard
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => AdminDashboardPage()),
//           );
//         } else {
//           // If not admin, check if the user is verified
//           if (userCredential.user!.emailVerified) {
//             // Navigate to the user welcome page if verified
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => WelcomePage()),
//             );
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Please verify your email first!')),
//             );
//           }
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Login failed: $e')),
//         );
//       }
//     }
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'admin_dashboard.dart'; // Import the admin dashboard page
// import 'welcome_page.dart'; // Import the welcome page for normal users

// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final _formKey = GlobalKey<FormState>();
//   String email = '';
//   String password = '';
//   bool isAdmin = false; // to check if the user is admin

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login"),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 onChanged: (val) {
//                   email = val;
//                 },
//                 validator: (val) {
//                   if (val == null || val.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 onChanged: (val) {
//                   password = val;
//                 },
//                 validator: (val) {
//                   if (val == null || val.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _signIn,
//                 child: Text("Login"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _signIn() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         // First, check if it's an admin login
//         FirebaseFirestore firestore = FirebaseFirestore.instance;
//         QuerySnapshot adminQuery = await firestore
//             .collection('admin')
//             .where('email', isEqualTo: email)
//             .where('password', isEqualTo: password)
//             .get();

//         if (adminQuery.docs.isNotEmpty) {
//           // It's an admin login, check password and log the admin in
//           DocumentSnapshot adminDoc = adminQuery.docs.first;
//           if (adminDoc['password'] == password) {
//             setState(() {
//               isAdmin = true;
//             });

//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AdminDashboard()),
//             );
//           } else {
//             _showError("Invalid admin password.");
//           }
//         } else {
//           // Normal user login
//           UserCredential userCredential = await FirebaseAuth.instance
//               .signInWithEmailAndPassword(email: email, password: password);

//           if (userCredential.user != null) {
//             // Check if email is verified
//             if (userCredential.user!.emailVerified) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => WelcomePage()),
//               );
//             } else {
//               _showError("Please verify your email before logging in.");
//             }
//           }
//         }
//       } catch (e) {
//         _showError("Failed to login: $e");
//       }
//     }
//   }

//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'admin_dashboard.dart'; // Import the admin dashboard page
// import 'welcome_page.dart'; // Import the welcome page for normal users

// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final _formKey = GlobalKey<FormState>();
//   String email = '';
//   String password = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 15,
//                     spreadRadius: 5,
//                     offset: Offset(0, 5),
//                   ),
//                 ],
//               ),
//               padding: const EdgeInsets.all(32.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Icon(Icons.lock_outline, size: 80, color: Colors.teal),
//                     SizedBox(height: 20),
//                     Text(
//                       'Sign In',
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal[800],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     _buildTextField(
//                       label: 'Email',
//                       onChanged: (val) => email = val,
//                       validator: (val) => val == null || val.isEmpty
//                           ? 'Enter your email'
//                           : null,
//                     ),
//                     SizedBox(height: 20),
//                     _buildTextField(
//                       label: 'Password',
//                       obscureText: true,
//                       onChanged: (val) => password = val,
//                       validator: (val) => val == null || val.isEmpty
//                           ? 'Enter your password'
//                           : null,
//                     ),
//                     SizedBox(height: 30),
//                     ElevatedButton(
//                       onPressed: _signIn,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.teal,
//                         padding:
//                             EdgeInsets.symmetric(vertical: 12, horizontal: 30),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: Text(
//                         "Login",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     GestureDetector(
//                       onTap: _forgotPassword,
//                       child: Text(
//                         "Forgot Password?",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.teal[700],
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String label,
//     required Function(String) onChanged,
//     required String? Function(String?) validator,
//     bool obscureText = false,
//   }) {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Colors.teal[700]),
//         filled: true,
//         fillColor: Colors.grey[100],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.teal),
//         ),
//       ),
//       obscureText: obscureText,
//       onChanged: onChanged,
//       validator: validator,
//     );
//   }

//   Future<void> _signIn() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         final firestore = FirebaseFirestore.instance;

//         // Check if credentials match an admin user
//         final adminQuery = await firestore
//             .collection('admin')
//             .where('email', isEqualTo: email)
//             .where('password', isEqualTo: password)
//             .get();

//         if (adminQuery.docs.isNotEmpty) {
//           // Admin credentials match, proceed to Admin Dashboard
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => AdminDashboard()),
//           );
//         } else {
//           // Check for regular user in Firebase Authentication
//           UserCredential userCredential = await FirebaseAuth.instance
//               .signInWithEmailAndPassword(email: email, password: password);

//           if (userCredential.user != null) {
//             // Check if the user's email is verified
//             if (userCredential.user!.emailVerified) {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => WelcomePage()),
//               );
//             } else {
//               _showError("Please verify your email before logging in.");
//             }
//           }
//         }
//       } catch (e) {
//         _showError("Failed to login: $e");
//       }
//     }
//   }

//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.redAccent,
//       ),
//     );
//   }

//   // Forgot Password Method
//   void _forgotPassword() async {
//     if (email.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Please enter your email to reset password."),
//         ),
//       );
//       return;
//     }

//     try {
//       final firestore = FirebaseFirestore.instance;

//       // Check if the entered email belongs to an admin
//       final adminQuery = await firestore
//           .collection('admin')
//           .where('email', isEqualTo: email)
//           .get();

//       // If email belongs to an admin, display a message
//       if (adminQuery.docs.isNotEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content:
//                 Text("Admin accounts are not allowed to reset passwords here."),
//           ),
//         );
//         return;
//       }

//       // Check if the email exists in Firebase Authentication and is verified
//       User? user = await FirebaseAuth.instance
//           .fetchSignInMethodsForEmail(email)
//           .then((signInMethods) => signInMethods.isNotEmpty
//               ? FirebaseAuth.instance.currentUser
//               : null);

//       if (user != null && user.email == email) {
//         if (user.emailVerified) {
//           // Send password reset email if the email is verified
//           await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                   "Password reset email sent! Please check your inbox to reset your password."),
//             ),
//           );
//         } else {
//           // User's email is not verified
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text("First, verify your email to reset your password."),
//             ),
//           );
//         }
//       } else {
//         // Email doesn't exist or is unverified
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("No verified user found with this email."),
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to send password reset email: $e")),
//       );
//     }
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'admin_dashboard.dart'; // Import the admin dashboard page
// import 'welcome_page.dart'; // Import the welcome page for normal users
// import 'business_profile_page.dart'; // Import the Business Profile Page

// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final _formKey = GlobalKey<FormState>();
//   String email = '';
//   String password = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 15,
//                     spreadRadius: 5,
//                     offset: Offset(0, 5),
//                   ),
//                 ],
//               ),
//               padding: const EdgeInsets.all(32.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Icon(Icons.lock_outline, size: 80, color: Colors.teal),
//                     SizedBox(height: 20),
//                     Text(
//                       'Sign In',
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal[800],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     _buildTextField(
//                       label: 'Email',
//                       onChanged: (val) => email = val,
//                       validator: (val) => val == null || val.isEmpty
//                           ? 'Enter your email'
//                           : null,
//                     ),
//                     SizedBox(height: 20),
//                     _buildTextField(
//                       label: 'Password',
//                       obscureText: true,
//                       onChanged: (val) => password = val,
//                       validator: (val) => val == null || val.isEmpty
//                           ? 'Enter your password'
//                           : null,
//                     ),
//                     SizedBox(height: 30),
//                     ElevatedButton(
//                       onPressed: _signIn,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.teal,
//                         padding:
//                             EdgeInsets.symmetric(vertical: 12, horizontal: 30),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: Text(
//                         "Login",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     GestureDetector(
//                       onTap: _forgotPassword,
//                       child: Text(
//                         "Forgot Password?",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.teal[700],
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String label,
//     required Function(String) onChanged,
//     required String? Function(String?) validator,
//     bool obscureText = false,
//   }) {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Colors.teal[700]),
//         filled: true,
//         fillColor: Colors.grey[100],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.teal),
//         ),
//       ),
//       obscureText: obscureText,
//       onChanged: onChanged,
//       validator: validator,
//     );
//   }

//   Future<void> _signIn() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         final firestore = FirebaseFirestore.instance;
//         UserCredential userCredential = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: email, password: password);

//         if (userCredential.user != null && userCredential.user!.emailVerified) {
//           final userUid = userCredential.user!.uid;

//           // Check if the user's UID exists in the `verified_users` collection
//           final verifiedUserCheck =
//               await firestore.collection('verified_users').doc(userUid).get();

//           if (verifiedUserCheck.exists) {
//             // Now check if the UID exists in the `business_categories` collection
//             final profileCheck = await firestore
//                 .collection('business_categories')
//                 .where('userUid', isEqualTo: userUid)
//                 .get();

//             if (profileCheck.docs.isNotEmpty) {
//               // Profile exists with the matching UID, navigate to Business Profile Page
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BusinessProfilePage(userUid: userUid),
//                 ),
//               );
//             } else {
//               // No profile found with the matching UID, navigate to Welcome Page
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => WelcomePage(userUid: userUid),
//                 ),
//               );
//             }
//           } else {
//             _showError("User is not verified.");
//           }
//         } else {
//           _showError("Please verify your email before logging in.");
//         }
//       } catch (e) {
//         _showError("Failed to login: $e");
//       }
//     }
//   }

//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.redAccent,
//       ),
//     );
//   }

//   // Forgot Password Method
//   void _forgotPassword() async {
//     if (email.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Please enter your email to reset password."),
//         ),
//       );
//       return;
//     }

//     try {
//       final firestore = FirebaseFirestore.instance;

//       // Check if the entered email belongs to an admin
//       final adminQuery = await firestore
//           .collection('admin')
//           .where('email', isEqualTo: email)
//           .get();

//       // If email belongs to an admin, display a message
//       if (adminQuery.docs.isNotEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content:
//                 Text("Admin accounts are not allowed to reset passwords here."),
//           ),
//         );
//         return;
//       }

//       // Send password reset email if the email is verified
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//               "Password reset email sent! Please check your inbox to reset your password."),
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to send password reset email: $e")),
//       );
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'business_profile_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    spreadRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.lock_outline, size: 80, color: Colors.teal),
                    SizedBox(height: 20),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800],
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      label: 'Email',
                      onChanged: (val) => email = val,
                      validator: (val) => val == null || val.isEmpty
                          ? 'Enter your email'
                          : null,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      label: 'Password',
                      obscureText: true,
                      onChanged: (val) => password = val,
                      validator: (val) => val == null || val.isEmpty
                          ? 'Enter your password'
                          : null,
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _signIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: _forgotPassword,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal[700],
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    required String? Function(String?) validator,
    bool obscureText = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.teal[700]),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
    );
  }

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        final firestore = FirebaseFirestore.instance;
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (userCredential.user != null && userCredential.user!.emailVerified) {
          final userUid = userCredential.user!.uid;

          // Check if the user's UID exists in the `verified_users` collection
          final verifiedUserCheck =
              await firestore.collection('verified_users').doc(userUid).get();

          if (verifiedUserCheck.exists) {
            // Now check if the UID exists in the `business_categories` collection
            final profileCheck = await firestore
                .collection('business_categories')
                .where('userUid', isEqualTo: userUid)
                .get();

            if (profileCheck.docs.isNotEmpty) {
              // Profile exists with the matching UID, navigate to Business Profile Page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BusinessProfilePage(userUid: userUid),
                ),
              );
            } else {
              // No profile found with the matching UID, navigate to Welcome Page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomePage(userUid: userUid),
                ),
              );
            }
          } else {
            _showError("User is not verified.");
          }
        } else {
          _showError("Please verify your email before logging in.");
        }
      } catch (e) {
        _showError("Failed to login: $e");
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  // Forgot Password Method
  void _forgotPassword() async {
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter your email to reset password."),
        ),
      );
      return;
    }

    try {
      final firestore = FirebaseFirestore.instance;

      // Check if the entered email belongs to an admin
      final adminQuery = await firestore
          .collection('admin')
          .where('email', isEqualTo: email)
          .get();

      // If email belongs to an admin, display a message
      if (adminQuery.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text("Admin accounts are not allowed to reset passwords here."),
          ),
        );
        return;
      }

      // Send password reset email if the email is verified
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Password reset email sent! Please check your inbox to reset your password."),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send password reset email: $e")),
      );
    }
  }
}
