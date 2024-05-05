import 'package:flutter/material.dart';

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
