import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/screens/auth/login_screen.dart';
import 'package:ecommerce_app/views/screens/auth/register_screen.dart';
import 'package:ecommerce_app/views/screens/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  bool _isLoading = false;

  // sign in users with email and password

  _resetPasswordWithEmail() async {
    setState(() {
      _isLoading = true;
    });
    String response = await AuthController().resetUserPasswordWithEmail(
      _emailTextController.text.trim(),
    );
    setState(() {
      _isLoading = false;
    });
    if (response != "Success") {
      return AuthController().showSnackBar(response, context);
    } else {
      _emailTextController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
      Fluttertoast.showToast(msg: "Kindly check your mail.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Field
            Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: backgroundColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailTextController,
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

            Container(
              width: screenWidth - 40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
              ),
              child: InkWell(
                onTap: _resetPasswordWithEmail,
                child: Center(
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Reset Password',
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
                "Go back",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: buttonColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
