import 'dart:async';
import 'dart:io';

/// Muestra una animación de carga en la consola.
/// Devuelve una función que, al ser llamada, detiene la animación.

Function showLoadingAnimation({String text = 'Cargando'}) {
  final frames = ['|', '/', '-', r'\'];
  int frameIndex = 0;
  stdout.write('$text... ');

  final timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
    stdout.write('\r$text... ${frames[frameIndex]}');
    frameIndex = (frameIndex + 1) % frames.length;
  });

  // Devuelve una función para detener el temporizador y limpiar la línea.
  return () {
    timer.cancel();
    // Limpia la línea de la animación y mueve el cursor al inicio.
    stdout.write('\r' + ' ' * (text.length + 5) + '\r');
  };
}
