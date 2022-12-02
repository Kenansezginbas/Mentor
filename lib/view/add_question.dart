import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentor/service/auth/auth_service.dart';
import 'package:mentor/utils/custom_decoration.dart';
import 'package:mentor/utils/custom_text_style.dart';
import 'package:mentor/widgets/buttons/custom_graident_button.dart';
import 'package:mentor/widgets/texts/custom_post_test.dart';
import 'package:uuid/uuid.dart';

class AddQuetion extends StatefulWidget {
  const AddQuetion({super.key});

  @override
  State<AddQuetion> createState() => _AddQuetionState();
}

class _AddQuetionState extends State<AddQuetion> {
  String question = "";
  bool isLoading = false;
  User? _user;
  final _firebaseFirestore = FirebaseFirestore.instance.collection("Questions");
  final _formKey = GlobalKey<FormState>();
  var uuid = Uuid();
  late var id;
  var _firebaseAuth = FirebaseAuth.instance;
  var now = DateTime.now();
  final authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading ? showProgress() : body(),
    );
  }

  Center showProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  body() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          formArea(),
          CustomGraidentButton(
            buttonText: "Paylaş",
            onPressed: sendMe,
          ),
        ],
      );

  Form formArea() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          style: CustomTextStyle.titleWhiteTextStyle,
          maxLines: 3,
          validator: (val) {
            if (val!.isEmpty) {
              return "Lütfen Alanları Doldurunuz";
            } else {
              return null;
            }
          },
          onSaved: (val) {
            question = val!;
          },
          cursorColor: Colors.black,
          decoration: CustomDecoration().textFieldDecoration("Soru"),
        ),
      ),
    );
  }

  sendMe() async {
    try {
      final result = await _firebaseFirestore.add({
        "ID": uuid.v1(),
        "Date": now.toString(),
        "Question": question,
        "Answer": "",
        "Answered": false,
        "User": _user!.email,
        "Type": "Software"
      });
      cleanData();
      showSnackBar("Görüş ve Öneriniz Paylaşıldı, Teşekkür Ederiz :) ");
      Navigator.pushReplacementNamed(context, "/tabBarController");
    } catch (e) {
      print(e.toString());

      showSnackBar(e.toString());
    }
  }

  Future<void> _getUser() async {
    _user = await authService.currentUser();
  }

  cleanData() {
    setState(() {
      question = "";
      isLoading = false;
    });
  }

  showSnackBar(String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomPostText(text: content),
      ),
    );
  }
}
