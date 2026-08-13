import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase (Replace with your actual URL and Anon Key)
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );

  runApp(const MonMateApp());
}

class MonMateApp extends StatelessWidget {
  const MonMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(
          0xFF0A0A0A,
        ), // Dark "Pulsing" theme
      ),
      home: const SocialChessRoom(),
    );
  }
}

class SocialChessRoom extends StatefulWidget {
  const SocialChessRoom({super.key});

  @override
  State<SocialChessRoom> createState() => _SocialChessRoomState();
}

class _SocialChessRoomState extends State<SocialChessRoom> {
  Room? _room;
  final List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _setupPresence();
  }

  // --- SOCIAL LAYER: Supabase Presence ---
  void _setupPresence() {
    final channel = Supabase.instance.client.channel('lobby');

    channel.onPresenceSync((payload) {
      debugPrint('Players online: ${channel.presenceState()}');
    }).subscribe((status, error) async {
      if (status == RealtimeSubscribeStatus.subscribed) {
        await channel.track({'status': 'Online', 'playing': false});
      }
    });
  }

  // --- REAL-TIME LAYER: LiveKit Connection ---
  Future<void> _connectToLiveHub() async {
    final room = Room();
    try {
      await room.connect('wss://your-livekit-url', 'your-token');
      setState(() {
        _room = room;
      });
      // Enable mic for "Trash Talk" feature
      await room.localParticipant?.setMicrophoneEnabled(true);
    } catch (e) {
      debugPrint('LiveKit Connection Failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MonMate Social Hub')),
      body: Column(
        children: [
          // Chess Board Area (Placeholder)
          const Expanded(
            flex: 3,
            child: Center(
              child: Icon(
                Icons.grid_4x4,
                size: 100,
                color: Colors.purpleAccent,
              ),
            ),
          ),

          // Social/Real-time Controls
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Text(_room != null ? "Voice Connected" : "Voice Disconnected"),
                ElevatedButton(
                  onPressed: _connectToLiveHub,
                  child: const Text('Join Voice & Social'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
