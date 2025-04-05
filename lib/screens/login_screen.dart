import 'package:flutter/material.dart';
import 'explore_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                _buildWelcomeText(),
                const SizedBox(height: 40),
                _buildInputFields(),
                const SizedBox(height: 16),
                _buildOptionsRow(),
                const SizedBox(height: 16),
                _buildLoginButton(),
                const SizedBox(height: 16),
                _buildContinueWithText(),
                const SizedBox(height: 16),
                _buildSocialLoginButtons(),
                const SizedBox(height: 16),
                _buildSignUpLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        const Text(
          'Hello',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text(
          'Again!',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Colors.blue),
        ),
        const SizedBox(height: 8),
        Text(
          'Welcome back you\'ve been missed',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildInputFields() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Username *',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password *',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: const Icon(Icons.visibility_off),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: (value) {
                setState(() {
                  rememberMe = value!;
                });
              },
            ),
            const Text('Remember me'),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot password?',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ExploreScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget _buildContinueWithText() {
    return Text(
      'or continue with',
      style: Theme.of(context).textTheme.headlineMedium,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.facebook),
          label: const Text('Facebook'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.g_mobiledata),
          label: const Text('Google'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpLink() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Don\'t have an account? SIGN UP',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}