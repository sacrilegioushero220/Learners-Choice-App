import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<PickImageEvent>(_pickImageEvent);
  }
}

Future<void> _pickImageEvent(
    PickImageEvent event, Emitter<ApiState> emit) async {
  // logic to launch image picker and set _profilePicPath
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image != null) {
    // ImagePicked event with the selected image path
    emit(ImagePickedState());
  }
}
