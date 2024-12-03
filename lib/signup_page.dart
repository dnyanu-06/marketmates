// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

//these is final code
// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   String firstName = '';
//   String lastName = '';
//   String gstin = '';
//   String phone = '';
//   String email = '';
//   String aadhar = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sign Up"),
//         backgroundColor: const Color.fromARGB(255, 2, 220, 209),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.blue.withOpacity(0.1),
//                   spreadRadius: 4,
//                   blurRadius: 10,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             padding: EdgeInsets.all(20),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Text(
//                     'Create Your Account',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: const Color.fromARGB(255, 39, 148, 199),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 20),
//                   _buildTextField('First Name', (val) => firstName = val,
//                       'Please enter your first name'),
//                   _buildTextField('Last Name', (val) => lastName = val,
//                       'Please enter your last name'),
//                   _buildTextField('GSTIN/CIN Number', (val) => gstin = val,
//                       'Please enter your GSTIN/CIN number', 15),
//                   _buildTextField(
//                       'Phone Number',
//                       (val) => phone = val,
//                       'Please enter your phone number',
//                       10,
//                       TextInputType.phone),
//                   _buildTextField(
//                       'Email',
//                       (val) => email = val,
//                       'Please enter your email',
//                       null,
//                       TextInputType.emailAddress),
//                   _buildTextField(
//                       'Aadhar Number',
//                       (val) => aadhar = val,
//                       'Please enter your Aadhar number',
//                       12,
//                       TextInputType.number),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _verifyDetails,
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       backgroundColor: const Color.fromARGB(
//                           255, 3, 202, 220), // Background color
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Text("Sign Up",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: const Color.fromARGB(255, 72, 71, 71))),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//       String label, Function(String) onChanged, String validatorMessage,
//       [int? length, TextInputType? keyboardType]) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextFormField(
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.blueAccent),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.blueAccent, width: 2),
//           ),
//           filled: true,
//           fillColor: const Color.fromARGB(255, 1, 72, 72),
//         ),
//         onChanged: onChanged,
//         validator: (val) {
//           if (val == null || val.isEmpty) {
//             return validatorMessage;
//           }
//           if (length != null && val.length != length) {
//             return 'Please enter a valid $label ($length characters)';
//           }
//           return null;
//         },
//         keyboardType: keyboardType,
//       ),
//     );
//   }

//   // Step 1: Verify MSME data and check if the user is already registered
//   void _verifyDetails() async {
//     if (_formKey.currentState!.validate()) {
//       FirebaseFirestore firestore = FirebaseFirestore.instance;

//       // Check if the user's details exist in the 'msme' collection
//       QuerySnapshot msmeQuery = await firestore
//           .collection('msme')
//           .where('first_name', isEqualTo: firstName)
//           .where('last_name', isEqualTo: lastName)
//           .where('gstin', isEqualTo: gstin)
//           .get();

//       if (msmeQuery.docs.isNotEmpty) {
//         // Check if the user is already registered with the same details
//         QuerySnapshot userQuery = await firestore
//             .collection('verified_users')
//             .where('first_name', isEqualTo: firstName)
//             .where('last_name', isEqualTo: lastName)
//             .where('gstin', isEqualTo: gstin)
//             .get();

//         if (userQuery.docs.isNotEmpty) {
//           // If already registered, show a message
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                   "You are already registered with the same details. Please use different data."),
//             ),
//           );
//         } else {
//           // Proceed with sending the verification email
//           _sendVerificationEmail();
//         }
//       } else {
//         // Check if user is in the unverified collection
//         QuerySnapshot unverifiedQuery = await firestore
//             .collection('unverified_users')
//             .where('email', isEqualTo: email)
//             .get();

