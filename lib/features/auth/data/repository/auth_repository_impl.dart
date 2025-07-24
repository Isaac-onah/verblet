
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:verblet/core/common/entities/user.dart';
import 'package:verblet/core/error/exceptions.dart';
import 'package:verblet/core/error/failures.dart';
import 'package:verblet/features/auth/data/datasources/auth_supabase.dart';
import 'package:verblet/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> currentUser() async{
    try{
      final user = await remoteDataSource.getCurrentUserData();
      if(user == null){
        return left(Failure('User not logged in!'));
      }
      return right(user);
    }on ServerException catch(e){
      throw ServerException(e.toString());
    }

  }

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({required String email, required String password}) async{
    //wrapper functions
    return _getUser( () async => await remoteDataSource.loginWithEmailPassword(email: email, password: password));
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({required String name, required String email, required String password}) async{

    //wrapper functions
      return _getUser( () async => await remoteDataSource.signUpWithEmailPassword(name: name, email: email, password: password));
  }

  Future<Either<Failure, User>> _getUser(Future<User> Function() fn) async{
    try{
      final user = await fn();
      return right(user);
    } on sb.AuthException catch(e){
      return Either.left(Failure(e.message));
    }on ServerException catch(e){
      return Either.left(Failure(e.message));
    }
  }

}
