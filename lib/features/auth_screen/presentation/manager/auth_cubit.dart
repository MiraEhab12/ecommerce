import 'package:ecommerce_udemy/features/auth_screen/data/repo/auth_repo.dart';
import 'package:ecommerce_udemy/features/auth_screen/presentation/manager/auth_state.dart';
import 'package:ecommerce_udemy/locator.dart';
import 'package:ecommerce_udemy/utils/helpers/storage_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;
  AuthCubit(this.repo) : super(const AuthState());
  static AuthCubit get(context) => context.read<AuthCubit>();
  Future <void> login({ required String username,required String password}) async {
    emit(state.copyWith(loading: true, error: null));
    final result = await repo.login(username, password);
    result.fold(
      (user) async {
         await sl<SecureStorage>().saveToken(user.accessToken!);
         print('SAVED TOKEN = ${user.accessToken}');
        emit(state.copyWith(
          loading: false,
          user: user,
        ));
      },
      (failure) {
        emit(state.copyWith(
          loading: false,
          error: failure.message,
        ));
      },
    );
  }}