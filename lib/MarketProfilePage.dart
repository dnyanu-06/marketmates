 //import 'package:flutter/material.dart';

// // class MarketProfilePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Marketmate Profile', style: TextStyle(fontSize: 22)),
// //         backgroundColor: Colors.teal,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             // Profile Header Section
// //             _buildProfileHeader(context),

// //             Divider(thickness: 1),

// //             // Business Pictures Grid Section
// //             Padding(
// //               padding: const EdgeInsets.all(10.0),
// //               child: _buildBusinessGrid(),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // Helper to build profile header like Instagram
// //   Widget _buildProfileHeader(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         children: [
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //             children: [
// //               // Profile Picture
// //               CircleAvatar(
// //                 radius: 50,
// //                 backgroundImage:
// //                     AssetImage('assets/market_profile.jpg'), // Profile image
// //               ),

// //               // Follower, Following, and Products Count
// //               Column(
// //                 children: [
// //                   Text('120', style: _buildStatTextStyle()),
// //                   Text('Products', style: _buildLabelTextStyle()),
// //                 ],
// //               ),
// //               Column(
// //                 children: [
// //                   Text('1.5k', style: _buildStatTextStyle()),
// //                   Text('Followers', style: _buildLabelTextStyle()),
// //                 ],
// //               ),
// //               Column(
// //                 children: [
// //                   Text('500', style: _buildStatTextStyle()),
// //                   Text('Following', style: _buildLabelTextStyle()),
// //                 ],
// //               ),
// //             ],
// //           ),
// //           SizedBox(height: 12),

// //           // Market Name and Bio Section
// //           Align(
// //             alignment: Alignment.centerLeft,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   'Your Market Name',
// //                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// //                 ),
// //                 SizedBox(height: 5),
// //                 Text(
// //                   'Description about your market goes here. Add relevant information about the products/services you offer.',
// //                   style: TextStyle(fontSize: 15, color: Colors.grey[700]),
// //                 ),
// //                 SizedBox(height: 8),
// //                 Row(
// //                   children: [
// //                     Icon(Icons.location_on, color: Colors.teal),
// //                     SizedBox(width: 5),
// //                     Text(
// //                       '123 Market Street, City, Country',
// //                       style: TextStyle(color: Colors.teal, fontSize: 15),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),

// //           SizedBox(height: 20),

// //           // Edit Profile Button
// //           ElevatedButton(
// //             onPressed: () {
// //               // Add action to edit profile
// //             },
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor: Colors.teal,
// //               padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(30),
// //               ),
// //             ),
// //             child: Text(
// //               'Edit Profile',
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // Helper method to build the statistics text style
// //   TextStyle _buildStatTextStyle() {
// //     return TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
// //   }

// //   // Helper method to build the labels below stats
// //   TextStyle _buildLabelTextStyle() {
// //     return TextStyle(fontSize: 14, color: Colors.grey[600]);
// //   }

// //   // Helper to build grid of business images like Instagram grid
// //   Widget _buildBusinessGrid() {
// //     return GridView.builder(
// //       shrinkWrap: true,
// //       physics: NeverScrollableScrollPhysics(),
// //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //         crossAxisCount: 3,
// //         crossAxisSpacing: 8,
// //         mainAxisSpacing: 8,
// //         childAspectRatio: 1,
// //       ),
// //       itemCount: 9, // Replace with your actual business images count
// //       itemBuilder: (context, index) {
// //         return ClipRRect(
// //           borderRadius: BorderRadius.circular(10),
// //           child: Image.asset(
// //             'assets/business${(index % 3) + 1}.jpg', // Business image path
// //             fit: BoxFit.cover,
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'dart:io';

// // class MarketProfilePage extends StatefulWidget {
// //   @override
// //   _MarketProfilePageState createState() => _MarketProfilePageState();
// // }

// // class _MarketProfilePageState extends State<MarketProfilePage> {
// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _addressController = TextEditingController();
// //   File? _profileImage;

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _addressController.dispose();
// //     super.dispose();
// //   }

// //   Future<void> _pickImage() async {
// //     final pickedFile =
// //         await ImagePicker().pickImage(source: ImageSource.gallery);
// //     if (pickedFile != null) {
// //       setState(() {
// //         _profileImage = File(pickedFile.path);
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Market Profile'),
// //         backgroundColor: Colors.teal,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               // Profile Picture
// //               GestureDetector(
// //                 onTap: _pickImage,
// //                 child: CircleAvatar(
// //                   radius: 60,
// //                   backgroundImage: _profileImage != null
// //                       ? FileImage(_profileImage!)
// //                       : AssetImage('assets/grocery.png') as ImageProvider,
// //                   child: _profileImage == null
// //                       ? Icon(
// //                           Icons.camera_alt,
// //                           size: 40,
// //                           color: Colors.white,
// //                         )
// //                       : null,
// //                 ),
// //               ),
// //               SizedBox(height: 20),

