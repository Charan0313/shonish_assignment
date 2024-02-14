import 'dart:convert';
import 'package:get/get.dart';
import 'package:shonish_assignment/app/modules/detail_screen/models/details_model.dart';
import 'package:shonish_assignment/app/services/load_data.dart';

class DetailController extends GetxController {
  List<DetailsModel> detailsmodel = List.empty(growable: true);
  Future<List<DetailsModel>> _parseJsonData() async {
    var response = await loadJsonData("assets/data/dummy_details.json");
    detailsmodel = json.decode(response);
    return detailsmodel
        .map((json) => DetailsModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
    _parseJsonData();
    update();
  }
}
