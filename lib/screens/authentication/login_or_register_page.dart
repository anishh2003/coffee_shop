import 'package:coffee_shop_migrated/provider/auth_page_provider.dart';
import 'package:coffee_shop_migrated/screens/authentication/login_page.dart';
import 'package:coffee_shop_migrated/screens/authentication/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginOrRegisterPage extends ConsumerStatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends ConsumerState<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    var authPageShown = ref.watch(authPageProvider);
    if (authPageShown) {
      return const LoginPage();
    } else {}
    return const RegisterPage();
  }
}
