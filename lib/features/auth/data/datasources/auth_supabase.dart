import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:verblet/core/error/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImplementation(this.supabaseClient);

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async{
    try{
      final response = await supabaseClient.auth.signUp(password: password, email: email, data: {'name':name});
      if(response.user == null){
        throw ServerException('user is null');
      }
      return response.user!.id;
    }catch(e){
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
