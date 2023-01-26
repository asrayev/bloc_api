// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import '../data/models/my_response.dart';
import '../data/services/api_service.dart';
part 'multi_state_event.dart';
part 'multi_state_state.dart';

class MultiStateBloc extends Bloc<MultiStateEvent, MultiStateState> {
  MultiStateBloc() : super(MultiStateInitial()) {
    on<GetDataFromApiEvent>(getData);

  }

  getData(GetDataFromApiEvent event, Emitter emit) async {
    emit(GettingDataInProgress());
    MyResponse myResponse = await ApiService().getAllCards();
    if(myResponse.error.isEmpty){
      emit(GettingDataInSuccess(cards: myResponse.data));
    }else{
      emit(GettingDataInFailure(errorText: myResponse.error));
    }
  }
}
