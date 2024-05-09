import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:og_wallet_sdk/common/network_asset.dart';
import 'package:og_wallet_sdk/models/crypto_asset.dart';
import 'package:og_wallet_sdk/models/crypto_explorer_type.dart';
import 'package:og_wallet_sdk/models/primary_blockchain_type.dart';

enum BlockchainType {
  @JsonValue('ETH_MAIN_NET')
  ethereumMainNet,
  @JsonValue('ETH_ROPSTEN_TEST_NET')
  ethereumRopstenTestNet,
  @JsonValue('ETH_RINKEBY_TEST_NET')
  ethereumRinkebyTestNet,
  @JsonValue('ETH_GOERLI_TEST_NET')
  ethereumGoerliTestNet,
  @JsonValue('BSC_MAIN_NET')
  bscMainNet,
  @JsonValue('BSC_TEST_NET')
  bscTestNet,
  @JsonValue('SOLANA_MAIN_NET')
  solanaMainNet,
  @JsonValue('SOLANA_TEST_NET')
  solanaTestNet,
  @JsonValue('SOLANA_DEV_NET')
  solanaDevNet,
  @JsonValue('OKC_MAIN_NET')
  okcMainNet,
  @JsonValue('OKC_TEST_NET')
  okcTestNet,
  @JsonValue('POLYGON_MAIN_NET')
  polygonMainNet,
  @JsonValue('POLYGON_TEST_NET')
  polygonTestNet,
  @JsonValue('NEUROCHAIN_MAIN_NET')
  neurochainMainNet,
  @JsonValue('BITCOIN_MAIN_NET')
  bitcoinMainNet,
  @JsonValue('BITCOIN_TEST_NET')
  bitcoinTestNet;

  factory BlockchainType.fromAnkr(String blockchain) {
    switch (blockchain) {
      case 'eth':
        return BlockchainType.ethereumMainNet;
      case 'eth_goerli':
        return BlockchainType.ethereumGoerliTestNet;
      case 'bsc':
        return BlockchainType.bscMainNet;
      case 'polygon':
        return BlockchainType.polygonMainNet;
      case 'polygon_mumbai':
        return BlockchainType.polygonTestNet;
      default:
        return BlockchainType.ethereumMainNet;
    }
  }

  factory BlockchainType.fromTrustWallet(String blockchain) {
    switch (blockchain) {
      case 'ethereum':
        return BlockchainType.ethereumMainNet;
      case 'smartchain':
        return BlockchainType.bscMainNet;
      case 'okexchain':
        return BlockchainType.okcMainNet;
      case 'polygon':
        return BlockchainType.polygonMainNet;
      case 'solana':
        return BlockchainType.solanaMainNet;
      default:
        return BlockchainType.ethereumMainNet;
    }
  }
}

extension BlockchainTypeExtension on BlockchainType {
  String get trustWalletString {
    switch (this) {
      case BlockchainType.ethereumMainNet:
        return 'ethereum';
      case BlockchainType.ethereumRopstenTestNet:
        return 'ethereum';
      case BlockchainType.ethereumRinkebyTestNet:
        return 'ethereum';
      case BlockchainType.ethereumGoerliTestNet:
        return 'ethereum';
      case BlockchainType.bscMainNet:
        return 'smartchain';
      case BlockchainType.bscTestNet:
        return 'smartchain';
      case BlockchainType.solanaMainNet:
        return 'solana';
      case BlockchainType.solanaTestNet:
        return 'solana';
      case BlockchainType.solanaDevNet:
        return 'solana';
      case BlockchainType.okcMainNet:
        return 'okexchain';
      case BlockchainType.okcTestNet:
        return 'okexchain';
      case BlockchainType.polygonMainNet:
        return 'polygon';
      case BlockchainType.polygonTestNet:
        return 'polygon';
      case BlockchainType.neurochainMainNet:
        return 'neurochain'; // TODO(RIMAS): Add neurochain
      case BlockchainType.bitcoinMainNet:
        return 'bitcoin'; // TODO(RIMAS): Add bitcoin
      case BlockchainType.bitcoinTestNet:
        return 'bitcoin'; // TODO(RIMAS): Add bitcoin
    }
  }

