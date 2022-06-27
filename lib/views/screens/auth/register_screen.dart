import 'dart:typed_data';

import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Enable New User to select Image
    getNewUserSelectedImage() async {
      Uint8List image = await AuthController()
          .enableNewUserToSelectImage(ImageSource.gallery);
      setState(() {
        _image = image;
      });
    }

    // Sign up new User
    createNewUserAccount() async {
      setState(() {
        _isLoading = true;
      });
      String responseMessage = await AuthController().signUpUsers(
        _fullNameController.text.trim(),
        _usernameController.text.trim().toLowerCase(),
        _emailController.text.trim().toLowerCase(),
        _passwordController.text.trim(),
        _image, //Bit Image
      );
      setState(() {
        _isLoading = false;
      });
      if (responseMessage != 'Success') {
        return AuthController().showSnackBar(responseMessage, context);
      } else {
        // Clear all inputs when successful
        _fullNameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _usernameController.clear();
        setState(() {
          _image = null;
        });
        Fluttertoast.showToast(
            msg: "Congrat! Your account has been created for you.");
      }
    }

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image Avatar
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.blue,
                          backgroundImage: MemoryImage(_image!))
                      : const CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.blue,
                          backgroundImage: NetworkImage(
                            'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png',
                          ),
                        ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: InkWell(
                      onTap: () {
                        getNewUserSelectedImage();
                      },
                      child: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Full name Field
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Enter your full name",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Username Field
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Enter your username",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Email Field
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // Email Margin-bottom
              const SizedBox(
                height: 20,
              ),
              // Password Field
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: screenWidth - 40,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                ),
                child: InkWell(
                  onTap: createNewUserAccount,
                  child: Center(
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: textButtonColor,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
