import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:load_api/data/model/data_model.dart';

class GamesRepo {
  Future<List<DataModel>?> getGamesData() async {
    String url = "https://www.gamerpower.com/api/giveaways";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      return null;
    } else {
      Iterable models = jsonDecode(response.body);
      List<DataModel> datamodels = [];
      for (var model in models) {
        DataModel datamodel = DataModel.fromJson(model);
        datamodels.add(datamodel);
      }
      return datamodels;
    }
  }
}
