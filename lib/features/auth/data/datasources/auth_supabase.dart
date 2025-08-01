import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:verblet/core/error/exceptions.dart';
import 'package:verblet/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUserData();
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImplementation(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;


  @override
  Future<UserModel?> getCurrentUserData() async{
    try{
      if (currentUserSession!=null) {
        final userData = await supabaseClient.from('profiles').select().eq('id', currentUserSession!.user.id);
        
        return UserModel.fromJson(userData.first).copyWith(email: currentUserSession!.user.email);
      }
      return null;
    }catch(e){
      throw ServerException(e.toString());
    }
  }


  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async{
    try{
      final response = await supabaseClient.auth.signUp(password: password, email: email, data: {'name':name});
      if(response.user == null){
        throw ServerException('user is null');
      }
      return UserModel.fromJson(response.user!.toJson());
    }catch(e){
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async{
    try{
      final response = await supabaseClient.auth.signInWithPassword(password: password, email: email,);
      if(response.user == null){
        throw ServerException('user is null');
      }
      return UserModel.fromJson(response.user!.toJson());
    }catch(e){
      throw ServerException(e.toString());
    }
  }

}
