// SPDX-FileCopyrightText: 2019-Present Christian Kußowski
// SPDX-FileCopyrightText: 2019-Present Contributors to FluffyChat
//
// SPDX-License-Identifier: AGPL-3.0-or-later
// IA.app CHAT presentation adapted by VForge in 2026.

import 'package:fluffychat/utils/platform_infos.dart';
import 'package:fluffychat/widgets/layouts/login_scaffold.dart';
import 'package:material_ui/material_ui.dart';

/// IA.app onboarding over FluffyChat's real Matrix login controller.
class IntroPage extends StatelessWidget {
  final bool isLoading, hasPresetHomeserver;
  final String? loggingInToHomeserver, welcomeText;
  final VoidCallback login;

  const IntroPage({
    required this.isLoading,
    required this.loggingInToHomeserver,
    super.key,
    required this.hasPresetHomeserver,
    required this.welcomeText,
    required this.login,
  });

  @override
  Widget build(BuildContext context) {
    const pearl = Color(0xFFF5F5F5);
    const muted = Color(0xFF999999);
    return LoginScaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: pearl,
        title: const Text(
          'IA.app CHAT',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,
              letterSpacing: 2.1),
        ),
        actions: [
          IconButton(
            tooltip: 'Acerca de IA.app',
            icon: const Icon(Icons.info_outline, size: 19),
            onPressed: () => PlatformInfos.showDialog(context),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const CircularProgressIndicator.adaptive(),
                const SizedBox(height: 16),
                Text(loggingInToHomeserver == null
                    ? 'Preparando tu conexión'
                    : 'Conectando con $loggingInToHomeserver',
                    style: const TextStyle(color: muted, fontSize: 12)),
              ]),
            )
          : LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 8, 28, 24),
                    child: Column(
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * .57,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const _TriangleMark(),
                                const SizedBox(height: 17),
                                const Text('IA.app',
                                  style: TextStyle(
                                    color: pearl, fontSize: 34,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 4.2,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text('C H A T',
                                  style: TextStyle(
                                    color: Color(0xFFB7B7B7),
                                    fontSize: 10, letterSpacing: 4,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                const Text('Personas e inteligencias.',
                                  style: TextStyle(color: muted, fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height: 3),
                                const Text('En una misma conversación.',
                                  style: TextStyle(color: muted, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: FilledButton(
                            onPressed: login,
                            style: FilledButton.styleFrom(
                              backgroundColor: pearl,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              'Entrar a mi cuenta',
                              style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: .2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Acceso privado · Conversaciones seguras',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10, color: Color(0xFFB0B0B0),
                            letterSpacing: .4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'ChatGPT y Gemini: conexión en preparación',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10, color: Color(0xFF747474),
                            letterSpacing: .1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class _TriangleMark extends StatelessWidget {
  const _TriangleMark();

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _TriangleClipper(),
      child: const ColoredBox(
        color: Color(0xFFF8F8F8),
        child: SizedBox(width: 47, height: 42),
      ),
    );
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, 0)
    ..lineTo(size.width, 0)
    ..lineTo(size.width / 2, size.height)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
