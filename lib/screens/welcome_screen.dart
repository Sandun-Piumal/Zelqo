import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const Color zelqoGreen = Color(0xFF1D9E75);
  static const Color lightGreenBg = Color(0xFFE3F7EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background soft blobs
          Positioned(
            top: -60,
            right: -80,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                color: lightGreenBg.withOpacity(0.6),
                borderRadius: BorderRadius.circular(120),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: -100,
            child: Container(
              width: 240,
              height: 200,
              decoration: BoxDecoration(
                color: lightGreenBg.withOpacity(0.6),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  // Illustration cluster
                  SizedBox(
                    width: 280,
                    height: 220,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        // Outer rings
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightGreenBg.withOpacity(0.35),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightGreenBg.withOpacity(0.55),
                          ),
                        ),
                        // Center circle with message icon
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 20,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.chat_bubble_outline_rounded,
                            size: 52,
                            color: zelqoGreen,
                          ),
                        ),
                        // Top-left avatar
                        const Positioned(
                          top: 5,
                          left: 5,
                          child: _AvatarCircle(bgColor: Color(0xFFD9D9D9), icon: Icons.person),
                        ),
                        // Top-right avatar
                        const Positioned(
                          top: -5,
                          right: 5,
                          child: _AvatarCircle(bgColor: Color(0xFFF3D9D9), icon: Icons.person),
                        ),
                        // Bottom-left avatar (solid green, no icon)
                        Positioned(
                          bottom: 5,
                          left: 20,
                          child: Container(
                            width: 50,
                            height: 50,
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
                        // Bottom-right avatar
                        const Positioned(
                          bottom: -5,
                          right: 10,
                          child: _AvatarCircle(bgColor: Color(0xFFA8E0C8), icon: Icons.person),
                        ),
                        // "Welcome!" bubble
                        Positioned(
                          top: 35,
                          left: -20,
                          child: _speechBubble('Welcome! 👋'),
                        ),
                        // "Let's chat" bubble
                        Positioned(
                          top: 75,
                          right: -30,
                          child: _speechBubble("Let's chat 💚"),
                        ),
                        // Small chat dots bubble bottom-left-center
                        Positioned(
                          bottom: 45,
                          left: -5,
                          child: Container(
                            width: 46,
                            height: 36,
                            decoration: BoxDecoration(
                              color: zelqoGreen,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(Icons.more_horiz, color: Colors.white, size: 20),
                          ),
                        ),
                        // Paper plane icon
                        Positioned(
                          bottom: 50,
                          right: 50,
                          child: Icon(Icons.send_rounded, color: zelqoGreen, size: 22),
                        ),
                        // small dots
                        const Positioned(top: -10, left: 90, child: _Dot()),
                        const Positioned(top: 60, right: -5, child: _Dot()),
                        const Positioned(bottom: -10, left: 120, child: _Dot()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 20),
                  // Feature icons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      _FeatureIcon(icon: Icons.bolt, label: 'Fast'),
                      _FeatureIcon(icon: Icons.lock_outline, label: 'Secure'),
                      _FeatureIcon(icon: Icons.groups_outlined, label: 'Private'),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          child: Row(
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

class _AvatarCircle extends StatelessWidget {
  final Color bgColor;
  final IconData icon;
  const _AvatarCircle({required this.bgColor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: 26),
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
