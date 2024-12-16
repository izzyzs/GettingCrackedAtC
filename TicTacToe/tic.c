#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include <unistd.h>

const char USER = 'o';
const char COMPUTER = 'x';

enum WinType {
    NONE,
    ROW,
    COLUMN,
    DIAGONAL
};

typedef struct {
    char moves[3][3];
} Board;

typedef struct {
    char who_won;
    bool is_a_win;
    enum WinType how_won;
} Win;

Board make_default_board();
void print_board(Board);
void play_game(char, Board*);
int computer_pick();
void computer_move(Board*);
void user_move(Board*);
bool spot_left(Board*);
Win is_row_win(Board*);
Win is_column_win(Board*);
Win is_diagonal_win(Board*);
Win check_win(Board*);
void present_winner(Win);
char* how_won(enum WinType);

int main(void) {
    srand(time(NULL));
    Board b = make_default_board();
    print_board(b);
    printf("Would you like to go first? enter y for yes and any other key for no: >> ");
    char yes_or_no;
    scanf("%c", &yes_or_no);
    play_game(yes_or_no, &b);
    return 0;
}


Board make_default_board() {
    Board b = {{{'-', '-', '-'}, {'-', '-', '-'}, {'-', '-', '-'}}};
    return b;
}

void print_board(Board b) {
    
    printf("\t    1   2   3\n");
    printf("\t  -------------\n");
    printf("\t1 | %c | %c | %c |\n", b.moves[0][0], b.moves[0][1], b.moves[0][2]);
    printf("\t  ----|---|----\n");
    printf("\t2 | %c | %c | %c |\n", b.moves[1][0], b.moves[1][1], b.moves[1][2]);
    printf("\t  ----|---|----\n");
    printf("\t3 | %c | %c | %c |\n", b.moves[2][0], b.moves[2][1], b.moves[2][2]);
    printf("\t  -------------\n");
}

void play_game(char c, Board* board) {
    Win w;
    int user_first;
    int move_counter = 0;

    if (c == 'y') {
        user_first = 0;
    } else {
        user_first = 1;
    }

    while (spot_left(board)) {
        if (move_counter%2 == user_first) {
            user_move(board);
        } else {
            computer_move(board);
        }
        print_board(*board);
        w = check_win(board);
        if (w.is_a_win)
                break;
        move_counter++;
    }
    present_winner(w);
}

int computer_pick() {
    float pick_fl = (float)rand()/RAND_MAX;
    if (pick_fl > .66)
        return 2;
    else if (pick_fl > .33)
        return 1;
    else
        return 0;
}

void computer_move(Board *board) {
    printf("computer_move\n");
    for (int attempts = 9; attempts > 0; attempts--) {
        int row = computer_pick();
        int column = computer_pick();
        if (board->moves[row][column] == '-') {
            board->moves[row][column] = COMPUTER;
            printf("COMPUTER:\tx_move: %d;\ty_move: %d\n", row, column);
            return;
        } else {
            printf("I wanted to move be at (%d, %d) but that spot is taken... Trying again :(\n", row, column);
        }
    }
    printf("All spots are occupied\n");
}
void user_move(Board* board) {
    int row, column;
    printf("Your turn! You will pick your move by row and column\n");
    printf("Enter your row number >> ");
    scanf("%d", &row);
    printf("Enter your column number >> ");
    scanf("%d", &column);
    --row;
    --column;
    while (board->moves[row][column] != '-') {
        printf("That spot is taken\n");
        user_move(board);
    }
    board->moves[row][column] = USER;
}

bool spot_left(Board* board) {
    int i, j;
    bool final_val = false;
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            if (board->moves[i][j] == '-')
                return true;
        }
    }
    return false;
}


Win is_row_win(Board* board) {
    for (int i = 0; i < 3; i++) {
        if (board->moves[i][0] != '-' && board->moves[i][0] == board->moves[i][1] && board->moves[i][1] == board->moves[i][2]) {
            Win w = {board->moves[i][0], true, ROW};
            return w;
        }
    }
    Win w = {0};
    return w;
}
Win is_column_win(Board* board) {
    for (int i = 0; i < 3; i++) {
        if (board->moves[0][i] != '-' && board->moves[0][i] == board->moves[1][i] && board->moves[1][i] == board->moves[2][i]) {
            Win w = {board->moves[0][i], true, COLUMN};
            return w;
        }
    }
    Win w = {0};
    return w;   
}
Win is_diagonal_win(Board* board) {
    Win w;
    if (board->moves[0][0] != '-' && board->moves[0][0] == board->moves[1][1] && board->moves[1][1] == board->moves[2][2]) {
        w = (Win){board->moves[0][0], true, DIAGONAL};
        return w;
    } else if (board->moves[0][2] != '-' && board->moves[0][2] == board->moves[1][1] && board->moves[1][1] == board->moves[2][0]) {
        w = (Win){board->moves[0][2], true, DIAGONAL};
        return w;
    }
    w = (Win){0};
    return w;   
}

Win check_win(Board* board) {
    Win w;
    w = is_row_win(board);
    if (w.is_a_win) {
        return w;
    }
    w = is_column_win(board);
    if (w.is_a_win) {
        return w;
    }
    w = is_diagonal_win(board);
    if (w.is_a_win) {
        return w;
    }
    w = (Win){'\0', false, NONE};
    return w;
}

void present_winner(Win w) {
    printf("%s: %s won by by %s!!", (w.is_a_win ? "true": "false"), (w.who_won == 'x' ? "The computer" : (w.who_won ==  'o' ? "The user" : "error")), how_won(w.how_won));
}

char* how_won(enum WinType how) {
    if (how == ROW) {
        return "row";
    } else if (how == COLUMN) {
        return "column";
    } else {
        return "diagonal";
    }
    
}