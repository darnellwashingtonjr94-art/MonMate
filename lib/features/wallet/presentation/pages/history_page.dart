class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MonMate Earnings")),
      body: ListView.builder(
        itemCount: 10, // Replace with dynamic data from contract
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.account_balance_wallet,
              color: Colors.purpleAccent,
            ),
            title: Text("Won Match #420"),
            subtitle: Text("May 10, 2026"),
            trailing: Text(
              "+5.0 MON",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
