import 'package:share_plus/share_plus.dart';

class InviteGenerator {
  static void shareMatchInvite({
    required String matchId,
    required double wager,
  }) {
    // This creates a link that opens the MonMate app directly
    final String url = "https://monmate.app/join?matchId=$matchId&wager=$wager";

    Share.share(
      "⚔️ Challenge me to Chess on MonMate!\n"
      "💰 Wager: $wager MON\n"
      "🔗 Play here: $url",
      subject: "MonMate Chess Challenge",
    );
  }
}
