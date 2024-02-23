import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/course.dart';
import 'explore_course_card.dart';

class ExploreCourseList extends StatefulWidget {
  const ExploreCourseList({super.key});

  @override
  State<ExploreCourseList> createState() => _ExploreCourseListState();
}

class _ExploreCourseListState extends State<ExploreCourseList> {
  List<Course> courses = [];
  final _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    getCourses();
  }

  void getCourses() {
    _firestore.collection("courses").get().then((snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          courses.add(Course(
              courseTitle: doc["courseTitle"],
              courseSubtitle: doc["courseSubtitle"],
              illustration: doc["illustration"],
              logo: doc["logo"],
              background: LinearGradient(colors: [
                Color(int.parse(doc["color"][0])),
                Color(int.parse(doc["color"][1])),
              ]),
              videoUrl: doc["videoUrl"]));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 10.0 : 0.0),
            child: ExploreCourseCard(course: courses[index]),
          );
        },
      ),
    );
  }
}
