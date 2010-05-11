#include "ruby.h"

VALUE HandEval = Qnil;
void Init_handeval();

VALUE HandEval_hand_rank(VALUE self, int val);
VALUE HandEval_eval(VALUE self, int c1, int c2, int c3, int c4, int c5);

void Init_handeval() {
	HandEval = rb_define_module("HandEval");
  rb_define_singleton_method(HandEval, "hand_rank", HandEval_hand_rank, 1);
  rb_define_singleton_method(HandEval, "eval", HandEval_eval, 5);
}

VALUE HandEval_hand_rank(VALUE self, int val) {
  return INT2NUM(hand_rank(val));
}

VALUE HandEval_eval(VALUE self, int c1, int c2, int c3, int c4, int c5) {
  return INT2NUM(eval_5cards(c1 / 2, c2 / 2, c3 / 2, c4 / 2, c5 / 2));
}
