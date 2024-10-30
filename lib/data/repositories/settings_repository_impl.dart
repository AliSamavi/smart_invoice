import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/data/models/settings/settings_model.dart';
import 'package:smart_invoice/data/sources/locals/settings_local.dart';
import 'package:smart_invoice/domain/entities/settings.dart';
import 'package:smart_invoice/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocal _local;

  SettingsRepositoryImpl(SettingsLocal local) : _local = local;

  @override
  Future<Either<Failure, Settings>> getSettings() async {
    try {
      final settings = await _local.getSettings();

      if (settings == null) {
        return Right(Settings());
      }
      return Right(Settings(
        name: settings.name,
        province: settings.province,
        city: settings.city,
        address: settings.address,
        phoneNum: settings.phoneNum,
        postalCode: settings.postalCode,
        economicNum: settings.economicNum,
      ));
    } catch (e) {
      return Left(DatabaseFailure("Failed to load settings"));
    }
  }

  @override
  Future<Either<Failure, void>> editSettings(Settings settings) async {
    try {
      await _local.editSettings(SettingsModel(
        name: settings.name,
        province: settings.province,
        city: settings.city,
        address: settings.address,
        phoneNum: settings.phoneNum,
        postalCode: settings.postalCode,
        economicNum: settings.economicNum,
      ));
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Failed to edit settings"));
    }
  }
}
