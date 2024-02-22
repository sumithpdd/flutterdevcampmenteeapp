import 'package:flutter/material.dart';

class Course {
  Course({
    required this.id,
    required this.courseTitle,
    required this.courseSubtitle,
    required this.background,
    required this.illustration,
    this.logo,
    required this.videoUrl,
  });
  String id;
  String courseTitle;
  String courseSubtitle;
  LinearGradient background;
  String illustration;
  String? logo;
  String videoUrl;
}

class Session {
  Session({
    required this.id,
    required this.courseTitle,
    required this.courseSubtitle,
    required this.background,
    required this.illustration,
    this.logo,
  });
  String id;
  String courseTitle;
  String courseSubtitle;
  LinearGradient background;
  String illustration;
  String? logo;
}

// Recent Courses
var recentCourses = [
  Course(
    id: "01",
    courseTitle: "Flutter Devcamp 2024",
    courseSubtitle: "7 sessions",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    illustration: 'illustration-01.png',
    logo: 'flutter-logo.png',
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
  Course(
    id: "02",
    courseTitle: "Flutter DevCamp 2023 State Management",
    courseSubtitle: "10 sessions",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFD504F),
        Color(0xFFFF8181),
      ],
    ),
    illustration: 'illustration-02.png',
    logo: 'flutter-logo.png',
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
  Course(
    id: "03",
    courseTitle: "Build an app with Flutter",
    courseSubtitle: "22 sessions",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00E1EE),
        Color(0xFF001392),
      ],
    ),
    illustration: 'illustration-03.png',
    logo: 'flutter-logo.png',
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
];

// Explore Courses
var exploreCourses = [
  Course(
    id: "04",
    courseTitle: "Devcamp 2023 Womens Special",
    courseSubtitle: "8 sessions",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5BCEA6),
        Color(0xFF1997AB),
      ],
    ),
    illustration: 'illustration-04.png',
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
  Course(
    id: "05",
    courseTitle: "Build an app with Flutter",
    courseSubtitle: "22 sessions",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA931E5),
        Color(0xFF4B02FE),
      ],
    ),
    illustration: 'illustration-05.png',
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
];

// Continue Watching Courses
var continueWatchingCourses = [
  Course(
    id: "06",
    courseTitle: "Flutter for Designers",
    courseSubtitle: " Animations",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
    illustration: 'illustration-06.png',
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
  Course(
    id: "07",
    courseTitle: "Flutter Animation",
    courseSubtitle: "Multiple Scrolling",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFA7D75),
        Color(0xFFC23D61),
      ],
    ),
    illustration: 'illustration-07.png',
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
];

// Course sessions
var courseSessions = [
  Session(
    id: "07",
    courseTitle: "Flutter UI",
    courseSubtitle: "01 session",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    illustration: 'illustration-01.png',
  ),
  Session(
    id: "08",
    courseTitle: "Responsive designs + Themeing",
    courseSubtitle: "02 session",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFE477AE),
        Color(0xFFC54284),
      ],
    ),
    illustration: 'illustration-08.png',
  ),
  Session(
    id: "09",
    courseTitle: "Routing - go router",
    courseSubtitle: "03 session",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFEA7E58),
        Color(0xFFCE4E27),
      ],
    ),
    illustration: 'illustration-09.png',
  ),
  Session(
    id: "10",
    courseTitle: "Code refactoring",
    courseSubtitle: "04 session",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF72CFD4),
        Color(0xFF42A0C2),
      ],
    ),
    illustration: 'illustration-10.png',
  ),
  Session(
    id: "11",
    courseTitle: "Code generation",
    courseSubtitle: "05 session",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFF2E56),
        Color(0xFFCB012B),
      ],
    ),
    illustration: 'illustration-11.png',
  ),
];

// Completed Courses
var completedCourses = [
  Course(
    id: "12",
    courseTitle: "-(Models)API - integration",
    courseSubtitle: "Certified",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFF6B94),
        Color(0xFF6B2E98),
      ],
    ),
    illustration: 'illustration-12.png',
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
  Course(
    id: "13",
    courseTitle: "Flutter Firebase",
    courseSubtitle: "Yet to be Certified",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFDEC8FA),
        Color(0xFF4A1B6D),
      ],
    ),
    illustration: 'illustration-13.png',
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
];