//         if (unverifiedQuery.docs.isNotEmpty) {
//           // User is unverified but using the same email
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                   "Your details don't match our records. Please try again."),
//             ),
//           );
//           // Save unverified data
//           _storeUnverifiedUserData();
//         } else {
//           // New registration with unmatched data, save to unverified_users
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(
//                   "Your details are not found in the MSME database. Data saved as unverified."),
//             ),
//           );
//           // Save unverified data
//           _storeUnverifiedUserData();
//         }
//       }
//     }
//   }

//   // Send verification email for verified users
//   void _sendVerificationEmail() async {
//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: 'temporaryPassword123',
//       );
//       await userCredential.user!.sendEmailVerification();
//       _storeUserData();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text("Verification email sent! Please check your inbox.")),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to send verification email: $e")),
//       );
//     }
//   }

//   // Step 3: Store verified user data in Firestore
//   Future<void> _storeUserData() async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     await firestore.collection('verified_users').add({
//       'first_name': firstName,
//       'last_name': lastName,
//       'gstin': gstin,
//       'phone': phone,
//       'email': email,
//       'aadhar': aadhar,
//       'verified_at': Timestamp.now(),
//     });
//   }

//   // Store unverified user data in Firestore
//   Future<void> _storeUnverifiedUserData() async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     await firestore.collection('unverified_users').add({
//       'first_name': firstName,
//       'last_name': lastName,
//       'gstin': gstin,
//       'phone': phone,
//       'email': email,
//       'aadhar': aadhar,
//       'created_at': Timestamp.now(),
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String gstin = '';
  String phone = '';
  String email = '';
  String aadhar = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: const Color.fromARGB(255, 2, 220, 209),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Create Your Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 2, 131, 191),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  _buildTextField('First Name', (val) => firstName = val,
                      'Please enter your first name'),
                  _buildTextField('Last Name', (val) => lastName = val,
                      'Please enter your last name'),
                  _buildTextField('GSTIN/CIN Number', (val) => gstin = val,
                      'Please enter your GSTIN/CIN number', 15),
                  _buildTextField(
                      'Phone Number',
                      (val) => phone = val,
                      'Please enter your phone number',
                      10,
                      TextInputType.phone),
                  _buildTextField(
                      'Email',
                      (val) => email = val,
                      'Please enter your email',
                      null,
                      TextInputType.emailAddress),
                  _buildTextField(
                      'Aadhar Number',
                      (val) => aadhar = val,
                      'Please enter your Aadhar number',
                      12,
                      TextInputType.number),
                  _buildTextField('Password', (val) => password = val,
                      'Please enter a strong password'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _verifyDetails,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color.fromARGB(
                          255, 3, 202, 220), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Sign Up",
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 58, 57, 57))),
                  ),
                  SizedBox(height: 20),
                  // Login option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Custom text field widget to reduce redundancy
  Widget _buildTextField(
      String label, Function(String) onChanged, String validatorMessage,
      [int? length, TextInputType? keyboardType]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 119, 185, 185),
        ),
        onChanged: onChanged,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return validatorMessage;
          }
          if (length != null && val.length != length) {
            return 'Please enter a valid $label ($length characters)';
          }
          return null;
        },
        keyboardType: keyboardType,
      ),
    );
  }

  // Step 1: Verify MSME data and check if the user is already registered
//   void _verifyDetails() async {
//     if (_formKey.currentState!.validate()) {
//       FirebaseFirestore firestore = FirebaseFirestore.instance;

//       // Check if the user's details exist in the 'msme' collection
//       QuerySnapshot msmeQuery = await firestore
//           .collection('msme')
//           .where('first_name', isEqualTo: firstName)
//           .where('last_name', isEqualTo: lastName)
//           .where('gstin', isEqualTo: gstin)
//           .get();

//       if (msmeQuery.docs.isNotEmpty) {
//         // If the user's details are verified, proceed with email verification
//         _sendVerificationEmail();
//       } else {
//         // Save the unverified user data
//         _storeUnverifiedUserData();

//         // Inform the user that their details don't match MSME records
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//                 "Your details do not match MSME records. You are now marked as unverified."),
//           ),
//         );
//       }
//     }
//   }

//   // Step 2: Send verification email for verified users
//   // Step 2: Send verification email for verified users
//   void _sendVerificationEmail() async {
//     try {
//       // Register the user with Firebase Authentication
//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       // Send a verification email
//       await userCredential.user!.sendEmailVerification();

//       // Store verified user data in Firestore
//       _storeUserData(userCredential.user!.uid);

