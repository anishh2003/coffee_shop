import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersSettings {
  static late SharedPreferences _sharedPreferences;
  static late bool toggleValue;

  Future<void> initialiseSettings() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  bool? getUsersThemeSettings() {
    bool? settingsConfig = _sharedPreferences.getBool('Theme');
    settingsConfig ??= false;
    toggleValue = settingsConfig;
    return settingsConfig;
  }

  Future<void> setUsersThemeSettings(bool value) async {
    await _sharedPreferences.setBool('Theme', value);
  }
}

final usersSettingsProvider = Provider<UsersSettings>((ref) {
  return UsersSettings();
});

final darkThemeProvider = StateProvider<bool>((ref) {
  return false;
});

final initialiseSettingsProvider = FutureProvider<void>((ref) async {
  UsersSettings userSettings = ref.read(usersSettingsProvider);
  await userSettings.initialiseSettings();
  ref
      .read(darkThemeProvider.notifier)
      .update((state) => userSettings.getUsersThemeSettings()!);
});
