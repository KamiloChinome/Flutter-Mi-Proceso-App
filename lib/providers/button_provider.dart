// Este código muestra una clase en Flutter llamada ButtonModel que implementa el mixin ChangeNotifier.
// Esto permite que la clase emita notificaciones cuando cambien sus valores y se puedan actualizar automáticamente
// los widgets que dependan de ellos.

// La clase ButtonModel tiene una propiedad llamada selectedButton que se puede leer y escribir.
// Cuando se escribe un nuevo valor en la propiedad, se emite una notificación para actualizar los widgets
// que dependen de ella.

// También se puede ver que la propiedad selectedButton es privada y se accede a ella a través de getters y setters.
// Esto permite que se controle el acceso a la propiedad y se valide el valor que se asigna a ella.
import 'package:flutter/material.dart';

class ButtonProvider with ChangeNotifier{
  int _selectedButton = 0;

  int get selectedButton => _selectedButton;
  set selectedButton(int i){
    _selectedButton = i;
    notifyListeners();
  }
}

