import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/domain/entities/settings.dart';
import 'package:smart_invoice/domain/repositories/settings_repository.dart';

class GetSettings {
  final SettingsRepository _repository;

  GetSettings(SettingsRepository repository) : _repository = repository;

  Future<Either<Failure, Settings>> call() async {
    return await _repository.getSettings();
  }
}
