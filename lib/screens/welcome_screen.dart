import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const Color zelqoGreen = Color(0xFF1D9E75);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: zelqoGreen.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.chat_bubble_outline_rounded,
                  size: 44,
                  color: zelqoGreen,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Welcome to',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              const SizedBox(height: 6),
              const Text(
                'Zelqo',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                      height: 1.6,
                    ),
                    children: [
                      const TextSpan(text: 'Read our '),
                      TextSpan(
                        text: 'Privacy policy',
                        style: TextStyle(color: zelqoGreen),
                      ),
                      const TextSpan(
                          text: '. Tap "Agree and continue" to accept the '),
                      TextSpan(
                        text: 'Terms of service',
                        style: TextStyle(color: zelqoGreen),
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: zelqoGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Agree and continue',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