  PrimaryBlockchainType get blockchainParentType {
    switch (this) {
      case BlockchainType.ethereumMainNet:
      case BlockchainType.ethereumRopstenTestNet:
      case BlockchainType.ethereumRinkebyTestNet:
      case BlockchainType.ethereumGoerliTestNet:
      case BlockchainType.bscMainNet:
      case BlockchainType.bscTestNet:
      case BlockchainType.okcMainNet:
      case BlockchainType.okcTestNet:
      case BlockchainType.polygonMainNet:
      case BlockchainType.polygonTestNet:
      case BlockchainType.neurochainMainNet:
        return PrimaryBlockchainType.ethereum;
      case BlockchainType.solanaMainNet:
      case BlockchainType.solanaTestNet:
      case BlockchainType.solanaDevNet:
        return PrimaryBlockchainType.solana;
      case BlockchainType.bitcoinMainNet:
      case BlockchainType.bitcoinTestNet:
        return PrimaryBlockchainType.bitcoin;
    }
  }

  int get chainId {
    switch (this) {
      case BlockchainType.ethereumMainNet:
        return 1;
      case BlockchainType.ethereumRopstenTestNet:
        return 3;
      case BlockchainType.ethereumRinkebyTestNet:
        return 4;
      case BlockchainType.ethereumGoerliTestNet:
        return 5;
      case BlockchainType.bscMainNet:
        return 56;
      case BlockchainType.bscTestNet:
        return 97;
      case BlockchainType.okcMainNet:
        return 66;
      case BlockchainType.okcTestNet:
        return 65;
      case BlockchainType.solanaMainNet:
        return 101;
      case BlockchainType.solanaTestNet:
        return 102;
      case BlockchainType.solanaDevNet:
        return 103;
      case BlockchainType.polygonMainNet:
        return 137;
      case BlockchainType.polygonTestNet:
        return 80001;
      case BlockchainType.neurochainMainNet:
        return 313;
      case BlockchainType.bitcoinMainNet:
        return 0;
      case BlockchainType.bitcoinTestNet:
        return 0;
    }
  }

  String get caip2 {
    switch (this) {
      case BlockchainType.ethereumMainNet:
        return 'eip155:1';
      case BlockchainType.ethereumRopstenTestNet:
        return 'eip155:3';
      case BlockchainType.ethereumRinkebyTestNet:
        return 'eip155:4';
      case BlockchainType.ethereumGoerliTestNet:
        return 'eip155:5';
      case BlockchainType.bscMainNet:
        return 'eip155:56';
      case BlockchainType.bscTestNet:
        return 'eip155:97';
      case BlockchainType.solanaMainNet:
        return 'solana:4sGjMW1sUnHzSxGspuhpqLDx6wiyjNtZ';
      case BlockchainType.solanaTestNet:
        return 'solana:4uhcVJyU9pJkvQyS88uRDiswHXSCkY3z';
      case BlockchainType.solanaDevNet:
        return 'solana:8E9rvCKLFQia2Y35HXjjpWzj8weVo44K';
      case BlockchainType.okcMainNet:
        return 'eip155:66';
      case BlockchainType.okcTestNet:
        return 'eip155:65';
      case BlockchainType.polygonMainNet:
        return 'eip155:137';
      case BlockchainType.polygonTestNet:
        return 'eip155:80001';
      case BlockchainType.neurochainMainNet:
        return 'eip155:313';
      case BlockchainType.bitcoinMainNet:
        return 'eip155:0';
      case BlockchainType.bitcoinTestNet:
        return 'eip155:0';
    }
  }

  String caip10(String address) {
    return '$caip2:$address';
  }

