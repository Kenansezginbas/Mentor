import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  File? image;
  String postDesc = "";
  String plate = "";
  bool isLoading = false;
  final _firebaseFirestore = FirebaseFirestore.instance.collection("Questions");
  final _formKey = GlobalKey<FormState>();
  var uuid = Uuid();
  late var id;
  var _firebaseAuth = FirebaseAuth.instance;
  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? showProgress()
          : SingleChildScrollView(
              child: postQuestion(),
            ),
    );
  }

  Center showProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  postQuestion() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            formArea(),
            CustomGraidentButton(
              buttonText: "Paylaş",
              onPressed: sendMe,
            ),
          ],
        ),
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
            postDesc = val!;
          },
          cursorColor: Colors.black,
        ),
      ),
    );
  }

  sendMe() async {
    if (plate == null) {
      plate = "";
    }
    try {
      final result = await _firebaseFirestore.add({
        "Description": postDesc,
        "User": "",
        "ID": uuid.v1(),
        "Date": now.toString(),
      });
      cleanData();
      showSnackBar("Görüş ve Öneriniz Paylaşıldı, Teşekkür Ederiz :) ");
      Navigator.pushReplacementNamed(context, "/initialPage");
    } catch (e) {
      print(e.toString());

      showSnackBar(e.toString());
    }
  }

//veri kaydedildiğinde değişkenleri null'a çeker, loadingi false yapar;
  cleanData() {
    setState(() {
      image = null;
      postDesc = "";
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
