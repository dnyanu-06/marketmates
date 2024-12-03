// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'business_profile_page.dart';

// class BusinessInformationPage extends StatefulWidget {
//   final String userId;
//   final String selectedCategory;

//   BusinessInformationPage({
//     required this.userId,
//     required this.selectedCategory,
//   });

//   @override
//   _BusinessInformationPageState createState() =>
//       _BusinessInformationPageState();
// }

// class _BusinessInformationPageState extends State<BusinessInformationPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _businessNameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _contactNumberController =
//       TextEditingController();

//   Future<void> _saveBusinessInformation() async {
//     try {
//       final firestore = FirebaseFirestore.instance;

//       // Save business details in subcollection according to the selected category
//       await firestore
//           .collection('business_categories')
//           .doc(widget.selectedCategory)
//           .collection(widget.selectedCategory)
//           .add({
//         'userId': widget.userId,
//         'businessName': _businessNameController.text,
//         'address': _addressController.text,
//         'contactNumber': _contactNumberController.text,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       // Update selected category in verified_users
//       await firestore
//           .collection('verified_users')
//           .doc(widget.userId)
//           .update({'selectedCategory': widget.selectedCategory});

//       // Set isProfileComplete flag to true after saving business info
//       await firestore
//           .collection('verified_users')
//           .doc(widget.userId)
//           .update({'isProfileComplete': true});

//       // Navigate to the Business Profile Page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => BusinessProfilePage(userId: widget.userId),
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error saving business information: $e")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Business Information'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _businessNameController,
//                 decoration: InputDecoration(labelText: 'Business Name'),
//                 validator: (value) => value == null || value.isEmpty
//                     ? 'Enter business name'
//                     : null,
//               ),
//               TextFormField(
//                 controller: _addressController,
//                 decoration: InputDecoration(labelText: 'Business Address'),
//                 validator: (value) =>
//                     value == null || value.isEmpty ? 'Enter address' : null,
//               ),
//               TextFormField(
//                 controller: _contactNumberController,
//                 decoration: InputDecoration(labelText: 'Contact Number'),
//                 validator: (value) => value == null || value.isEmpty
//                     ? 'Enter contact number'
//                     : null,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _saveBusinessInformation();
//                   }
//                 },
//                 child: Text('Save Information'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:markatemate/business_profile_page.dart';

// class BusinessInformationPage extends StatefulWidget {
//   final String userUid;
//   final String category;

//   BusinessInformationPage({required this.userUid, required this.category});

//   @override
//   _BusinessInformationPageState createState() =>
//       _BusinessInformationPageState();
// }

// class _BusinessInformationPageState extends State<BusinessInformationPage> {
//   final _businessNameController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _emailController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }

//   // Fetch the user email and other info from Firestore
//   void _fetchUserData() async {
//     final userDoc = await FirebaseFirestore.instance
//         .collection('verified_users')
//         .doc(widget.userUid)
//         .get();

//     if (userDoc.exists) {
//       // Autofill email from the database
//       _emailController.text = userDoc['email'] ?? '';
//     }
//   }

//   void _saveBusinessInfo() async {
//     // Save business info to Firestore under the selected category
//     await FirebaseFirestore.instance
//         .collection('business_categories')
//         .doc(widget.category)
//         .collection('businesses')
//         .add({
//       'business_name': _businessNameController.text,
//       'address': _addressController.text,
//       'contact_number': _phoneController.text,
//       'email': _emailController.text,
//       'user_id': widget.userUid,
//     });

//     // Navigate to Business Profile Page (you can modify this navigation as needed)
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//           builder: (context) => BusinessProfilePage(userUid: widget.userUid)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Business Information"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _businessNameController,
//               decoration: InputDecoration(labelText: "Business Name"),
//             ),
//             TextField(
//               controller: _addressController,
//               decoration: InputDecoration(labelText: "Address"),
//             ),
//             TextField(
//               controller: _phoneController,
//               decoration: InputDecoration(labelText: "Contact Number"),
//               keyboardType: TextInputType.phone,
//             ),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: "Email"),
//               keyboardType: TextInputType.emailAddress,
//               enabled: false, // Disable email field since it's autofilled
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveBusinessInfo,
//               child: Text("Save"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:markatemate/business_profile_page.dart';