  String get jsonValue {
    switch (this) {
      case BlockchainType.ethereumMainNet:
        return 'ETH_MAIN_NET';
      case BlockchainType.ethereumRopstenTestNet:
        return 'ETH_ROPSTEN_TEST_NET';
      case BlockchainType.ethereumRinkebyTestNet:
        return 'ETH_RINKEBY_TEST_NET';
      case BlockchainType.ethereumGoerliTestNet:
        return 'ETH_GOERLI_TEST_NET';
      case BlockchainType.bscMainNet:
        return 'BSC_MAIN_NET';
      case BlockchainType.bscTestNet:
        return 'BSC_TEST_NET';
      case BlockchainType.solanaMainNet:
        return 'SOLANA_MAIN_NET';
      case BlockchainType.solanaTestNet:
        return 'SOLANA_TEST_NET';
      case BlockchainType.solanaDevNet:
        return 'SOLANA_DEV_NET';
      case BlockchainType.okcMainNet:
        return 'OKC_MAIN_NET';
      case BlockchainType.okcTestNet:
        return 'OKC_TEST_NET';
      case BlockchainType.polygonMainNet:
        return 'POLYGON_MAIN_NET';
      case BlockchainType.polygonTestNet:
        return 'POLYGON_TEST_NET';
      case BlockchainType.neurochainMainNet:
        return 'NEUROCHAIN_MAIN_NET';
      case BlockchainType.bitcoinMainNet:
        return 'BITCOIN_MAIN_NET';
      case BlockchainType.bitcoinTestNet:
        return 'BITCOIN_TEST_NET';
    }
  }

  String get tokenStandard {
    switch (this) {
      case BlockchainType.ethereumMainNet:
      case BlockchainType.ethereumRopstenTestNet:
      case BlockchainType.ethereumRinkebyTestNet:
      case BlockchainType.ethereumGoerliTestNet:
      case BlockchainType.neurochainMainNet:
      case BlockchainType.polygonMainNet:
      case BlockchainType.polygonTestNet:
        return 'ERC-20';
      case BlockchainType.bscMainNet:
      case BlockchainType.bscTestNet:
        return 'BEP-20';
      case BlockchainType.solanaMainNet:
      case BlockchainType.solanaTestNet:
      case BlockchainType.solanaDevNet:
        return 'solana';
      case BlockchainType.okcMainNet:
      case BlockchainType.okcTestNet:
        return 'KIP-20';
      case BlockchainType.bitcoinMainNet:
      case BlockchainType.bitcoinTestNet:
        return 'BRC-20';
    }
  }

  String get pngImagePath {
    switch (this) {
      case BlockchainType.ethereumMainNet:
      case BlockchainType.ethereumRopstenTestNet:
      case BlockchainType.ethereumRinkebyTestNet:
      case BlockchainType.ethereumGoerliTestNet:
        return NetworkAsset.kEthereumLogo;
      case BlockchainType.bscMainNet:
      case BlockchainType.bscTestNet:
        return NetworkAsset.kBinanceLogo;
      case BlockchainType.solanaMainNet:
      case BlockchainType.solanaTestNet:
      case BlockchainType.solanaDevNet:
        return NetworkAsset.kSolanaLogo;
      case BlockchainType.okcMainNet:
      case BlockchainType.okcTestNet:
        return NetworkAsset.kOckLogo;
      case BlockchainType.polygonMainNet:
      case BlockchainType.polygonTestNet:
        return NetworkAsset.kPolygonLogo;
      case BlockchainType.neurochainMainNet:
        return NetworkAsset.kNeurochainLogo;
      case BlockchainType.bitcoinMainNet:
      case BlockchainType.bitcoinTestNet:
        return NetworkAsset.kBitcoinLogo;
    }
  }

  String get text {
    switch (this) {
      case BlockchainType.ethereumMainNet:
        return 'Ethereum';
      case BlockchainType.ethereumRopstenTestNet:
        return 'Ethereum Ropsten TestNet';
      case BlockchainType.ethereumRinkebyTestNet:
        return 'Ethereum Rinkeby TestNet';
      case BlockchainType.ethereumGoerliTestNet:
        return 'Ethereum Görli TestNet';
      case BlockchainType.bscMainNet:
        return 'BNB Chain';
      case BlockchainType.bscTestNet:
        return 'BNB TestNet';
      case BlockchainType.solanaMainNet:
        return 'Solana';
      case BlockchainType.solanaTestNet:
        return 'Solana TestNet';
      case BlockchainType.solanaDevNet:
        return 'Solana DevNet';
      case BlockchainType.okcMainNet:
        return 'OKC MainNet';
      case BlockchainType.okcTestNet:
        return 'OKC TestNet';
      case BlockchainType.polygonMainNet:
        return 'Polygon MainNet';
      case BlockchainType.polygonTestNet:
        return 'Polygon TestNet';
      case BlockchainType.neurochainMainNet:
        return 'NCN Mainnet';
      case BlockchainType.bitcoinMainNet:
        return 'Bitcoin MainNet';
      case BlockchainType.bitcoinTestNet:
        return 'Bitcoin TestNet';
    }
  }

