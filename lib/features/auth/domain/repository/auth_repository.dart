import 'package:fpdart/fpdart.dart';
import 'package:verblet/core/common/entities/user.dart';
import 'package:verblet/core/error/failures.dart';

abstract interface class AuthRepository {

  Future<Either<Failure, User>> signUpWithEmailPassword(
      {required String name, required String email, required String password});

  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password});

  Future<Either<Failure, User>> currentUser();
}
