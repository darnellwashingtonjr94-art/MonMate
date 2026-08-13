import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';

class WalletService {
  late Web3App _web3App;

  Future<void> initialize() async {
    _web3App = await Web3App.createInstance(
      projectId: 'YOUR_PROJECT_ID', // Get from cloud.walletconnect.com
      metadata: const PairingMetadata(
        name: 'MonMate',
        description: 'Universal Chess on Monad',
        url: 'https://monmate.app',
        icons: ['https://monmate.app/logo.png'],
      ),
    );
  }

  Future<void> connectWallet() async {
    // Requesting Monad Chain (ID 143)
    final ConnectResponse response = await _web3App.connect(
      requiredNamespaces: {
        'eip155': const RequiredNamespace(
          chains: ['eip155:143'],
          methods: ['eth_sendTransaction', 'personal_sign'],
          events: ['chainChanged', 'accountsChanged'],
        ),
      },
    );

    // Launch the wallet app for the user to approve
    // Example: Launching MetaMask or Rabby
  }
}
