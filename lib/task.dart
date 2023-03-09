import 'dart:developer';
import 'package:dart_bip32_bip44/dart_bip32_bip44.dart';

import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:web3dart/web3dart.dart';
import 'dart:developer' as dev;
import 'package:hex/hex.dart';

//Abstract class implemetation
WalletAddress walletAddress = WalletAddress();
void createWallet() async {
  //generating seed phrase
  final mnemonic = walletAddress.generateMnemonic();
  dev.log(mnemonic.toString());
  Constants.seedPhrase = mnemonic;
  //creating new account with seed phrase
  createAccount(mnemonic, false);
}

class Constants {
  static String? seedPhrase;
}

//Creating an account. New account is created in 2 scenarios, 1. When user creates a new acount in existing wallet 2. When user imports a wallet
void createAccount(String mnemonic, bool importing) async {
  String seed = bip39.mnemonicToSeedHex(mnemonic);
  //Chain of wallet is created using seed
  Chain chain = Chain.seed(seed);
  ExtendedKey key;
  var accountsList = [];
  importing
      ? {
          key = chain.forPath("m/44'/60'/0'/0/0"),
          accountsList.clear()
        } //If importing, only first account from the above chain is obtained
      : key = chain.forPath(
          "m/44'/60'/0'/0/${accountsList.length}"); //else if creating new account in existing wallet, new account is added to list of accounts
  Credentials credentials = EthPrivateKey.fromHex(
      key.privateKeyHex()); //Getting credentials from private key
}

//Importin an existing wallet using seed phrase
void importWallet(String importSeed) async {
  String seed = bip39.mnemonicToSeedHex(importSeed);
  //Validating seed phrase
  if (bip39.validateMnemonic(seed)) {
    dev.log("true");
  } else {
    dev.log("false");
  }
  //Chain of wallet is created using seed
  Chain chain = Chain.seed(seed); //web3dart
  ExtendedKey key = chain.forPath("m/44'/60'/0'/0/0");
  //Getting credentials from private key
  Credentials credentials = EthPrivateKey.fromHex(key.privateKeyHex());
}

abstract class WalletAddressService {
  String generateMnemonic();
  Future<String> getPrivateKey(String mnemonic);
  Future<EthereumAddress> getPublicKey(String privateKey);
}

class WalletAddress implements WalletAddressService {
  @override
  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  @override
  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);
    return privateKey;
  }

  @override
  Future<EthereumAddress> getPublicKey(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = private.address;
    log('address: $address');
    return address;
  }
}

// Shamir Secret Share
SSS sss = new SSS();

class SSS {
  create(int a, int b, String c, bool d) {}
  combine(List<String> dj, bool f) {}
}

void generateShares() {
  String s = Constants.seedPhrase!;
  // creates a set of shares using seed phrase.
  List<String> arr = sss.create(2, 3, s, false);
  // Different number of shares can be created and combined to recover the seed phrase
  //In this case 2 out of 3 shares are required to recover the secret
  //Here FIrst and Second share is being combined to recover the seed phrase
  var s1 = sss.combine(arr.sublist(0, 2), false);
  //Validating the recovered seed phrase
  bip39.validateMnemonic(s1);
  //This seed can now be used to import the wallet/account
}
