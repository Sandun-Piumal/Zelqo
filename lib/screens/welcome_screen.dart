import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const Color zelqoGreen = Color(0xFF1D9E75);
  static const Color lightGreenBg = Color(0xFFE3F7EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF0FBF6), Colors.white],
            stops: [0.0, 0.4],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                // Illustration cluster
                SizedBox(
                  height: 220,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Center circle with message icon
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 44,
                          color: zelqoGreen,
                        ),
                      ),
                      // Top-right avatar
                      Positioned(
                        top: 10,
                        right: 20,
                        child: Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade300,
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
                            ],
                          ),
                          child: const Icon(Icons.person, color: Colors.white70, size: 26),
                        ),
                      ),
                      // Bottom-left avatar
                      Positioned(
                        bottom: 20,
                        left: 40,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFA8E0C8),
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
                            ],
                          ),
                        ),
                      ),
                      // "Welcome!" bubble
                      Positioned(
                        top: 46,
                        left: 4,
                        child: _speechBubble('Welcome! 👋'),
                      ),
                      // "Let's chat" bubble
                      Positioned(
                        bottom: 36,
                        right: 0,
                        child: _speechBubble("Let's chat 💚"),
                      ),
                      // small dots
                      const Positioned(top: 4, left: 66, child: _Dot()),
                      const Positioned(top: 100, right: 6, child: _Dot()),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Welcome to',
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Zelqo',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Simple. Secure. Meaningful conversations.',
                  style: TextStyle(fontSize: 13, color: Colors.black45),
                ),
                const SizedBox(height: 22),
                // Feature icons row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _FeatureIcon(icon: Icons.bolt, label: 'Fast'),
                    _FeatureIcon(icon: Icons.lock_outline, label: 'Secure'),
                    _FeatureIcon(icon: Icons.groups_outlined, label: 'Private'),
                  ],
                ),
                const SizedBox(height: 22),
                // Privacy notice card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.verified_user_outlined, color: zelqoGreen, size: 22),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.6),
                            children: [
                              TextSpan(text: 'Your privacy matters to us. Read our '),
                              TextSpan(
                                text: 'Privacy policy',
                                style: TextStyle(color: zelqoGreen),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Terms of service.',
                                style: TextStyle(color: zelqoGreen),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Agree button + arrow circle
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: zelqoGreen,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            'Agree and continue',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 52,
                      height: 52,
                      decoration: const BoxDecoration(
                        color: lightGreenBg,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_forward, color: zelqoGreen),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _speechBubble(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Color(0xFFB8E6D0),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _FeatureIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FeatureIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: WelcomeScreen.lightGreenBg,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: WelcomeScreen.zelqoGreen, size: 20),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.black87)),
      ],
    );
  }
}
