import 'dart:typed_data';

import 'package:ecommerce_app/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  // Login user
  Future<String> signInUsersWithEmailAndPassword(
      String email, String password) async {
    String responseMessage = "Some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password);
        responseMessage = "Success";
      } else {
        responseMessage = "Please fill all fields correctly";
      }
    } catch (err) {
      responseMessage = err.toString();
    }
    return responseMessage;
  }

  // Reset User Password using Email
  Future<String> resetUserPasswordWithEmail(String email) async {
    String responseMessage = "Some error occured";
    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        responseMessage = "Success";
      } else {
        responseMessage = "Please fill the email field";
      }
    } catch (err) {
      responseMessage = err.toString();
    }
    return responseMessage;
  }

  // Sign Up Users
  Future<String> signUpUsers(
    String full_name,
    String username,
    String email,
    String password,
    Uint8List? image,
  ) async {
    String responseMessage = "Some error occured";
    try {
      // Validate inputs
      if (full_name.isNotEmpty &&
          username.isNotEmpty &&
          full_name.isNotEmpty &&
          image != null) {
        // Create user in the authentication tab

        UserCredential userCredential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential.user!.email);
        // Upload image to firebase storage
        String uploadedImageDownloadUrl =
            await _uploadImageToFirebaseStorageAndGetImageURL(image);
        await firebaseFireStore
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          "email": email,
          "fullName": full_name,
          "userName": username,
          "imageUrl": uploadedImageDownloadUrl,
          "id": userCredential.user!.uid,
        });
        responseMessage = "Success";
      } else {
        responseMessage = "Please fields must not be empty";
      }
    } catch (err) {
      responseMessage = err.toString();
    }
    return responseMessage;
  }

  // Function to enable users pick image
  // Gallery
  // Camera
  Future<dynamic> enableNewUserToSelectImage(ImageSource imageSource) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? _selectedImage = await imagePicker.pickImage(source: imageSource);
    if (_selectedImage != null) {
      return await _selectedImage.readAsBytes();
    } else {
      Fluttertoast.showToast(msg: "No image selected");
    }
  }

  // Upload image to firebase storage
  Future<String> _uploadImageToFirebaseStorageAndGetImageURL(
      Uint8List image) async {
    Reference ref = firebaseStorage
        .ref()
        .child("profile_pic")
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snap = await uploadTask;
    String uploadedImageDownloadUrl = await snap.ref.getDownloadURL();
    return uploadedImageDownloadUrl;
  }

  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}
