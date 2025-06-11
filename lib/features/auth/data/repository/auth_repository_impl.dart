
import 'package:fpdart/fpdart.dart';
import 'package:verblet/core/error/exceptions.dart';
import 'package:verblet/core/error/failures.dart';
import 'package:verblet/features/auth/data/datasources/auth_supabase.dart';
import 'package:verblet/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImplementation(this.remoteDataSource);


  @override
  Future<Either<Failure, String>> loginWithEmailPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({required String name, required String email, required String password}) async{
    try{
      final userId = await remoteDataSource.signUpWithEmailPassword(name: name, email: email, password: password);
        return right(userId);
    } on ServerException catch(e){
      return Either.left(Failure(e.message));
    }
  }
}