// class BusinessInformationForm extends StatefulWidget {
//   final String userUid;
//   final String category;

//   const BusinessInformationForm(
//       {Key? key, required this.userUid, required this.category})
//       : super(key: key);

//   @override
//   _BusinessInformationFormState createState() =>
//       _BusinessInformationFormState();
// }

// class _BusinessInformationFormState extends State<BusinessInformationForm> {
//   final _formKey = GlobalKey<FormState>();
//   String businessName = '';
//   String businessDescription = '';
//   String businessLocation = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Business Information'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Business Name'),
//                 onChanged: (val) => businessName = val,
//                 validator: (val) =>
//                     val!.isEmpty ? 'Please enter a business name' : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Business Description'),
//                 onChanged: (val) => businessDescription = val,
//                 validator: (val) =>
//                     val!.isEmpty ? 'Please enter a description' : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Business Location'),
//                 onChanged: (val) => businessLocation = val,
//                 validator: (val) =>
//                     val!.isEmpty ? 'Please enter a location' : null,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         final firestore = FirebaseFirestore.instance;
//         final businessData = {
//           'userUid': widget.userUid,
//           'category': widget.category,
//           'businessName': businessName,
//           'businessDescription': businessDescription,
//           'businessLocation': businessLocation,
//         };

//         await firestore.collection('business_categories').add(businessData);

//         // Navigate to business profile page after saving data
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => BusinessProfilePage(userUid: widget.userUid),
//           ),
//         );
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error saving business data: $e")),
//         );
//       }
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:markatemate/business_profile_page.dart';

class BusinessInformationForm extends StatefulWidget {
  final String userUid;
  final String category;

  const BusinessInformationForm(
      {Key? key, required this.userUid, required this.category})
      : super(key: key);

  @override
  _BusinessInformationFormState createState() =>
      _BusinessInformationFormState();
}

class _BusinessInformationFormState extends State<BusinessInformationForm> {
  final _formKey = GlobalKey<FormState>();
  String businessName = '';
  String location = '';
  String description = '';
  String email = '';
  String contact = '';
  String businessOwner = '';
  File? _profilePicture;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadBusinessInfo();
  }

  Future<void> _loadBusinessInfo() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('verified_users')
        .doc(widget.userUid)
        .get();
    if (userDoc.exists) {
      setState(() {
        email = userDoc['email'] ?? '';
        contact = userDoc['phone'] ?? '';
        // Concatenate first and last name
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profilePicture = File(image.path);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String profilePicUrl = '';
      if (_profilePicture != null) {
        // For now, use the local file path (you should upload to Firebase Storage here)
        profilePicUrl = _profilePicture!.path;
      }

      final businessData = {
        'userUid': widget.userUid,
        'category': widget.category,
        'businessName': businessName,
        'location': location,
        'description': description,
        'email': email,
        'contact': contact,
        'profilePicUrl': profilePicUrl,
      };

      await FirebaseFirestore.instance
          .collection('business_categories')
          // Subcollection for businesses
          .add(businessData);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Information Saved Successfully!')));

      // Navigate to the business profile page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BusinessProfilePage(
            userUid: widget.userUid,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Information'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Business Name', (val) => businessName = val),
              _buildTextField('Business Location', (val) => location = val),
              _buildTextField(
                  'Business Description', (val) => description = val),
              _buildTextField('Email', (val) => email = val),
              _buildTextField('Contact', (val) => contact = val),
              SizedBox(height: 20),
              _buildImagePicker(context),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.teal,
                ),
                child: Text("Submit", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged,
      {bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.teal[50],
        ),
        onChanged: onChanged,
        validator: (val) =>
            val == null || val.isEmpty ? 'This field cannot be empty' : null,
        enabled: enabled,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildImagePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(
            radius: 60, // Circle radius
            backgroundColor: Colors.grey[200],
            backgroundImage:
                _profilePicture != null ? FileImage(_profilePicture!) : null,
            child: _profilePicture == null
                ? Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                : null,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Tap to select profile picture',
          style: TextStyle(fontSize: 16, color: Colors.teal),
        ),
      ],
    );
  }
}
