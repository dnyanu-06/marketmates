// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AdminDashboard extends StatefulWidget {
//   @override
//   _AdminDashboardState createState() => _AdminDashboardState();
// }

// class _AdminDashboardState extends State<AdminDashboard> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<DocumentSnapshot>> _getVerifiedUsers() async {
//     QuerySnapshot querySnapshot =
//         await _firestore.collection('verified_users').get();
//     return querySnapshot.docs;
//   }

//   Future<List<DocumentSnapshot>> _getUnverifiedUsers() async {
//     QuerySnapshot querySnapshot =
//         await _firestore.collection('unverified_users').get();
//     return querySnapshot.docs;
//   }

//   Future<void> _verifyUser(DocumentSnapshot user) async {
//     Map<String, dynamic> userData = user.data() as Map<String, dynamic>;
//     await _firestore.collection('verified_users').add(userData);
//     await _firestore.collection('unverified_users').doc(user.id).delete();
//     _showSuccess(
//         "User ${userData['first_name']} ${userData['last_name']} verified successfully.");
//   }

//   Future<void> _blockUser(DocumentSnapshot user) async {
//     await _firestore
//         .collection('blocked_users')
//         .add(user.data() as Map<String, dynamic>);
//     await _firestore.collection('unverified_users').doc(user.id).delete();
//     _showSuccess(
//         "User ${user['first_name']} ${user['last_name']} blocked successfully.");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Admin Dashboard"),
//         backgroundColor: Colors.red,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(color: Colors.blue),
//               child: Text(
//                 'Admin Menu',
//                 style: TextStyle(color: Colors.white, fontSize: 24),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.verified),
//               title: Text('View Verified Users'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _showVerifiedUsers();
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.error),
//               title: Text('View Unverified Users'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _showUnverifiedUsers();
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.add),
//               title: Text('Add User'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _showAddUserDialog();
//                 // Add user logic here
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.edit),
//               title: Text('Modify User'),
//               onTap: () {
//                 Navigator.pop(context);

