class LobbyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _chatBubble("User123", "Anyone want a 10 MON blitz game?"),
                _chatBubble("GM_Monad", "I'm in. Create the room."),
              ],
            ),
          ),
          TextField(decoration: InputDecoration(hintText: "Type a message...")),
        ],
      ),
    );
  }

  Widget _chatBubble(String user, String msg) =>
      Padding(padding: EdgeInsets.all(4), child: Text("$user: $msg"));
}
