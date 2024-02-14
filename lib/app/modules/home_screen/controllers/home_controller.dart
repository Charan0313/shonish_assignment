import 'dart:convert';
import 'package:get/get.dart';
import 'package:shonish_assignment/app/modules/home_screen/models/tasks_model.dart';
import 'package:shonish_assignment/app/services/load_data.dart';

class HomeController extends GetxController {
  List<TasksModel> taskslist = List.empty(growable: true);
  List<TasksModel> offerlist = List.empty(growable: true);

  
  Future<List<TasksModel>> _parseTasksData() async {
    var response = await loadJsonData("assets/data/dummy_tasks.json");
    List<dynamic> taskslist = json.decode(response);
    return taskslist
        .map((json) => TasksModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<TasksModel>> _parseOffersData() async {
    var response = await loadJsonData("assets/data/dummy_tasks.json");
    List<dynamic> offerslist = json.decode(response);
    return offerslist
        .map((json) => TasksModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  void onInit() async {
    super.onInit();
    taskslist = await _parseTasksData();
    offerlist = await _parseOffersData();
    update();
  }
}
