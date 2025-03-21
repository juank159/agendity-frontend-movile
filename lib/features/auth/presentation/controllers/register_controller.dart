// lib/features/auth/presentation/controllers/register_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/usecases/register_usecase.dart';

class RegisterController extends GetxController {
  final RegisterUseCase registerUseCase;

  // Controllers de texto
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Estado de carga
  final isLoading = false.obs;

  RegisterController({required this.registerUseCase});

  @override
  void onClose() {
    nameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  bool validateInput() {
    if (nameController.text.isEmpty) {
      _showSnackbar(
        title: 'Error',
        message: 'Por favor, ingrese su nombre',
        color: Colors.yellow[800]!,
      );
      return false;
    }

    if (lastnameController.text.isEmpty) {
      _showSnackbar(
        title: 'Error',
        message: 'Por favor, ingrese sus apellidos',
        color: Colors.yellow[800]!,
      );
      return false;
    }

    if (phoneController.text.isEmpty) {
      _showSnackbar(
        title: 'Error',
        message: 'Por favor, ingrese un número de teléfono',
        color: Colors.yellow[800]!,
      );
      return false;
    }

    if (emailController.text.isEmpty || !emailController.text.isEmail) {
      _showSnackbar(
        title: 'Error',
        message: 'Por favor, ingrese un correo válido',
        color: Colors.yellow[800]!,
      );
      return false;
    }

    if (passwordController.text.isEmpty || passwordController.text.length < 6) {
      _showSnackbar(
        title: 'Error',
        message: 'La contraseña debe tener al menos 6 caracteres',
        color: Colors.red,
      );
      return false;
    }

    return true;
  }

  Future<void> registerUser() async {
    if (!validateInput()) return;

    isLoading.value = true;

    try {
      final result = await registerUseCase(
        name: nameController.text.trim(),
        lastname: lastnameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        password: passwordController.text,
      );

      result.fold(
        (failure) {
          _showSnackbar(
            title: 'Error',
            message: failure.message,
            color: Colors.red,
          );
        },
        (user) {
          // En lugar de ir a login, vamos a la pantalla de verificación
          final email = emailController.text.trim();
          clearInputs();
          Get.offAllNamed('/verify-email', arguments: {'email': email});
        },
      );
    } catch (e) {
      _showSnackbar(
        title: 'Error',
        message: e.toString(),
        color: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clearInputs() {
    nameController.clear();
    lastnameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void _showSnackbar({
    required String title,
    required String message,
    required Color color,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color.withOpacity(0.9),
      colorText: Colors.white,
      margin: const EdgeInsets.all(15),
      borderRadius: 8,
      duration: const Duration(seconds: 6),
      icon: Icon(
        color == Colors.green ? Icons.check_circle : Icons.error,
        color: Colors.white,
      ),
    );
  }
}
