
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _maidenNameController = TextEditingController();
  String? _gender;
  bool _isMarried = false;
  bool _isFemale = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Имя',
                hintText: 'Введите ваше имя',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Введите свое Имя';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _surnameController,
              decoration: const InputDecoration(
                labelText: 'Фамилия',
                hintText: 'Введите вашу фамилию',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Введите свою Фамилию';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Возраст',
                hintText: 'Введите ваш возраст',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Введите свой Возраст';
                }
                int? age = int.tryParse(value);
                if (age == null || age < 18) {
                  return 'Вам должно быть не менее 18 лет';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Пол',
                hintText: 'Выберите ваш пол',
              ),
              value: _gender,
              items: ['Муж', 'Жен'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _gender = newValue;
                  _isFemale = newValue == 'Жен';
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Выберите ваш Пол';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Ваше место жительство',
                hintText: 'Введите ваше место жительство',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Ваше место работы',
                hintText: 'Введите ваше место работы',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Ваше образование',
                hintText: 'Введите ваше образование',
              ),
            ),
            DropdownButtonFormField<bool>(
              decoration: const InputDecoration(
                labelText: 'Ваше семейное положение',
                hintText: 'Выберите ваше семейное положение',
              ),
              value: _isMarried,
              items: [true, false].map((bool value) {
                return DropdownMenuItem<bool>(
                  value: value,
                  child: Text(value ? 'Женат/Замужем' : 'Холост'),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _isMarried = newValue ?? false;
                });
              },
            ),
            if (_isMarried && _isFemale)
              TextFormField(
                controller: _maidenNameController,
                decoration: const InputDecoration(
                  labelText: 'Девичья фамилия',
                  hintText: 'Введите вашу девичью фамилию',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите свою Девичью Фамилию';
                  }
                  return null;
                },
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Обработка данных')),
                  );
                }
              },
              child: const Text('Регистрация'),
            ),
          ],
        ),
      ),
    );
  }
}
