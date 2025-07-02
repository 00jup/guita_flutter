// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

class Complex {
  double real;
  double imag;

  Complex(this.real, this.imag);

  Complex operator +(Complex other) {
    return Complex(real + other.real, imag + other.imag);
  }

  Complex operator -(Complex other) {
    return Complex(real - other.real, imag - other.imag);
  }

  Complex operator *(Complex other) {
    return Complex(
      real * other.real - imag * other.imag,
      real * other.imag + imag * other.real,
    );
  }
}
