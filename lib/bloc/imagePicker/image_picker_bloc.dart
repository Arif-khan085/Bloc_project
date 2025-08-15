

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_bloc_project/bloc/imagePicker/image_picker_event.dart';
import 'package:my_bloc_project/bloc/imagePicker/image_picker_state.dart';
import 'package:my_bloc_project/utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerStates>{


  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils):super(ImagePickerStates()){
    on<CameraCapture>(cameraCapture);
  }

  void cameraCapture(CameraCapture event , Emitter<ImagePickerStates> states )async{
   final XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));


}
}