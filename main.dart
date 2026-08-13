import 'package:flutter/material.dart';

// Keep your existing import
import 'features/chess/presentation/pages/chess_page.dart';

// Note: You may also need to import the file containing 'PulsingBackground'

// 1. Define a global Navigator key so your deep link handler can push routes
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MonMateApp());
}

class MonMateApp extends StatelessWidget {
  const MonMateApp({super.key});

  // 2. Put your deep link handler logic here
  void handleDeepLink(Uri uri) {
    if (uri.pathSegments.contains('join')) {
      String? matchId = uri.queryParameters['matchId'];
      String? wager = uri.queryParameters['wager'];

      if (matchId != null) {
        // Navigate to the Wager Confirmation Screen
        navigatorKey.currentState?.pushNamed(
          '/confirm-wager',
          arguments: {
            'matchId': matchId,
            // Using tryParse is safer than parse to avoid crashes if 'wager' isn't a valid number
            'wager': double.tryParse(wager ?? '0') ?? 0.0,
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // 3. Wrap everything in a MaterialApp
    return MaterialApp(
      title: 'MonMate',
      navigatorKey: navigatorKey, // Attach the navigator key
      // 4. Use the nested widgets you specified for the home screen
      home: const PulsingBackground(child: ChessPage()),

      // 5. Make sure you define the route you are trying to push to!
      routes: {
        // Uncomment and point this to your actual confirmation screen widget
        // '/confirm-wager': (context) => const ConfirmWagerScreen(),
      },
    );
  }
}
