part of 'app_user.dart';

@immutable
sealed class AppUserState {}

final class AppUserInitial extends AppUserState {}

final class AppUserLoggedIn extends AppUserState{
  final User user;
 AppUserLoggedIn(this.user);
}

//core can not depend on other features but other features can depend on core
