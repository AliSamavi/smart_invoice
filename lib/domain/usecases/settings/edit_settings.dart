import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/domain/entities/settings.dart';
import 'package:smart_invoice/domain/repositories/settings_repository.dart';

class EditSettings {
  final SettingsRepository _repository;

  EditSettings(SettingsRepository repository) : _repository = repository;

  Future<Either<Failure, void>> call(Settings settings) async {
    return await _repository.editSettings(settings);
  }
}
