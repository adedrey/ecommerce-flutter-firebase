import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/views/screens/cart_screen.dart';
import 'package:ecommerce_app/views/screens/feeds_screen.dart';
import 'package:ecommerce_app/views/screens/home_screen.dart';
import 'package:ecommerce_app/views/screens/profile_screen.dart';
import 'package:ecommerce_app/views/screens/search_screen.dart';
import 'package:ecommerce_app/views/screens/upload_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// List of Pages
List<Widget> pages = [
  HomeScreen(),
  FeedsScreen(),
  SearchScreen(),
  CartScreen(),
  UploadScreen(),
  ProfileScreen(),
];

// Colors
var backgroundColor = Colors.black;
var buttonColor = Colors.black;
var textButtonColor = Colors.white;

// FireBase
var firebaseAuth = FirebaseAuth.instance;
var firebaseFireStore = FirebaseFirestore.instance;
var firebaseStorage = FirebaseStorage.instance;
