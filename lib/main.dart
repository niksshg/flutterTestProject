import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const CryptoTestApp());
}

class CryptoTestApp extends StatelessWidget {
  const CryptoTestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoTestApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        dividerColor: Colors.white24,
        scaffoldBackgroundColor: const Color.fromARGB(255, 52, 47, 47),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 52, 47, 47),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
        ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      routes: {
        '/': (context) => CryptoListView(),
        '/coin': (context) => CryptoCoinView(),
      },
    );
  }
}

class CryptoListView extends StatefulWidget {
  const CryptoListView({super.key});

  @override
  State<CryptoListView> createState() => _CryptoListViewState();
}

class _CryptoListViewState extends State<CryptoListView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Test App'),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          const coinName = 'Bitcoin';
          return ListTile(
            leading: SvgPicture.asset(
              'assets/svg/bitcoin-logo.svg',
              height: 30,
              width: 30,
            ),
            title: Text(
              coinName,
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text(
              '20000\$',
              style: theme.textTheme.labelSmall,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/coin',
                arguments: coinName,
              );
            },
          );
        },
      ),
    );
  }
}

class CryptoCoinView extends StatefulWidget {
  const CryptoCoinView({super.key});

  @override
  State<CryptoCoinView> createState() => _CryptoCoinViewState();
}

class _CryptoCoinViewState extends State<CryptoCoinView> {
  String? coinTitle;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String data');
    // if (args == null) {
    //   log('You must provide data');
    //   return;
    // }
    // if (args is! String) {
    //   log('You must provide String args');
    //   return;
    // }
    coinTitle = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinTitle ?? '...')),
    );
  }
}