//       // Notify the user and navigate to login page
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text("Verification email sent! Please check your inbox.")),
//       );

//       // Navigate to LoginPage
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => SignInPage()),
//       );
//     } catch (e) {
//       // Handle error
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to send verification email: $e")),
//       );
//     }
//   }

//   // Step 3: Store verified user data in Firestore
//   Future<void> _storeUserData(String uid) async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     await firestore.collection('verified_users').doc(uid).set({
//       'first_name': firstName,
//       'last_name': lastName,
//       'gstin': gstin,
//       'phone': phone,
//       'email': email,
//       'aadhar': aadhar,
//       'verified_at': Timestamp.now(),
//     });
//   }

//   // Step 4: Store unverified user data in Firestore
//   Future<void> _storeUnverifiedUserData() async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     await firestore.collection('unverified_users').add({
//       'first_name': firstName,
//       'last_name': lastName,
//       'gstin': gstin,
//       'phone': phone,
//       'email': email,
//       'aadhar': aadhar,
//       'created_at': Timestamp.now(),
//     });
//   }
// }
  void _verifyDetails() async {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      try {
        // Step 1: Check if the email is already in the verified_users collection
        final verifiedEmailQuery = await firestore
            .collection('verified_users')
            .where('email', isEqualTo: email)
            .get();

        if (verifiedEmailQuery.docs.isNotEmpty) {
          // Email is already verified, so we prevent duplicate registration
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "This email is already verified. Please log in instead.",
              ),
            ),
          );
          return;
        }

        // Step 2: Check if first name, last name, and GSTIN/CIN are already verified
        final verifiedDetailsQuery = await firestore
            .collection('verified_users')
            .where('first_name', isEqualTo: firstName)
            .where('last_name', isEqualTo: lastName)
            .where('gstin', isEqualTo: gstin)
            .get();

        if (verifiedDetailsQuery.docs.isNotEmpty) {
          // User details are already verified, so we prevent duplicate registration
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "These user details are already verified. Please log in instead.",
              ),
            ),
          );
          return;
        }

        // Step 3: Check MSME dataset for verification
        final msmeQuery = await firestore
            .collection('msme')
            .where('first_name', isEqualTo: firstName)
            .where('last_name', isEqualTo: lastName)
            .where('gstin', isEqualTo: gstin)
            .get();

        if (msmeQuery.docs.isNotEmpty) {
          // User details verified, proceed to email verification
          // ignore: await_only_futures
          _sendVerificationEmail();
        } else {
          // User details do not match MSME records, store data in unverified_users
          await _storeUnverifiedUserData();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "Details do not match MSME records. You are marked as unverified."),
            ),
          );
        }
      } catch (e) {
        // Handle any errors during the process
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An error occurred: $e")),
        );
      }
    }
  }

// Step 2: Send verification email for verified users
  void _sendVerificationEmail() async {
    try {
      // Register the user with Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send a verification email
      await userCredential.user!.sendEmailVerification();

      // Store verified user data in Firestore
      _storeUserData(userCredential.user!.uid);

      // Notify the user and navigate to login page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Verification email sent! Please check your inbox.")),
      );

      // Navigate to LoginPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send verification email: $e")),
      );
    }
  }

// Step 3: Store verified user data in Firestore
  Future<void> _storeUserData(String uid) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('verified_users').doc(uid).set({
      'first_name': firstName,
      'last_name': lastName,
      'gstin': gstin,
      'phone': phone,
      'email': email,
      'aadhar': aadhar,
      'verified_at': Timestamp.now(),
    });
  }

// Step 4: Store unverified user data in Firestore
  Future<void> _storeUnverifiedUserData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Check if email or details are already present in unverified_users to avoid duplicate entries
    final unverifiedQuery = await firestore
        .collection('unverified_users')
        .where('email', isEqualTo: email)
        .get();

    if (unverifiedQuery.docs.isEmpty) {
      await firestore.collection('unverified_users').add({
        'first_name': firstName,
        'last_name': lastName,
        'gstin': gstin,
        'phone': phone,
        'email': email,
        'aadhar': aadhar,
        'created_at': Timestamp.now(),
      });
    }
  }
}
