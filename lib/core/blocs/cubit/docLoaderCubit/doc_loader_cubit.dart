import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:learners_choice_app/core/blocs/cubit/docLoaderCubit/doc_loader_state.dart';
import 'package:learners_choice_app/model/driver_acts/driver_acts.dart';

class DocLoaderCubit extends Cubit<DocLoaderState> {
  final CacheManager cacheManager;
  final String cacheKey = 'docs';
  DocLoaderCubit(this.cacheManager) : super(DocLoaderInitial());

//Fetch QnA Data

  Future<void> fetchDriverActs() async {
    emit(DocLoading());
    try {
      // Fetch questions from Firebase (or in this case, from local JSON file)
      List<DriverActs> allDriverActs = (await fetchDriverActsFromJson());

      // Emit the loaded state
      emit(DriverActsLoaded(driverActs: allDriverActs.toList()));
    } catch (e) {
      emit(DocLoaderError(message: e.toString()));
    }
  }

  Future<List<DriverActs>> fetchDriverActsFromJson() async {
    // Load the JSON file from the assets folder
    final String response = await rootBundle.loadString('assets/actsData.json');

    List<dynamic> jsonData = json.decode(response);

    // Convert JSON data to a list of qnA objects
    List<DriverActs> driverActs =
        jsonData.map((data) => DriverActs.fromMap(data)).toList();

    return driverActs;
  }

  Future<void> cacheDriverActs(List<DriverActs> driverActs) async {
    final cacheItems = driverActs.map((qnA) => driverActs.asMap()).toList();
    await cacheManager.putFile(
      cacheKey,
      Uint8List.fromList(json.encode(cacheItems).codeUnits),
      fileExtension: 'json',
    );
  }
}
