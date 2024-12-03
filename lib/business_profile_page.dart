import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BusinessProfilePage extends StatefulWidget {
  final String userUid;

  const BusinessProfilePage({Key? key, required this.userUid})
      : super(key: key);

  @override
  _BusinessProfilePageState createState() => _BusinessProfilePageState();
}

class _BusinessProfilePageState extends State<BusinessProfilePage> {
  bool _isEditMode = false;
  String profilePicUrl = '';
  String businessName = '';
  String location = '';
  String description = '';
  String email = '';
  String contact = '';

  final TextEditingController _profilePicUrlController =
      TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  Future<void> _fetchBusinessProfile() async {
    final businessSnapshot = await FirebaseFirestore.instance
        .collection('business_categories')
        .where('userUid', isEqualTo: widget.userUid)
        .limit(1)
        .get();

    if (businessSnapshot.docs.isNotEmpty) {
      final data = businessSnapshot.docs.first.data();
      setState(() {
        profilePicUrl = data['profilePicUrl'] ?? '';
        businessName = data['businessName'] ?? '';
        location = data['location'] ?? '';
        description = data['description'] ?? '';
        email = data['email'] ?? '';
        contact = data['contact'] ?? '';

        _profilePicUrlController.text = profilePicUrl;
        _businessNameController.text = businessName;
        _locationController.text = location;
        _descriptionController.text = description;
        _emailController.text = email;
        _contactController.text = contact;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchBusinessProfile();
  }

  Future<void> _saveProfile() async {
    await FirebaseFirestore.instance
        .collection('business_categories')
        .where('userUid', isEqualTo: widget.userUid)
        .get()
        .then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.first.reference.update({
          'profilePicUrlController': _profilePicUrlController.text,
          'businessName': _businessNameController.text,
          'location': _locationController.text,
          'description': _descriptionController.text,
          'email': _emailController.text,
          'contact': _contactController.text,
        });
      }
    });

    setState(() {
      _isEditMode = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Information saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Profile'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(_isEditMode ? Icons.save : Icons.edit),
            onPressed: () {
              if (_isEditMode) {
                _saveProfile();
              } else {
                setState(() {
                  _isEditMode = true;
                });
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade300,
              backgroundImage:
                  profilePicUrl.isNotEmpty ? NetworkImage(profilePicUrl) : null,
              child: profilePicUrl.isEmpty
                  ? Icon(Icons.person, size: 60, color: Colors.grey)
                  : null,
            ),
            SizedBox(height: 20),

            // Main Container with Border
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.teal.shade300,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildEditableField('Business Name', _businessNameController),
                  _buildEditableField('Location', _locationController),
                  _buildEditableField('Description', _descriptionController),
                  _buildEditableField('Email', _emailController),
                  _buildEditableField('Contact', _contactController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Editable Text Field Widget
  Widget _buildEditableField(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade700,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: controller,
            enabled: _isEditMode,
            decoration: InputDecoration(
              hintText: 'Enter $title',
              filled: true,
              fillColor: Colors.grey.shade100,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.teal.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.teal, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
