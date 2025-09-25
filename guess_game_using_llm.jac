import random;
import from byllm.llm {Model}

glob llm = Model(model_name ="gemini/gemini-2.0-flash", verbose = False);

def generate_feedback() -> str by llm();

node turn {
    has correct_number: int = random.randint(1, 10);
}

walker GuessGame {
    has guess: int;

    can start with `root entry {
        next = root ++> turn(random.randint(1, 10));
        visit next;
    }

    can process_guess with turn entry {
        if self.guess == here.correct_number {
            print({generate_feedback()});
        } else {
            print(generate_feedback());
        }
    }
}

with entry: __main__ {
    root spawn GuessGame(guess=2);
    root spawn GuessGame(guess=3);
    root spawn GuessGame(guess=4);
    root spawn GuessGame(guess=5);
    root spawn GuessGame(guess=6);
}