  String get symbol {
    switch (this) {
      case BlockchainType.ethereumMainNet:
      case BlockchainType.ethereumRopstenTestNet:
      case BlockchainType.ethereumRinkebyTestNet:
      case BlockchainType.ethereumGoerliTestNet:
        return 'ETH';
      case BlockchainType.bscMainNet:
      case BlockchainType.bscTestNet:
        return 'BNB';
      case BlockchainType.solanaMainNet:
      case BlockchainType.solanaTestNet:
      case BlockchainType.solanaDevNet:
        return 'SOL';
      case BlockchainType.okcMainNet:
      case BlockchainType.okcTestNet:
        return 'OKC';
      case BlockchainType.polygonMainNet:
      case BlockchainType.polygonTestNet:
        return 'MATIC';
      case BlockchainType.neurochainMainNet:
        return 'NCC';
      case BlockchainType.bitcoinMainNet:
      case BlockchainType.bitcoinTestNet:
        return 'BTC';
    }
  }

  String get rpcUrl {
    switch (this) {
      case BlockchainType.ethereumMainNet:
        return dotenv.env['ETHEREUM_MAIN_NET_RPC_URL'] ?? '';
      case BlockchainType.ethereumRopstenTestNet:
        return dotenv.env['ETHEREUM_ROPSTEN_TEST_NET_RPC_URL'] ?? '';
      case BlockchainType.ethereumRinkebyTestNet:
        return dotenv.env['ETHEREUM_RINKEBY_TEST_NET_RPC_URL'] ?? '';
      case BlockchainType.ethereumGoerliTestNet:
        return dotenv.env['ETHEREUM_GOERLI_TEST_NET_RPC_URL'] ?? '';
      case BlockchainType.bscMainNet:
        return dotenv.env['BSC_MAIN_NET_RPC_URL'] ?? '';
      case BlockchainType.bscTestNet:
        return dotenv.env['BSC_TEST_NET_RPC_URL'] ?? '';
      case BlockchainType.solanaMainNet:
        return dotenv.env['SOLANA_MAIN_NET_RPC_URL'] ?? '';
      case BlockchainType.solanaTestNet:
        return dotenv.env['SOLANA_TEST_NET_RPC_URL'] ?? '';
      case BlockchainType.solanaDevNet:
        return dotenv.env['SOLANA_DEV_NET_RPC_URL'] ?? '';
      case BlockchainType.okcMainNet:
        return dotenv.env['OKC_MAIN_NET_RPC_URL'] ?? '';
      case BlockchainType.okcTestNet:
        return dotenv.env['OKC_TEST_NET_RPC_URL'] ?? '';
      case BlockchainType.polygonMainNet:
        return dotenv.env['POLYGON_MAIN_NET_RPC_URL'] ?? '';
      case BlockchainType.polygonTestNet:
        return dotenv.env['POLYGON_TEST_NET_RPC_URL'] ?? '';
      case BlockchainType.neurochainMainNet:
        return dotenv.env['NEUROCHAIN_MAIN_NET_RPC_URL'] ?? '';
      case BlockchainType.bitcoinMainNet:
        return dotenv.env['BITCOIN_MAIN_NET_RPC_URL'] ?? '';
      case BlockchainType.bitcoinTestNet:
        return dotenv.env['BITCOIN_TEST_NET_RPC_URL'] ?? '';
    }
  }

  String? get webSocketUrl {
    switch (this) {
      case BlockchainType.ethereumMainNet:
      case BlockchainType.ethereumRopstenTestNet:
      case BlockchainType.ethereumRinkebyTestNet:
      case BlockchainType.ethereumGoerliTestNet:
      case BlockchainType.bscMainNet:
      case BlockchainType.bscTestNet:
      case BlockchainType.okcMainNet:
      case BlockchainType.okcTestNet:
      case BlockchainType.polygonMainNet:
      case BlockchainType.polygonTestNet:
      case BlockchainType.neurochainMainNet:
      case BlockchainType.bitcoinMainNet:
      case BlockchainType.bitcoinTestNet:
        return null;
      case BlockchainType.solanaMainNet:
        return 'wss://rpc.ankr.com/solana/ws/65a5ae4ff82146b7cdc98d5d873510923d373b2dc0a24b3f1be3af77468216df';
      case BlockchainType.solanaTestNet:
        return 'wss://api.testnet.solana.com';
      case BlockchainType.solanaDevNet:
        return 'wss://damp-autumn-rain.solana-devnet.quiknode.pro/c49b6cfdb0890b52b29b0881c20b5d92f00de485';
    }
  }

