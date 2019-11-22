#include <avr/io.h>
#include <util/delay.h>

#include "purescript.h"

FOREIGN_BEGIN(Main)

exports["blink"] = [](const boxed &n_) -> boxed {
  const auto n = unbox<int>(n_);

  return [=]() -> boxed {
    DDRB |= _BV(PB5); // PB5 (D13) is output

    for (int i = 0; i < n; i++)
    {
      PINB = _BV(PB5); // toggle PB5;
      _delay_ms(500);  // busy wait, blocking
      PINB = _BV(PB5); // toggle PB5;
      _delay_ms(500);  // busy wait, blocking
    }

    return boxed();
  };
};

FOREIGN_END