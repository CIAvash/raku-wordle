#!/usr/bin/env raku

use Games::Wordle;

unit sub MAIN (Int $number?);

my Games::Wordle $wordle.=new: |do :$number with $number;

"Wordle $wordle.number()\nEnter your guess:".say;

until $wordle.result {
	with prompt '> ' -> $in {
		 with $wordle.guess($in) {
			.join.say
		}
		else {
			.exception.message.say
		}
	}
	else {
		''.say;
		exit;
	}
}

"\n$wordle.answer()\n\n$wordle.result()".say;
