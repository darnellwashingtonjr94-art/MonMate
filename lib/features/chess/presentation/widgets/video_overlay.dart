class VideoChatOverlay extends StatelessWidget {
  final Room room; // LiveKit Room

  const VideoChatOverlay({required this.room});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      right: 20,
      child: Column(
        children: [
          // Opponent View
          _buildVideoTile(room.remoteParticipants.values.first),
          const SizedBox(height: 10),
          // Your View (Selfie)
          _buildVideoTile(room.localParticipant, isSmall: true),
        ],
      ),
    );
  }

  Widget _buildVideoTile(Participant? p, {bool isSmall = false}) {
    return Container(
      width: isSmall ? 80 : 120,
      height: isSmall ? 110 : 160,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepPurpleAccent, width: 2),
      ),
      child: p != null
          ? VideoTrackRenderer(p.videoTracks.first as VideoTrack)
          : Icon(Icons.person),
    );
  }
}
