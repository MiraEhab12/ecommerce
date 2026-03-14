import 'package:ecommerce_udemy/features/auth_screen/data/model/auth_model.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool loading;
  final String? error;
  final AuthModel? user;

  const AuthState({
    this.loading = false,
    this.error,
    this.user,
  });

  AuthState copyWith({
    bool? loading,
    String? error,
    AuthModel? user,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      error: error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [loading, error, user];
}
