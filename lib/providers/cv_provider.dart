import 'package:flutter/material.dart';

class CvProvider with ChangeNotifier {
  String fullName = '';
  String email = '';
  String phone = '';
  List<String> skills = [];
  List<ExperienceData> experiences = [];
  List<ProjectData> projects = [];

  // تحديث البيانات الشخصية
  void updatePersonal({String? name, String? mail, String? ph}) {
    if (name != null) fullName = name;
    if (mail != null) email = mail;
    if (ph != null) phone = ph;
    notifyListeners();
  }

  void addSkill(String skill) {
    skills.add(skill);
    notifyListeners();
  }

  void addExperience(ExperienceData exp) {
    experiences.add(exp);
    notifyListeners();
  }

  void addProject(ProjectData proj) {
    projects.add(proj);
    notifyListeners();
  }
}

class ExperienceData {
  String role;
  String company;
  String period;
  Color color;
  ExperienceData({
    required this.role,
    required this.company,
    required this.period,
    this.color = Colors.blueGrey,
  });
}

class ProjectData {
  String title;
  String videoPath;
  ProjectData({required this.title, required this.videoPath});
}