  CryptoCurrency get networkCryptoCurrency {
    switch (this) {
      case BlockchainType.ethereumMainNet:
      case BlockchainType.ethereumRopstenTestNet:
      case BlockchainType.ethereumRinkebyTestNet:
      case BlockchainType.ethereumGoerliTestNet:
        return Currencies.etherEthereum(this);
      case BlockchainType.bscMainNet:
      case BlockchainType.bscTestNet:
        return Currencies.bnbBinanceSmartChain(this);
      case BlockchainType.solanaMainNet:
      case BlockchainType.solanaTestNet:
      case BlockchainType.solanaDevNet:
        return Currencies.solanaSolana(this);
      case BlockchainType.okcMainNet:
      case BlockchainType.okcTestNet:
        return Currencies.okcOKT(this);
      case BlockchainType.polygonMainNet:
      case BlockchainType.polygonTestNet:
        return Currencies.maticPolygon(this);
      case BlockchainType.neurochainMainNet:
        return Currencies.nccNeurochain(this);
      case BlockchainType.bitcoinMainNet:
      case BlockchainType.bitcoinTestNet:
        return Currencies.btcBitcoin(this);
    }
  }

  String get explorerName {
    switch (this) {
      case BlockchainType.ethereumMainNet:
      case BlockchainType.ethereumRopstenTestNet:
      case BlockchainType.ethereumRinkebyTestNet:
      case BlockchainType.ethereumGoerliTestNet:
        return 'Etherscan';
      case BlockchainType.bscMainNet:
      case BlockchainType.bscTestNet:
        return 'BscScan';
      case BlockchainType.solanaMainNet:
      case BlockchainType.solanaTestNet:
      case BlockchainType.solanaDevNet:
        return 'Solscan';
      case BlockchainType.okcMainNet:
      case BlockchainType.okcTestNet:
        return 'OKLink';
      case BlockchainType.polygonMainNet:
      case BlockchainType.polygonTestNet:
        return 'Polygonscan';
      case BlockchainType.neurochainMainNet:
        return 'Neuroscan';
      case BlockchainType.bitcoinMainNet:
      case BlockchainType.bitcoinTestNet:
        return 'Blockstream';
    }
  }

  String getExplorerUrl(CryptoExplorerType cryptoExplorerType, String value) {
    switch (this) {
      case BlockchainType.ethereumMainNet:
        const kMainUrl = 'https://etherscan.io';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/token/$value';
            break;
        }

        return formattedUrl;
      case BlockchainType.ethereumRopstenTestNet:
        const kMainUrl = 'https://ropsten.etherscan.io';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/token/$value';
            break;
        }