// //               // Editable Name Field
// //               TextFormField(
// //                 controller: _nameController,
// //                 decoration: InputDecoration(
// //                   labelText: 'Name',
// //                   hintText: 'Enter Market Name',
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderSide: BorderSide(color: Colors.teal),
// //                   ),
// //                   prefixIcon: Icon(Icons.person, color: Colors.teal),
// //                 ),
// //               ),
// //               SizedBox(height: 20),

// //               // Editable Address Field
// //               TextFormField(
// //                 controller: _addressController,
// //                 decoration: InputDecoration(
// //                   labelText: 'Address',
// //                   hintText: 'Enter Market Address',
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderSide: BorderSide(color: Colors.teal),
// //                   ),
// //                   prefixIcon: Icon(Icons.location_on, color: Colors.teal),
// //                 ),
// //               ),
// //               SizedBox(height: 20),

// //               // Save Button
// //               ElevatedButton(
// //                 onPressed: () {
// //                   // Save Profile Information
// //                   final name = _nameController.text;
// //                   final address = _addressController.text;
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(content: Text('Profile Updated')),
// //                   );
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.teal,
// //                   padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(30),
// //                   ),
// //                 ),
// //                 child: Text('Save', style: TextStyle(fontSize: 18)),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class MarketProfilePage extends StatefulWidget {
//   @override
//   _MarketProfilePageState createState() => _MarketProfilePageState();
// }

// class _MarketProfilePageState extends State<MarketProfilePage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   File? _profileImage;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _addressController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Marketmate Profile', style: TextStyle(fontSize: 22)),
//         backgroundColor: Colors.teal,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Profile Header Section
//             _buildProfileHeader(context),

//             Divider(thickness: 1),

//             // Business Pictures Grid Section
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: _buildBusinessGrid(),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper to build profile header like Instagram with editable picture, name, and address
//   Widget _buildProfileHeader(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               // Editable Profile Picture
//               GestureDetector(
//                 onTap: _pickImage, // Open media picker on tap
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: _profileImage != null
//                       ? FileImage(_profileImage!)
//                       : AssetImage('assets/market_profile.jpg')
//                           as ImageProvider,
//                   child: _profileImage == null
//                       ? Icon(
//                           Icons.camera_alt,
//                           size: 30,
//                           color: Colors.white,
//                         )
//                       : null,
//                 ),
//               ),

//               // Follower, Following, and Products Count
//               Column(
//                 children: [
//                   Text('120', style: _buildStatTextStyle()),
//                   Text('Products', style: _buildLabelTextStyle()),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text('1.5k', style: _buildStatTextStyle()),
//                   Text('Followers', style: _buildLabelTextStyle()),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text('500', style: _buildStatTextStyle()),
//                   Text('Following', style: _buildLabelTextStyle()),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(height: 12),

//           // Editable Market Name and Address
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Editable Name
//                 TextField(
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                     hintText: 'Your Market Name',
//                     hintStyle:
//                         TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                     border: InputBorder.none,
//                   ),
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),

//                 // Description about market
//                 Text(
//                   'Description about your market goes here. Add relevant information about the products/services you offer.',
//                   style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                 ),
//                 SizedBox(height: 8),

//                 // Editable Address
//                 Row(
//                   children: [
//                     Icon(Icons.location_on, color: Colors.teal),
//                     SizedBox(width: 5),
//                     Expanded(
//                       child: TextField(
//                         controller: _addressController,
//                         decoration: InputDecoration(
//                           hintText: '123 Market Street, City, Country',
//                           hintStyle: TextStyle(
//                             color: Colors.teal,
//                             fontSize: 15,
//                           ),
//                           border: InputBorder.none,
//                         ),
//                         style: TextStyle(color: Colors.teal, fontSize: 15),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           SizedBox(height: 20),

//           // Edit Profile Button
//           ElevatedButton(
//             onPressed: () {
//               // Add action to save profile information
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Profile Updated')),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.teal,
//               padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//             ),
//             child: Text(
//               'Save Profile',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper method to build the statistics text style
//   TextStyle _buildStatTextStyle() {
//     return TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
//   }

//   // Helper method to build the labels below stats
//   TextStyle _buildLabelTextStyle() {
//     return TextStyle(fontSize: 14, color: Colors.grey[600]);
//   }

//   // Helper to build grid of business images like Instagram grid
//   Widget _buildBusinessGrid() {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         childAspectRatio: 1,
//       ),
//       itemCount: 9, // Replace with your actual business images count
//       itemBuilder: (context, index) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Image.asset(
//             'assets/business${(index % 3) + 1}.jpg', // Business image path
//             fit: BoxFit.cover,
//           ),
//         );
//       },
//     );
//   }
// }
