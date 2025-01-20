import 'package:comic_reading_app/Services/SessionManager.dart';
import 'package:comic_reading_app/Utils/Utils.dart';
import 'package:comic_reading_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:comic_reading_app/Services/SessionManager.dart';
import 'package:comic_reading_app/Utils/Utils.dart';
import 'package:comic_reading_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Use Firestore
  final picker = ImagePicker();

  var _loading = false.obs;
  var _image = Rx<File?>(null);

  bool get loading => _loading.value;
  File? get image => _image.value;

  setLoading(bool value) {
    _loading.value = value;
  }

  Future<void> getGalleryImage() async {
    try {
      final pickedFile = await picker.pickImage(
          source: ImageSource.gallery, imageQuality: 100);

      if (pickedFile != null) {
        _image.value = File(pickedFile.path);
      } else {
        Get.snackbar('No Image', 'No image selected');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  Future<void> uploadImage() async {
    if (_image.value == null) {
      Get.snackbar('Error', 'Please select an image first.');
      return;
    }

    setLoading(true);

    try {
      // Step 1: Upload the image to Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('ProfilePicture/${SessionManager().userId.toString()}');

      // Upload the image to Firebase Storage
      UploadTask uploadTask = storageRef.putFile(_image.value!);

      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);

      // Step 2: Get the download URL of the uploaded image
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Step 3: Store the download URL in Firestore
      await _firestore.collection('users').doc(SessionManager().userId.toString()).set({
        'profileImage': downloadUrl,
        'timestamp': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      if (kDebugMode) {
        print('Image uploaded successfully to Firestore.');
      }

      setLoading(false);
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print('Error uploading image: $error');
      }
      Get.snackbar('Upload Failed', 'Error uploading image: $error');
    }
  }

  void logout(BuildContext context) async {
    setLoading(true);
    try {
      await _auth.signOut().then((value) {
        Get.to(() => LoginScreen());
        Utils.toastMessage('Logout Successful');
        setLoading(false);
      }).onError((error, stackTrace) {
        Utils.toastMessage(error.toString());
        setLoading(false);
      });
    } catch (e) {
      Utils.toastMessage(e.toString());
      setLoading(false);
    }
  }
}
