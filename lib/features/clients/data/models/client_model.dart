import 'package:login_signup/features/clients/domain/entities/client_entity.dart';

class ClientModel extends ClientEntity {
  ClientModel({
    String? id,
    required String name,
    required String lastname,
    required String email,
    required String phone,
    String? image,
    String? address,
    required String ownerId,
    bool isFromDevice = false,
    String? deviceContactId,
    DateTime? lastVisit,
    bool isActive = true,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? notes,
    DateTime? birthday,
    bool showNotes = false,
  }) : super(
          id: id,
          name: name,
          lastname: lastname,
          email: email,
          phone: phone,
          image: image,
          address: address,
          ownerId: ownerId,
          isFromDevice: isFromDevice,
          deviceContactId: deviceContactId,
          lastVisit: lastVisit,
          isActive: isActive,
          createdAt: createdAt,
          updatedAt: updatedAt,
          notes: notes,
          birthday: birthday,
          showNotes: showNotes,
        );

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      name: json['name'] ?? '',
      lastname: json['lastname'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'],
      address: json['address'],
      ownerId: json['ownerId'] ?? '',
      isFromDevice: json['isFromDevice'] ?? false,
      deviceContactId: json['deviceContactId'],
      lastVisit:
          json['lastVisit'] != null ? DateTime.parse(json['lastVisit']) : null,
      isActive: json['isActive'] ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      notes: json['notes'],
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      showNotes: json['showNotes'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name.trim(),
      'lastname': lastname.trim(),
      'email': email.trim(),
      'phone': phone.replaceAll(RegExp(r'[^\d+]'), ''),
      'image': image,
      'address': address?.trim(),
      'ownerId': ownerId,
      'isFromDevice': isFromDevice,
      'deviceContactId': deviceContactId,
      'isActive': isActive,
      'notes': notes?.trim(),
      'birthday': birthday?.toIso8601String(),
      'showNotes': showNotes,
    };
  }

  bool isValid() {
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d+]'), '');

    final isValidName = name.trim().isNotEmpty;
    final isValidPhone = cleanPhone.length >= 10;
    final isValidOwnerId = ownerId.trim().isNotEmpty;

    print('Validando cliente:');
    print('- Nombre: ${isValidName ? 'válido' : 'inválido'} ($name)');
    print('- Teléfono: ${isValidPhone ? 'válido' : 'inválido'} ($cleanPhone)');
    print('- OwnerId: ${isValidOwnerId ? 'válido' : 'inválido'} ($ownerId)');

    return isValidName && isValidPhone && isValidOwnerId;
  }

  ClientModel copyWithCleanData() {
    return ClientModel(
      id: id,
      name: name.trim(),
      lastname: lastname.trim(),
      email: email.trim(),
      phone: phone.replaceAll(RegExp(r'[^\d+]'), ''),
      image: image,
      address: address?.trim(),
      ownerId: ownerId.trim(),
      isFromDevice: isFromDevice,
      deviceContactId: deviceContactId,
      lastVisit: lastVisit,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      notes: notes?.trim(),
      birthday: birthday,
      showNotes: showNotes,
    );
  }

  @override
  String toString() {
    return 'ClientModel(id: $id, name: $name, lastname: $lastname, phone: $phone, email: $email)';
  }
}
