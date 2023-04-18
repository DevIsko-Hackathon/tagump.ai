// To parse this JSON data, do
//
//     final syllabusModel = syllabusModelFromJson(jsonString);

import 'dart:convert';

SyllabusModel syllabusModelFromJson(String str) =>
    SyllabusModel.fromJson(json.decode(str));

String syllabusModelToJson(SyllabusModel data) => json.encode(data.toJson());

class SyllabusModel {
  SyllabusModel({
    required this.purpose,
    required this.currentIndustry,
    required this.targetIndustry,
    required this.desiredJob,
    required this.currentJob,
    required this.currentSkills,
    required this.targetSkills,
    required this.targetCompany,
    required this.jobDesc,
  });

  String purpose;
  String currentIndustry;
  String targetIndustry;
  String desiredJob;
  String currentJob;
  List<String> currentSkills;
  String targetSkills;
  String targetCompany;
  String jobDesc;

  factory SyllabusModel.fromJson(Map<String, dynamic> json) => SyllabusModel(
        purpose: json["purpose"],
        currentIndustry: json["currentIndustry"],
        targetIndustry: json["targetIndustry"],
        desiredJob: json["desiredJob"],
        currentJob: json["currentJob"],
        currentSkills:
            List<String>.from(json["currentSkills"].map((value) => value)),
        targetSkills: json["targetSkills"],
        targetCompany: json["targetCompany"],
        jobDesc: json["jobDesc"],
      );

  Map<String, dynamic> toJson() => {
        "purpose": purpose,
        "currentIndustry": currentIndustry,
        "targetIndustry": targetIndustry,
        "desiredJob": desiredJob,
        "currentJob": currentJob,
        "currentSkills": List<String>.from(currentSkills.map((value) => value)),
        "targetSkills": targetSkills,
        "targetCompany": targetCompany,
        "jobDesc": jobDesc,
      };
}
