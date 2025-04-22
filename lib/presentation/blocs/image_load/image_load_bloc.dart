import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_load_event.dart';
import 'image_load_state.dart';

class ImageLoadBloc extends Bloc<ImageLoadEvent, ImageLoadState> {
  ImageLoadBloc() : super(ImageLoadInProgress()) {
    on<ImageLoadStarted>(_onImageLoadStarted);
    on<ImageLoadCompleted>(_onImageLoadCompleted);
  }

  void _onImageLoadStarted(
    ImageLoadStarted event,
    Emitter<ImageLoadState> emit,
  ) {
    emit(ImageLoadInProgress());
  }

  void _onImageLoadCompleted(
    ImageLoadCompleted event,
    Emitter<ImageLoadState> emit,
  ) {
    emit(ImageLoadFinished());
  }
}
