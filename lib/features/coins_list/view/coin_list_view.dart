import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:some_project/features/coins_list/bloc/coins_list_bloc.dart';
import 'package:some_project/features/coins_list/widgets/widgets.dart';
import 'package:some_project/repositories/crypto_coins/crypto_coins.dart';

class CryptoListView extends StatefulWidget {
  const CryptoListView({super.key});

  @override
  State<CryptoListView> createState() => _CryptoListViewState();
}

class _CryptoListViewState extends State<CryptoListView> {
  List<CryptoCoin>? _cryptoCoinsList;

  final _coinsListBloc = CoinsListBloc(
    GetIt.I<AbstractCoinsRepo>(),
  );

  @override
  void initState() {
    _coinsListBloc.add(LoadCoinsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Test App'),
      ),
      body: BlocBuilder<CoinsListBloc, CoinsListState>(
        bloc: _coinsListBloc,
        builder: (context, state) {
          if (state is CoinsListIsLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: state.coinsList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = state.coinsList[i];
                return CryptoCoinTile(coin: coin);
              },
            );
          }
          if (state is CoinsListLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong',
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'Please try again later',
                    style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),

      // (_cryptoCoinsList == null)
      //     ? const Center(child: CircularProgressIndicator())
      //     : ListView.separated(
      //         padding: const EdgeInsets.only(top: 16),
      //         itemCount: _cryptoCoinsList!.length,
      //         separatorBuilder: (context, index) => const Divider(),
      //         itemBuilder: (context, i) {
      //           final coin = _cryptoCoinsList![i];
      //           return CryptoCoinTile(coin: coin);
      //         },
      //       ),
    );
  }
}
