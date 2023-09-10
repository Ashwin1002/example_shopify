part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthLoaded extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthError extends AuthState {
  @override
  List<Object?> get props => [];
}
