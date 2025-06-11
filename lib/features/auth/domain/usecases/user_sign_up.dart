
import 'package:fpdart/fpdart.dart';
import 'package:verblet/core/error/failures.dart';
import 'package:verblet/core/usecase_interface/usecase.dart';
import 'package:verblet/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<String, UserSignUpParams>{
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async{
    return await authRepository.signUpWithEmailPassword(name: params.name, email: params.email, password: params.password);
  }

}


class UserSignUpParams{
  final String name;
  final String email;
  final String password;

  UserSignUpParams({required this.name, required this.email, required this.password});

}