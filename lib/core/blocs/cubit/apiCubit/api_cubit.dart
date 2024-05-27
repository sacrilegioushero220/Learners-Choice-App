import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'traffic_sign_type.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());

  Future<void> fetchItems(TrafficSignType type) async {
    emit(ApiLoading());
    try {
      final cacheManager = DefaultCacheManager();
      final cacheKey = 'trafficSigns_${type.path}';
      final fileInfo = await cacheManager.getFileFromCache(cacheKey);

      if (fileInfo != null) {
        // If cache exists and is not expired, load from cache
        final cachedData = await fileInfo.file.readAsString();
        List<Map<String, dynamic>> cachedItems =
            List<Map<String, dynamic>>.from(json.decode(cachedData));

        // Sort the cached items by the 'no' field as an integer
        cachedItems.sort((a, b) => (int.parse(a['no'].toString()))
            .compareTo(int.parse(b['no'].toString())));

        emit(ApiLoaded(cachedItems));
      } else {
        // Fetch data from Firestore
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('trafficSigns')
            .doc(type.path)
            .collection('signs')
            .get();

        List<Map<String, dynamic>> items = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        // Sort the fetched items by the 'no' field as an integer
        items.sort((a, b) => (int.parse(a['no'].toString()))
            .compareTo(int.parse(b['no'].toString())));

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