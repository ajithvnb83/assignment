import 'package:equatable/equatable.dart';

class PlanSelectionEntity extends Equatable {
  final int month;
  final int amount;
  final bool isRecommened;
  const PlanSelectionEntity(
      {required this.month, required this.amount, required this.isRecommened});

  @override
  List<Object?> get props => [];
}
