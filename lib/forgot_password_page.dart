// // import 'package:flutter/material.dart';

// // class ForgotPasswordPage extends StatefulWidget {
// //   final String language;

// //   ForgotPasswordPage({required this.language});

// //   Map<String, Map<String, String>> labels = {
// //     'English': {
// //       'email': 'Enter your Email ID',
// //       'sendLink': 'Send Password Reset Link',
// //       'backToSignIn': 'Back to Sign In',
// //     },
// //     'Hindi': {
// //       'email': 'अपना ईमेल आईडी दर्ज करें',
// //       'sendLink': 'पासवर्ड रीसेट लिंक भेजें',
// //       'backToSignIn': 'साइन इन पर वापस जाएं',
// //     },
// //     'Marathi': {
// //       'email': 'तुमचा ईमेल आयडी प्रविष्ट करा',
// //       'sendLink': 'पासवर्ड रीसेट लिंक पाठवा',
// //       'backToSignIn': 'साइन इनवर परत जा',
// //     },
// //     'Gujarati': {
// //       'email': 'તમારો ઇમેલ આઈડી દાખલ કરો',
// //       'sendLink': 'પાસવર્ડ ફરીથી સેટ કરવાની લિંક મોકલો',
// //       'backToSignIn': 'સાઇન ઇન પર પાછા જાઓ',
// //     }
// //   };

// //   @override
// //   _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
// // }

// // class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final TextEditingController _emailController = TextEditingController();

// //   @override
// //   void dispose() {
// //     _emailController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Forgot Password', style: TextStyle(fontSize: 22)),
// //         backgroundColor: Colors.teal,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Text(
// //                 'Reset Your Password',
// //                 style: TextStyle(
// //                   fontSize: 24,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.teal[700],
// //                 ),
// //               ),
// //               SizedBox(height: 20),

// //               // Email Field
// //               _buildTextField(
// //                 controller: _emailController,
// //                 labelText: widget.labels[widget.language]!['email']!,
// //                 hintText: 'Enter Email',
// //                 icon: Icons.email,
// //                 keyboardType: TextInputType.emailAddress,
// //               ),
// //               SizedBox(height: 30),

// //               // Send Link Button
// //               ElevatedButton(
// //                 onPressed: () {
// //                   if (_formKey.currentState!.validate()) {
// //                     // Handle sending password reset link
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(
// //                         content: Text('Sending Password Reset Link...'),
// //                       ),
// //                     );
// //                   }
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.teal,
// //                   padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(30),
// //                   ),
// //                 ),
// //                 child: Text(
// //                   widget.labels[widget.language]!['sendLink']!,
// //                   style: TextStyle(fontSize: 18),
// //                 ),
// //               ),

// //               SizedBox(height: 20),

// //               // Back to Sign In Button
// //               TextButton(
// //                 onPressed: () {
// //                   Navigator.pop(context);
// //                 },
// //                 child: Text(
// //                   widget.labels[widget.language]!['backToSignIn']!,
// //                   style: TextStyle(
// //                     color: Colors.teal,
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildTextField({
// //     required TextEditingController controller,
// //     required String labelText,
// //     required String hintText,
// //     required IconData icon,
// //     TextInputType keyboardType = TextInputType.text,
// //   }) {
// //     return TextFormField(
// //       controller: controller,
// //       keyboardType: keyboardType,
// //       validator: (value) {
// //         if (value == null || value.isEmpty) {
// //           return 'Please enter $labelText';
// //         }
// //         return null;
// //       },
// //       decoration: InputDecoration(
// //         labelText: labelText,
// //         hintText: hintText,
// //         prefixIcon: Icon(icon, color: Colors.teal),
// //         border: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(12),
// //         ),
// //         focusedBorder: OutlineInputBorder(
// //           borderSide: BorderSide(color: Colors.teal),
// //           borderRadius: BorderRadius.circular(12),
// //         ),
// //         filled: true,
// //         fillColor: Colors.grey[100],
// //       ),
// //     );
// //   }
// // }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ForgotPasswordPage extends StatefulWidget {
//   @override
//   _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
// }

// class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Forgot Password"),
//         backgroundColor: Colors.teal,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
//               padding: const EdgeInsets.all(24.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Icon(Icons.lock_reset, size: 80, color: Colors.teal),
//                     SizedBox(height: 20),
//                     Text(
//                       'Reset Password',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal[800],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Enter your email to receive a password reset link',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                     ),
//                     SizedBox(height: 20),
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: Colors.teal),
//                         ),
//                         filled: true,
//                         fillColor: Colors.grey[100],
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     _isLoading
//                         ? CircularProgressIndicator()
//                         : ElevatedButton(
//                             onPressed: _sendPasswordResetEmail,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.teal,
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 24),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             child: Text(
//                               "Send Reset Link",
//                               style: TextStyle(fontSize: 18),
//                             ),
//                           ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _sendPasswordResetEmail() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);

//       try {
//         await FirebaseAuth.instance
//             .sendPasswordResetEmail(email: _emailController.text.trim());
//         _showMessage("Password reset link sent! Check your email.");
//       } catch (e) {
//         _showMessage("Error: ${e.toString()}");
//       }

//       setState(() => _isLoading = false);
//     }
//   }

//   void _showMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
// }