        return formattedUrl;
      case BlockchainType.ethereumRinkebyTestNet:
        const kMainUrl = 'https://rinkeby.etherscan.io';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/token/$value';
            break;
        }

        return formattedUrl;
      case BlockchainType.ethereumGoerliTestNet:
        const kMainUrl = 'https://goerli.etherscan.io';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/token/$value';
            break;
        }

        return formattedUrl;
      case BlockchainType.bscMainNet:
        const kMainUrl = 'https://bscscan.com';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/token/$value';
            break;
        }

        return formattedUrl;
      case BlockchainType.bscTestNet:
        const kMainUrl = 'https://testnet.bscscan.com';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/token/$value';
            break;
        }

        return formattedUrl;
      case BlockchainType.solanaMainNet:
        const kMainUrl = 'https://solscan.io';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
        }

        return formattedUrl;
      case BlockchainType.solanaTestNet:
        const kMainUrl = 'https://solscan.io';
        const kPostFix = '?cluster=testnet';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/address/$value$kPostFix';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value$kPostFix';
            break;
        }

        return formattedUrl;
      case BlockchainType.solanaDevNet:
        const kMainUrl = 'https://solscan.io';
        const kPostFix = '?cluster=devnet';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/address/$value$kPostFix';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value$kPostFix';
            break;
        }

        return formattedUrl;
      case BlockchainType.okcMainNet:
        const kMainUrl = 'https://www.oklink.com/en/okc';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/tokenAddr/$value';
            break;
        }

        return formattedUrl;
      case BlockchainType.okcTestNet:
        const kMainUrl = 'https://www.oklink.com/en/okc-test';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/tokenAddr/$value';
            break;
        }

        return formattedUrl;
      case BlockchainType.polygonMainNet:
        const kMainUrl = 'https://polygonscan.com';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/token/$value';
            break;
        }

        return formattedUrl;
      case BlockchainType.polygonTestNet:
        const kMainUrl = 'https://mumbai.polygonscan.com';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/token/$value';
            break;
        }

        return formattedUrl;

      case BlockchainType.neurochainMainNet:
        const kMainUrl = 'https://ncnscan.com';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/token/$value';
            break;
        }

        return formattedUrl;

      case BlockchainType.bitcoinMainNet:
        const kMainUrl = 'https://blockstream.info';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
        }

        return formattedUrl;

      case BlockchainType.bitcoinTestNet:
        const kMainUrl = 'https://blockstream.info/testnet';
        final String formattedUrl;
        switch (cryptoExplorerType) {
          case CryptoExplorerType.address:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.token:
            formattedUrl = '$kMainUrl/address/$value';
            break;
          case CryptoExplorerType.transaction:
            formattedUrl = '$kMainUrl/tx/$value';
            break;
        }

        return formattedUrl;
    }
  }

  bool get areNFTsSupported {
    switch (this) {
      case BlockchainType.ethereumMainNet:
      case BlockchainType.ethereumRopstenTestNet:
      case BlockchainType.ethereumRinkebyTestNet:
      case BlockchainType.ethereumGoerliTestNet:
      case BlockchainType.bscMainNet:
      case BlockchainType.bscTestNet:
      case BlockchainType.solanaMainNet:
      case BlockchainType.solanaTestNet:
      case BlockchainType.solanaDevNet:
      case BlockchainType.polygonMainNet:
      case BlockchainType.polygonTestNet:
      case BlockchainType.okcMainNet:
      case BlockchainType.okcTestNet:
        return true;
      case BlockchainType.neurochainMainNet:
      case BlockchainType.bitcoinMainNet:
      case BlockchainType.bitcoinTestNet:
        return false;
    }
  }

  bool get areTransactionsSupported {
    switch (this) {
      case BlockchainType.ethereumMainNet:
      case BlockchainType.ethereumRopstenTestNet:
      case BlockchainType.ethereumRinkebyTestNet:
      case BlockchainType.ethereumGoerliTestNet:
      case BlockchainType.bscMainNet:
      case BlockchainType.bscTestNet:
      case BlockchainType.solanaMainNet:
      case BlockchainType.solanaTestNet:
      case BlockchainType.solanaDevNet:
      case BlockchainType.polygonMainNet:
      case BlockchainType.polygonTestNet:
      case BlockchainType.okcMainNet:
      case BlockchainType.okcTestNet:
        return true;
      case BlockchainType.neurochainMainNet:
      case BlockchainType.bitcoinMainNet:
      case BlockchainType.bitcoinTestNet:
        return false;
    }
  }

  bool get isSupported {
    switch (this) {
      case BlockchainType.ethereumMainNet:
      case BlockchainType.bscMainNet:
      case BlockchainType.solanaMainNet:
      case BlockchainType.okcMainNet:
      case BlockchainType.polygonMainNet:
      case BlockchainType.neurochainMainNet:
        return true;
      case BlockchainType.ethereumRopstenTestNet:
      case BlockchainType.polygonTestNet:
      case BlockchainType.okcTestNet:
      case BlockchainType.ethereumRinkebyTestNet:
      case BlockchainType.solanaTestNet:
      case BlockchainType.bscTestNet:
      case BlockchainType.ethereumGoerliTestNet:
      case BlockchainType.solanaDevNet:
      case BlockchainType.bitcoinMainNet:
      case BlockchainType.bitcoinTestNet:
        return false;
    }
  }
}
