part of 'quote_bloc.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteInitial extends QuoteState {}

class QuoteLoadingState extends QuoteState {}

class QuoteLoadedState extends QuoteState {
  final Quote quote;

  const QuoteLoadedState({required this.quote});
}

class QuoteLoadingFailedState extends QuoteState {
  final String? message;

  const QuoteLoadingFailedState(this.message);
}
