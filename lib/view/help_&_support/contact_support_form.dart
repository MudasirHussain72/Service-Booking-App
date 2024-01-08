import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/res/component/round_button.dart';
import 'package:fyp/utils/utils.dart';
import 'package:fyp/view_model/services/session_manager.dart';
import 'package:uuid/uuid.dart';

class ContactSupportForm extends StatefulWidget {
  const ContactSupportForm({super.key});

  @override
  State<ContactSupportForm> createState() => _ContactSupportFormState();
}

class _ContactSupportFormState extends State<ContactSupportForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool? isLoading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Help Form'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                        color: Colors.blue), // Change input text color
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                        color: Colors.blue), // Change input text color
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'phone',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                        color: Colors.blue), // Change input text color
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _descriptionController,
                    style: TextStyle(
                        color: Colors.blue), // Change input text color
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    maxLines: 5,
                  ),
                  SizedBox(height: 20),
                  RoundButton(
                    title: 'Submit',
                    loading: isLoading!,
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() => isLoading = true);
                        // Form is validated, perform your action here
                        String title = _titleController.text;
                        String description = _descriptionController.text;
                        String name = _nameController.text;
                        String phone = _phoneController.text;
                        // You can handle the submission logic here
                        // For now, let's print the values
                        print('Title: $title');
                        print('Description: $description');
                        var docId = Uuid().v4();
                        FirebaseFirestore.instance
                            .collection('contact_support')
                            .doc(docId)
                            .set({
                          'docId': docId,
                          'title': title,
                          'description': description,
                          'name': name,
                          'phone': phone,
                          'userId': SessionController().userId,
                        }).then((value) {
                          setState(() => isLoading = false);
                          Utils.flushBarDoneMessage(
                              'Form Submited', BuildContext, context);
                          _titleController.clear();
                          _phoneController.clear();
                          _nameController.clear();
                          _descriptionController.clear();
                        });
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
