
import 'package:flutter/material.dart';
import 'package:verblet/core/enum.dart';
@immutable
sealed class ThemeEvent{
  const ThemeEvent();
  @override
  List<Object?> get props => [];
}

class LoadTheme extends ThemeEvent {}

class ChangeTheme extends ThemeEvent {
  final AppThemeMode themeMode;
  const ChangeTheme(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}
