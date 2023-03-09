import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

String? seed = Constants.seedPhrase;
String? seedRecover;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const Intro())));
            },
            child: Container(
              height: 50,
              width: 100,
              color: const Color(0xFF1A1A1A),
              child: const Center(
                child: Text(
                  'Logo',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFF2E943)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Hey Anonymous,let\'s get\nstarted'),
          ),
          const Text('Quickly connect, create or restore a wallet'),
          InkWell(
            onTap: () {
              createWallet();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const Progress())));
            },
            child: ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF313744),
                child: Icon(
                  Icons.add_circle_outlined,
                  size: 15,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )),
              title: const Text('Create new wallet'),
              subtitle: const Text(
                  'create your first obvious wallet\nwallet to make seamless\ntransaction'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const Restore())));
            },
            child: ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF313744),
                child: Icon(
                  Icons.add_circle_outlined,
                  size: 15,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.receipt,
                    size: 15,
                  )),
              title: const Text('Restore existing wallet'),
              subtitle: const Text(
                  'Import your existing wallet\nsecurely using seedphrase'),
            ),
          )
        ],
      ),
    );
  }
}

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 10), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => const Success())));
    });
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          Center(
            child: CircularProgressIndicator(
              color: Color(0xFF7FEABD),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(child: Text('Creating Wallet')),
        ],
      ),
    );
  }
}

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            size: 40,
          ),
          const Text('Wallet created successfully '),
          const ListTile(
            leading: CircleAvatar(),
            title: Text('Anonymous\'s Obvious Wallet '),
            subtitle: Text(''),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border:
                      Border.all(color: Color.fromARGB(255, 230, 226, 226))),
              child: const ListTile(
                title: Text('Setup wallet recovery'),
                subtitle:
                    Text('Backup your wallet now using\nSeedless Recovery'),
                trailing: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFF313744),
                  child: Icon(
                    Icons.lock_outlined,
                    size: 15,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const MyWidget())));
                },
                child: const Text(
                  'Setup recovery',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
          ),
          const Text('I\'ll do this later')
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFF313744),
              child: Icon(
                Icons.arrow_back,
                size: 15,
              ),
            ),
          ),
          const Text('Backup wallet'),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Backup()));
            },
            child: ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF313744),
                child: Icon(
                  Icons.wallet_sharp,
                  size: 15,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.receipt,
                    size: 15,
                  )),
              title: const Text('I will do this manually'),
              subtitle: const Text(
                  'Backup your wallet manually\n with a seed phrase'),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF313744),
                child: Icon(
                  Icons.shield,
                  size: 15,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.receipt,
                    size: 15,
                  )),
              title: const Text('Setup Seedless Recovery'),
              subtitle: const Text(
                  'Backup your wallet with\n highly  secure Seedless Recovery'),
            ),
          )
        ],
      ),
    );
  }
}

class Backup extends StatelessWidget {
  Backup({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const BackupPro())));
    });
    return Scaffold(
      body: Column(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF313744),
            child: Icon(
              Icons.arrow_back,
              size: 15,
            ),
          ),
          const Text('Backup wallet manually'),
          const Text(
              'copy and paste or write down your seed phrase and keep it\nin a safe place. Make sure you do not lose it!.'),
          Text(
            seed!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text('Make sure that nobody else is around '),
          const Text('screen'),
        ],
      ),
    );
  }
}

class BackupPro extends StatelessWidget {
  const BackupPro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF313744),
            child: Icon(
              Icons.arrow_back,
              size: 15,
            ),
          ),
          const Text('Backup wallet manually'),
          const Text(
              'copy and paste or write down your seed phrase and keep it\nin a safe place. Make sure you do not lose it!.'),
          Text(
            seed!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text('Make sure that nobody else is around '),
          InkWell(
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: seed));
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        actions: [Text('copied')],
                      ));
            },
            child: Row(
              children: const [
                CircleAvatar(
                  backgroundColor: Color(0xFF7DEABC),
                  child: Icon(Icons.copy),
                ),
                Text('Copy to clipboard')
              ],
            ),
          ),
          const Text('screen'),
        ],
      ),
    );
  }
}

class Restore extends StatelessWidget {
  const Restore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF313744),
            child: Icon(
              Icons.wallet_sharp,
              size: 15,
            ),
          ),
          const Text('Restore wallet manually'),
          const Text(
              'Restore your wallet using Seedless Recovery or\n manually'),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const Second())));
            },
            child: ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF313744),
                child: Icon(
                  Icons.shield,
                  size: 15,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.receipt,
                    size: 15,
                  )),
              title: const Text('Manual recovery'),
              subtitle: const Text(
                  'Restore your wallet manually\n with 12 phase seed phrase'),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF313744),
                child: Icon(
                  Icons.shield,
                  size: 15,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.receipt,
                    size: 15,
                  )),
              title: const Text(' Seedless Recovery'),
              subtitle: const Text(
                  'Restore the wallet backed up\n with Seedless Recovery'),
            ),
          )
        ],
      ),
    );
  }
}

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  String seedRecover = 'shhsu';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Restore existing wallet'),
          const Text(
              'Enter or paste your seedphrase below to import your existing\nwallet securely'),
          TextFormField(
            onChanged: (value) => {
              setState(() {
                seedRecover = value;
              })
            },
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextButton(
                  onPressed: () {
                    importWallet(seedRecover);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const RestoreProgress())));
                  },
                  child: const Text(
                    'Restore wallet',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RestoreProgress extends StatelessWidget {
  const RestoreProgress({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 10), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => const Success())));
    });
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          Center(
            child: CircularProgressIndicator(
              color: Color(0xFF7FEABD),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(child: Text('Restoring wallet')),
        ],
      ),
    );
  }
}

class RestoreSuccess extends StatelessWidget {
  const RestoreSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            size: 40,
          ),
          const Text('Wallet imported successfully '),
          const ListTile(
            leading: CircleAvatar(),
            title: Text('Anonymous\'s Obvious Wallet '),
            subtitle: Text('OxDB5...59ff'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border:
                      Border.all(color: Color.fromARGB(255, 230, 226, 226))),
              child: const ListTile(
                title: Text('Setup wallet recovery'),
                subtitle:
                    Text('Backup your wallet now using\nSeedless Recovery'),
                trailing: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFF313744),
                  child: Icon(
                    Icons.lock_outlined,
                    size: 15,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const MyWidget())));
                },
                child: const Text(
                  'Setup recovery',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
          ),
          const Text('I\'ll do this later')
        ],
      ),
    );
  }
}
