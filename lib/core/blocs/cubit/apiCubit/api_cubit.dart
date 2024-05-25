// Define the cubit

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());

  Future<void> fetchItems() async {
    emit(ApiLoading());
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('trafficSigns')
          .doc('mandatorySigns')
          .collection('signs')
          .get();
      List<Map<String, dynamic>> items = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      emit(ApiLoaded(items));
    } catch (e) {
      emit(ApiError(e.toString()));
    }
  }
}
