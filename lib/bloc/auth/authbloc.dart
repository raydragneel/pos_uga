import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pos_uga/repositories/auth_repository.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc() : super(AuthBlocStateInitial());

  @override
  Stream<AuthBlocState> mapEventToState(
    AuthBlocEvent event,
  ) async* {
    if (event is AuthBlocLoginEvent) {
      yield AuthBlocStateLoading();
      Map<String, dynamic> res =
          await AuthRepository.login(event.username, event.password);
      if (res['statusCode'] == 400 || res['data']['status'] == false) {
        yield AuthBlocStateError(res['data']);
      } else if (res['statusCode'] == 200) {
        yield AuthBlocStateSuccess(res['data']);
      } else {
        yield AuthBlocStateError(res['data']);
      }
    } else if (event is AuthBlocForgotPassEvent) {
      yield AuthBlocStateLoading();
      Map<String, dynamic> res =
          await AuthRepository.forgotpass(event.username, event.password);
      if (res['statusCode'] == 400 || res['data']['status'] == false) {
        yield AuthBlocStateError(res['data']);
      } else if (res['statusCode'] == 200) {
        yield AuthBlocStateSuccess(res['data']);
      } else {
        yield AuthBlocStateError(res['data']);
      }
    }
  }
}
