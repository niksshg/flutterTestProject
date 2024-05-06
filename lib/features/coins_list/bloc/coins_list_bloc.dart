import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:some_project/repositories/crypto_coins/abstract_coins_repo.dart';

import '../../../repositories/crypto_coins/models/crypto_coins.dart';

part 'coins_list_event.dart';
part 'coins_list_state.dart';

class CoinsListBloc extends Bloc<CoinsListEvent, CoinsListState> {
  CoinsListBloc(this.coinsRepo) : super(CoinsListInitial()) {
    on<LoadCoinsList>((event, emit) async {
      try {
        final coinsList = await coinsRepo.getCoinsList();
        emit(CoinsListIsLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CoinsListLoadingFailure(exception: e));
      }
    });
  }

  final AbstractCoinsRepo coinsRepo;
}