//                 // Modify user logic here
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.delete),
//               title: Text('Delete User'),
//               onTap: () {
//                 Navigator.pop(context);
//                 // Delete user logic here
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             // Determine the number of columns based on the screen width
//             int columns = constraints.maxWidth > 600 ? 3 : 2;
//             return GridView.count(
//               crossAxisCount: columns,
//               childAspectRatio: 1.2,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               children: [
//                 _buildCard(
//                     "View Verified Users", Icons.verified, _showVerifiedUsers),
//                 _buildCard(
//                     "View Unverified Users", Icons.error, _showUnverifiedUsers),
//                 _buildCard("Add User", Icons.add, _showAddUserDialog),
//                 _buildCard("Modify User", Icons.edit, _showModifyUserDialog),
//                 _buildCard("Delete User", Icons.delete, () {
//                   // Delete user logic here
//                 }),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildCard(String title, IconData icon, Function onTap) {
//     return GestureDetector(
//       onTap: () => onTap(),
//       child: Card(
//         elevation: 4,
//         color: const Color.fromARGB(255, 67, 123, 236),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 50, color: Colors.white),
//               SizedBox(height: 8),
//               Text(
//                 title,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showVerifiedUsers() async {
//     List<DocumentSnapshot> verifiedUsers = await _getVerifiedUsers();
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Verified Users"),
//           content: Container(
//             width: double.maxFinite,
//             child: ListView.builder(
//               itemCount: verifiedUsers.length,
//               itemBuilder: (context, index) {
//                 var user = verifiedUsers[index].data() as Map<String, dynamic>;
//                 return ListTile(
//                   title: Text("${user['first_name']} ${user['last_name']}"),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Email: ${user['email']}"),
//                       Text("Aadhar: ${user['aadhar']}"),
//                       Text("GSTIN: ${user['gstin']}"),
//                       // Format date as needed
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showUnverifiedUsers() async {
//     List<DocumentSnapshot> unverifiedUsers = await _getUnverifiedUsers();
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Unverified Users"),
//           content: Container(
//             width: double.maxFinite,
//             child: ListView.builder(
//               itemCount: unverifiedUsers.length,
//               itemBuilder: (context, index) {
//                 var user =
//                     unverifiedUsers[index].data() as Map<String, dynamic>;
//                 return ListTile(
//                   title: Text("${user['first_name']} ${user['last_name']}"),
//                   subtitle: Text("Email: ${user['email']}"),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       ElevatedButton(
//                         child: Text("Verify"),
//                         onPressed: () {
//                           _verifyUser(unverifiedUsers[index]);
//                           Navigator.of(context).pop(); // Close the dialog
//                         },
//                       ),
//                       SizedBox(width: 8),
//                       ElevatedButton(
//                         child: Text("Block"),
//                         onPressed: () {
//                           _blockUser(unverifiedUsers[index]);
//                           Navigator.of(context).pop(); // Close the dialog
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showSuccess(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }

//   void _showAddUserDialog() {
//     final _formKey = GlobalKey<FormState>();
//     String firstName = '';
//     String lastName = '';
//     String email = '';
//     String aadhar = '';
//     String gstin = '';

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Add User"),
//           content: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "First Name"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter first name";
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       firstName = value!;
//                     },
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "Last Name"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter last name";
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       lastName = value!;
//                     },
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "Email"),
//                     validator: (value) {
//                       if (value == null ||
//                           value.isEmpty ||
//                           !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                         return "Please enter a valid email";
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       email = value!;
//                     },
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "Aadhar"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter Aadhar number";
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       aadhar = value!;
//                     },
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "GSTIN"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter GSTIN";
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       gstin = value!;
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                   _addUser(firstName, lastName, email, aadhar, gstin);
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: Text("Add"),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Cancel"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _addUser(String firstName, String lastName, String email,
//       String aadhar, String gstin) async {
//     try {
//       await _firestore.collection('unverified_users').add({
//         'first_name': firstName,
//         'last_name': lastName,
//         'email': email,
//         'aadhar': aadhar,
//         'gstin': gstin,
//         'created_at': FieldValue.serverTimestamp(), // Optionally set created_at
//       });
//       _showSuccess("User added successfully!");
//     } catch (e) {
//       _showSuccess("Failed to add user: $e");
//     }
//   }

