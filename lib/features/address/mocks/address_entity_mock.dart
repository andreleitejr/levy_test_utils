import 'package:levy_shared_entities/entities.dart';
import 'package:mocktail/mocktail.dart';

final class AddressEntityMock extends Mock implements AddressEntity {
  @override
  String get name => 'Airport Rd';

  @override
  String get street => 'Airport Road';

  @override
  String get number => '123';

  @override
  String get city => 'Metropolis';

  @override
  String get state => 'NY';

  @override
  String get postalCode => '10001';

  @override
  String get country => 'USA';

  @override
  double get latitude => -23.5494011;

  @override
  double get longitude => -46.6571689;
}
