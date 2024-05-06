part of 'coins_list_bloc.dart';

class CoinsListState {}

class CoinsListInitial extends CoinsListState {}

class CoinsListIsLoading extends CoinsListState {}

class CoinsListIsLoaded extends CoinsListState {
  CoinsListIsLoaded({
    required this.coinsList,
  });
  final List<CryptoCoin> coinsList;
}

class CoinsListLoadingFailure extends CoinsListState {
  CoinsListLoadingFailure({
    required this.exception,
  });

  final Object? exception;
}
