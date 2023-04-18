import 'dart:convert';
import 'dart:io';
import 'package:tagumpai/constants/api.dart';
import 'package:tagumpai/models/syllabus.dart';
import 'package:tagumpai/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  var client = http.Client();

  static Future<dynamic> getApi(String path) async {
    final response = await http.get(Uri.parse("$BASE_URL/$path"));

    Map jsonResponse = jsonDecode(response.body);
    print("Api fetched: $jsonResponse");
  }

  Future<dynamic> fetchApi(String path) async {
    final url = "https://tagumpai-api-development-production.up.railway.app";
    var uri = Uri.parse(url + "/$path/generate/");
    final body = SyllabusModel(
      purpose: "Upskill",
      currentIndustry: "Technology",
      targetIndustry: "Technology",
      desiredJob: "Data engineer",
      currentJob: "AI Engineer",
      currentSkills: [
        "Python",
        "Data Engineering",
      ],
      targetSkills: "Data Engineering",
      targetCompany: "Accenture",
      jobDesc:
          "The work:\nAssists with the data platform blueprint and design, encompassing the relevant data platform components.\nCollaborates with the Integration Architects and Data Architects to ensure cohesive integration between systems and data models.\nRequirements:\n\nKnowledgeable in Snowflake Data Warehouse and Snowflake Schema\nMinimum of 1 year of experience designing and implementing a full-scale data warehouse solution based on Snowflake\nExpertise and excellent proficiency with Snowflake internals and integration of Snowflake with other technologies for data processing and reporting\nA highly effective communicator, both orally and in writing\nProblem-solving and architecting skills in cases of unclear requirements\nA minimum of 1 year of experience architecting large-scale data solutions, performing architectural assessments, examining architectural alternatives, and choosing the best solution in collaboration with both IT and business stakeholder\nExperience in data migration projects using continuous integration/continuous delivery techniques.\nExperience in writing advanced SQL including query tuning.\nExperience using enterprise applications tools: HP ALM, JIRA, Jenkins, QuerySurge, Informatica DVO, Version control tool(ex. GIT)",
    ).toJson();
    var _headers = {
      "Content-Type": "application/json",
    };

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json);
      return json;
    }
  }
}
