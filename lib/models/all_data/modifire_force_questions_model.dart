// To parse this JSON data, do
//
//     final modifireForceQuestionsModel = modifireForceQuestionsModelFromJson(jsonString);

import 'dart:convert';

import 'package:restaurant_system/models/all_data/force_question_model.dart';
import 'package:restaurant_system/models/all_data/modifier_model.dart';

ModifireForceQuestionsModel modifireForceQuestionsModelFromJson(String str) => ModifireForceQuestionsModel.fromJson(json.decode(str));

String modifireForceQuestionsModelToJson(ModifireForceQuestionsModel data) => json.encode(data.toJson());

class ModifireForceQuestionsModel {
  ModifireForceQuestionsModel({
    required this.id,
    required this.forceQuestion,
    required this.modifires,
  });

  int id;
  ForceQuestionModel forceQuestion;
  ModifierModel modifires;

  factory ModifireForceQuestionsModel.fromJson(Map<String, dynamic> json) => ModifireForceQuestionsModel(
        id: json["Id"] ?? 0,
        forceQuestion: json["forceQuestion"] == null ? ForceQuestionModel.init() : ForceQuestionModel.fromJson(json["forceQuestion"]),
        modifires: json["modifires"] == null ? ModifierModel.init() : ModifierModel.fromJson(json["modifires"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "forceQuestion": forceQuestion.toJson(),
        "modifires": modifires.toJson(),
      };
}