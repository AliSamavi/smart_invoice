import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/domain/entities/settings.dart';

abstract class SettingsRepository {
  Future<Either<Failure, Settings>> getSettings();
  Future<Either<Failure, void>> editSettings(Settings settings);
}
