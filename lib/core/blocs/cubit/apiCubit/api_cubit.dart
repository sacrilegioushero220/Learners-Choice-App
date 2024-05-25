import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());

  Future<void> fetchItems() async {
    emit(ApiLoading());
    try {
      final cacheManager = DefaultCacheManager();
      const cacheKey = 'trafficSigns';
      final fileInfo = await cacheManager.getFileFromCache(cacheKey);

      // ignore: unnecessary_null_comparison
      if (fileInfo != null && fileInfo.file != null) {
        // If cache exists and is not expired, load from cache
        final cachedData = await fileInfo.file.readAsString();
        List<Map<String, dynamic>> cachedItems =
            List<Map<String, dynamic>>.from(json.decode(cachedData));
        print("Cacched items loaded");
        emit(ApiLoaded(cachedItems));
      } else {
        // Fetch data from Firestore
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('trafficSigns')
            .doc('mandatorySigns')
            .collection('signs')
            .get();

        List<Map<String, dynamic>> items = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        // Cache the fetched data
        await cacheManager.putFile(
          cacheKey,
          utf8.encode(json.encode(items)),
          fileExtension: 'json',
        );

        emit(ApiLoaded(items));
      }
    } catch (e) {
      emit(ApiError(e.toString()));
    }
  }
}
