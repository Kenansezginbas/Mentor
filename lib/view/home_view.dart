import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentor/widgets/cards/blog_container.dart';
import 'package:mentor/widgets/custom_circles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final firebaseFirestore = FirebaseFirestore.instance.collection("Blogs");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: firebaseFirestore.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return const CustomCircle();
          }
          final data = snapshot.requireData.docs;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return BlogContainer(
                  blogTitle: data[index]["BlogTitle"],
                  blogDate: data[index]["BlogDate"],
                  blogContent: data[index]["BlogContent"],
                  blogWriter: data[index]["BlogWriter"],
                  blogImageUrl: data[index]["BlogImageUrl"]);
            },
          );
        },
      ),
    );
  }
}