//   void _showModifyUserDialog() async {
//     List<DocumentSnapshot> verifiedUsers = await _getVerifiedUsers();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Select User to Modify"),
//           content: Container(
//             width: double.maxFinite,
//             child: ListView.builder(
//               itemCount: verifiedUsers.length,
//               itemBuilder: (context, index) {
//                 var user = verifiedUsers[index].data() as Map<String, dynamic>;
//                 return ListTile(
//                   title: Text("${user['first_name']} ${user['last_name']}"),
//                   subtitle: Text("Email: ${user['email']}"),
//                   onTap: () {
//                     Navigator.of(context).pop(); // Close the dialog
//                     _showEditUserDialog(verifiedUsers[index]);
//                   },
//                 );
//               },
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showEditUserDialog(DocumentSnapshot user) {
//     final _formKey = GlobalKey<FormState>();
//     String firstName = user['first_name'];
//     String lastName = user['last_name'];
//     String email = user['email'];
//     String aadhar = user['aadhar'];
//     String gstin = user['gstin'];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Edit User"),
//           content: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     initialValue: firstName,
//                     decoration: InputDecoration(labelText: "First Name"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter first name";
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       firstName = value!;
//                     },
//                   ),
//                   TextFormField(
//                     initialValue: lastName,
//                     decoration: InputDecoration(labelText: "Last Name"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter last name";
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       lastName = value!;
//                     },
//                   ),
//                   TextFormField(
//                     initialValue: email,
//                     decoration: InputDecoration(labelText: "Email"),
//                     validator: (value) {
//                       if (value == null ||
//                           value.isEmpty ||
//                           !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                         return "Please enter a valid email";
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       email = value!;
//                     },
//                   ),
//                   TextFormField(
//                     initialValue: aadhar,
//                     decoration: InputDecoration(labelText: "Aadhar"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter Aadhar number";
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       aadhar = value!;
//                     },
//                   ),
//                   TextFormField(
//                     initialValue: gstin,
//                     decoration: InputDecoration(labelText: "GSTIN"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter GSTIN";
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       gstin = value!;
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                   _updateUser(
//                       user.id, firstName, lastName, email, aadhar, gstin);
//                   Navigator.of(context).pop(); // Close the dialog after update
//                 }
//               },
//               child: Text("Update"),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Cancel"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _updateUser(String userId, String firstName, String lastName,
//       String email, String aadhar, String gstin) async {
//     try {
//       await _firestore.collection('verified_users').doc(userId).update({
//         'first_name': firstName,
//         'last_name': lastName,
//         'email': email,
//         'aadhar': aadhar,
//         'gstin': gstin,
//         // Optionally update created_at or other fields if necessary
//       });
//       _showSuccess("User updated successfully!");
//     } catch (e) {
//       _showSuccess("Failed to update user: $e");
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> _getVerifiedUsers() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('verified_users').get();
    return querySnapshot.docs;
  }

  Future<List<DocumentSnapshot>> _getUnverifiedUsers() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('unverified_users').get();
    return querySnapshot.docs;
  }

  Future<void> _verifyUser(DocumentSnapshot user) async {
    Map<String, dynamic> userData = user.data() as Map<String, dynamic>;
    await _firestore.collection('verified_users').add(userData);
    await _firestore.collection('unverified_users').doc(user.id).delete();
    _showSuccess(
        "User ${userData['first_name']} ${userData['last_name']} verified successfully.");
  }

  Future<void> _blockUser(DocumentSnapshot user) async {
    await _firestore
        .collection('blocked_users')
        .add(user.data() as Map<String, dynamic>);
    await _firestore.collection('unverified_users').doc(user.id).delete();
    _showSuccess(
        "User ${user['first_name']} ${user['last_name']} blocked successfully.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Admin Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _buildDrawerItem(
                Icons.verified, 'View Verified Users', _showVerifiedUsers),
            _buildDrawerItem(
                Icons.error, 'View Unverified Users', _showUnverifiedUsers),
            _buildDrawerItem(Icons.add, 'Add User', _showAddUserDialog),
            _buildDrawerItem(Icons.edit, 'Modify User', _showModifyUserDialog),
            _buildDrawerItem(Icons.delete, 'Delete User', () {
              // Delete user logic here
            }),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int columns = constraints.maxWidth > 600 ? 3 : 2;
            return GridView.count(
              crossAxisCount: columns,
              childAspectRatio: 1.2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildCard(
                    "View Verified Users", Icons.verified, _showVerifiedUsers),
                _buildCard(
                    "View Unverified Users", Icons.error, _showUnverifiedUsers),
                _buildCard("Add User", Icons.add, _showAddUserDialog),
                _buildCard("Modify User", Icons.edit, _showModifyUserDialog),
                _buildCard("Delete User", Icons.delete, () {
                  // Delete user logic here
                }),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }

  Widget _buildCard(String title, IconData icon, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 8,
        color: const Color.fromARGB(255, 67, 123, 236),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 60, color: Colors.white),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showVerifiedUsers() async {
    List<DocumentSnapshot> verifiedUsers = await _getVerifiedUsers();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Verified Users"),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: verifiedUsers.length,
              itemBuilder: (context, index) {
                var user = verifiedUsers[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text("${user['first_name']} ${user['last_name']}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email: ${user['email']}"),
                      Text("Aadhar: ${user['aadhar']}"),
                      Text("GSTIN: ${user['gstin']}"),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void _showUnverifiedUsers() async {
    List<DocumentSnapshot> unverifiedUsers = await _getUnverifiedUsers();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Unverified Users"),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: unverifiedUsers.length,
              itemBuilder: (context, index) {
                var user =
                    unverifiedUsers[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text("${user['first_name']} ${user['last_name']}"),
                  subtitle: Text("Email: ${user['email']}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: Text("Verify"),
                        onPressed: () {
                          _verifyUser(unverifiedUsers[index]);
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: Text("Block"),
                        onPressed: () {
                          _blockUser(unverifiedUsers[index]);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showAddUserDialog() {
    final _formKey = GlobalKey<FormState>();
    String firstName = '';
    String lastName = '';
    String email = '';
    String aadhar = '';
    String gstin = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add User"),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField("First Name", (value) {
                    firstName = value!;
                  }, initialValue: ''),
                  _buildTextField("Last Name", (value) {
                    lastName = value!;
                  }, initialValue: ''),
                  _buildTextField("Email", (value) {
                    email = value!;
                  }, validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  }, initialValue: ''),
                  _buildTextField("Aadhar", (value) {
                    aadhar = value!;
                  }, initialValue: ''),
                  _buildTextField("GSTIN", (value) {
                    gstin = value!;
                  }, initialValue: ''),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _addUser(firstName, lastName, email, aadhar, gstin);
                  Navigator.of(context).pop();
                }
              },
              child: Text("Add"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  TextFormField _buildTextField(String label, Function(String?) onSaved,
      {String? Function(String?)? validator, required String initialValue}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      validator: validator,
      onSaved: onSaved,
    );
  }

  Future<void> _addUser(String firstName, String lastName, String email,
      String aadhar, String gstin) async {
    try {
      await _firestore.collection('unverified_users').add({
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'aadhar': aadhar,
        'gstin': gstin,
        'created_at': FieldValue.serverTimestamp(),
      });
      _showSuccess("User added successfully!");
    } catch (e) {
      _showSuccess("Failed to add user: $e");
    }
  }

  void _showModifyUserDialog() async {
    List<DocumentSnapshot> verifiedUsers = await _getVerifiedUsers();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select User to Modify"),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: verifiedUsers.length,
              itemBuilder: (context, index) {
                var user = verifiedUsers[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text("${user['first_name']} ${user['last_name']}"),
                  subtitle: Text("Email: ${user['email']}"),
                  onTap: () {
                    Navigator.of(context).pop();
                    _showEditUserDialog(verifiedUsers[index]);
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void _showEditUserDialog(DocumentSnapshot user) {
    final _formKey = GlobalKey<FormState>();
    String firstName = user['first_name'];
    String lastName = user['last_name'];
    String email = user['email'];
    String aadhar = user['aadhar'];
    String gstin = user['gstin'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit User"),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField("First Name", (value) {
                    firstName = value!;
                  }, initialValue: firstName),
                  _buildTextField("Last Name", (value) {
                    lastName = value!;
                  }, initialValue: lastName),
                  _buildTextField(
                      "Email",
                      (value) {
                        email = value!;
                      },
                      initialValue: email,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return "Please enter a valid email";
                        }
                        return null;
                      }),
                  _buildTextField("Aadhar", (value) {
                    aadhar = value!;
                  }, initialValue: aadhar),
                  _buildTextField("GSTIN", (value) {
                    gstin = value!;
                  }, initialValue: gstin),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _updateUser(
                      user.id, firstName, lastName, email, aadhar, gstin);
                  Navigator.of(context).pop();
                }
              },
              child: Text("Update"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateUser(String userId, String firstName, String lastName,
      String email, String aadhar, String gstin) async {
    try {
      await _firestore.collection('verified_users').doc(userId).update({
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'aadhar': aadhar,
        'gstin': gstin,
      });
      _showSuccess("User updated successfully!");
    } catch (e) {
      _showSuccess("Failed to update user: $e");
    }
  }
}
