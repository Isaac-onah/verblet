
import 'package:fpdart/fpdart.dart';
import 'package:verblet/core/common/entities/user.dart';
import 'package:verblet/core/error/failures.dart';
import 'package:verblet/core/usecase_interface/usecase.dart';
import 'package:verblet/features/auth/domain/repository/auth_repository.dart';

class CurrentUser implements UseCase<User, NoParams>{
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async{
  return await authRepository.currentUser();
  }

}
