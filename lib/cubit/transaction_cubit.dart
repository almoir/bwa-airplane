import 'package:bwa_airplane/models/transaction_model.dart';
import 'package:bwa_airplane/services/transaction_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction);
      emit(TransactionSuccess(const []));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransaction() async {
    try {
      emit(TransactionLoading());

      List<TransactionModel> transactions =
          await TransactionService().fetchTransaction();
      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
