import 'package:flutter/material.dart';

class CVProvider extends ChangeNotifier {
  String fullName = '';
  String email = '';
  String phone = '';

  final List<String> skills = [];
  final List<ExperienceData> experiences = [];
  final List<ProjectData> projects = [];

  void updatePersonal({
    String? name,
    String? mail,
    String? ph,
  }) {
    if (name != null) fullName = name;
    if (mail != null) email = mail;
    if (ph != null) phone = ph;
    notifyListeners();
  }

  void addSkill(String skill) {
    if (skill.trim().isEmpty) return;
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
  final String role;
  final String company;
  final String period;
  final Color color;

  ExperienceData({
    required this.role,
    required this.company,
    required this.period,
    this.color = Colors.blueGrey,
  });
}

class ProjectData {
  final String title;
  final String videoPath;

  ProjectData({
    required this.title,
    required this.videoPath,
  });
}
