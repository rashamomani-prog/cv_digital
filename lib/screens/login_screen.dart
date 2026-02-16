import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;

  final authService = AuthService();
  final storage = GetStorage();

  void login() async {
    final user = await authService.login(
      emailController.text,
      passwordController.text,
    );

    if (user != null) {
      if (rememberMe) {
        // حفظ الخيار محليًا باستخدام GetStorage
        storage.write('remember', true);
      } else {
        storage.remove('remember');
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // قراءة الخيار عند بدء الشاشة
    final storedRemember = storage.read('remember') ?? false;
    setState(() => rememberMe = storedRemember);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            CheckboxListTile(
              title: const Text('Remember Me'),
              value: rememberMe,
              onChanged: (v) => setState(() => rememberMe = v!),
            ),
            ElevatedButton(onPressed: login, child: const Text('Login')),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const RegisterScreen()));
              },
              child: const Text('Create Account'),
            )
          ],
        ),
      ),
    );
  }
}
