// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:fyp/res/color.dart';
import 'package:fyp/res/component/input_text_field.dart';
import 'package:fyp/utils/utils.dart';
import 'package:fyp/view_model/services/session_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController with ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

  final firestore = FirebaseFirestore.instance.collection('users');
  final shopFirestore = FirebaseFirestore.instance.collection('shops');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final picker = ImagePicker();
  XFile? _image;
  XFile? get image => _image;

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future getGalleryImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      uploadImage();
      notifyListeners();
    }
  }

  Future getCameraImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 20);
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      uploadImage();
      notifyListeners();
    }
  }

  void pickImage(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 120,
            child: Column(children: [
              ListTile(
                onTap: () {
                  getCameraImage(context);
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.camera,
                  color: AppColors.primaryIconColor,
                ),
                title: const Text('Camera'),
              ),
              ListTile(
                onTap: () {
                  getGalleryImage(context);
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.image,
                  color: AppColors.primaryIconColor,
                ),
                title: const Text('Gallery'),
              ),
            ]),
          ),
        );
      },
    );
  }

  void uploadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isBarber = prefs.getBool('isBarber');
    setLoading(true);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('/profileImage/' + SessionController().userId.toString());
    firebase_storage.UploadTask uploadTask =
        ref.putFile(File(image!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await ref.getDownloadURL();
    if (isBarber == true) {
      try {
        await firestore
            .doc(SessionController().userId.toString())
            .update({'profileImage': newUrl.toString()}).then((value) {
          shopFirestore
              .doc(SessionController().userId.toString())
              .update({'shopImage': newUrl.toString()});
          setLoading(false);
          _image = null;
          Utils.toastMessage('profile picture updated');
        });
      } catch (e) {
        setLoading(false);
        Utils.toastMessage(e.toString());
      }
    } else {
      firestore
          .doc(SessionController().userId.toString())
          .update({'profileImage': newUrl.toString()}).then((value) {
        setLoading(false);
        _image = null;
        Utils.toastMessage('profile picture updated');
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString());
      });
    }
  }

  Future<void> updateUserInfoDialogAlert(
      BuildContext context, String value, String firestoreid) {
    nameController.text = value;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text('Update Profile')),
          content: SingleChildScrollView(
              child: Column(
            children: [
              InputTextField(
                  myController: nameController,
                  focusNode: nameFocusNode,
                  onFiledSubmittedValue: (newValue) {},
                  // onFieldSubmittedValue: (newValue) {},
                  onValidator: (value) {
                    return null;
                  },
                  keyBoardType: TextInputType.text,
                  hint: 'Enter here',
                  obscureText: false)
            ],
          )),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: AppColors.alertColor,
                      )),
            ),
            TextButton(
                onPressed: () {
                  firestore.doc(SessionController().userId.toString()).update({
                    firestoreid: nameController.text.toString()
                  }).then((value) {
                    nameController.clear();
                    Navigator.pop(context);
                  });
                },
                child: const Text('Update'))
          ],
        );
      },
    );
  }
}
