INCLUDE Irvine32.inc

.data
new_line BYTE 13, 10, 0
game_over_message BYTE "GAME OVER", 13, 10, 0
game_start_message BYTE "TIC-TAC-TOE - By Uzair Ali, Malaika Niazi & Alishba Zafar", 13, 10, 0
player_message BYTE "PLAYER ", 0
win_message BYTE " WINS!", 13, 10, 0
tie_message BYTE "IT'S A TIE!", 13, 10, 0
type_message BYTE "ENTER POSITION (1-9), X=Exit, C=Restart: ", 0
invalid_input_msg BYTE "Invalid move! Try again.", 13, 10, 0
turn_counter_msg BYTE "Turn #: ", 0

player BYTE 'X', 0
win_flag BYTE 0
turn_counter DWORD 1
board BYTE '_','_','_','_','_','_','_','_','_', 0

.code
main PROC
    call Clrscr
main_loop:
    call Clrscr
    mov edx, OFFSET game_start_message
    call WriteString
    call Crlf
    mov edx, OFFSET turn_counter_msg
    call WriteString
    mov eax, turn_counter
    call WriteDec
    call Crlf
    mov edx, OFFSET player_message
    call WriteString
    movzx eax, player
    call WriteChar
    call Crlf
    call display_board
    call Crlf

get_input:
    mov edx, OFFSET type_message
    call WriteString
    call ReadChar

    cmp al, 'x'
    je exit_game
    cmp al, 'X'
    je exit_game
    cmp al, 'c'
    je clear_game
    cmp al, 'C'
    je clear_game

    sub al, '1'
    cmp al, 0
    jl invalid_input
    cmp al, 8
    jg invalid_input
    movzx ebx, al
    mov al, board[ebx]
    cmp al, 'X'
    je invalid_input
    cmp al, 'O'
    je invalid_input
    mov al, player
    mov board[ebx], al
    call check_win
    cmp win_flag, 1
    je game_over

    ; Check for tie (if no win and 9 turns complete)
    mov eax, turn_counter
    cmp eax, 9
    jne continue_game
    call Clrscr
    mov edx, OFFSET game_start_message
    call WriteString
    call Crlf
    call display_board
    call Crlf
    mov edx, OFFSET game_over_message
    call WriteString
    call Crlf
    mov edx, OFFSET tie_message
    call WriteString
    call Crlf
    exit

continue_game:
    call switch_player
    inc turn_counter
    jmp main_loop

invalid_input:
    mov edx, OFFSET invalid_input_msg
    call WriteString
    call WaitMsg
    jmp main_loop

exit_game:
    call Clrscr
    mov edx, OFFSET game_over_message
    call WriteString
    call Crlf
    exit

clear_game:
    ; Reset board and variables
    mov ecx, 9
    mov esi, OFFSET board
reset_loop:
    mov BYTE PTR [esi], '_'
    inc esi
    loop reset_loop

    mov turn_counter, 1
    mov player, 'X'
    mov win_flag, 0
    jmp main_loop

game_over:
    call Clrscr
    mov edx, OFFSET game_start_message
    call WriteString
    call Crlf
    call display_board
    call Crlf
    mov edx, OFFSET game_over_message
    call WriteString
    call Crlf
    mov edx, OFFSET player_message
    call WriteString
    movzx eax, player
    call WriteChar
    mov edx, OFFSET win_message
    call WriteString
    call Crlf
    exit
main ENDP

switch_player PROC
    cmp player, 'X'
    je switch_to_o
    mov player, 'X'
    ret
switch_to_o:
    mov player, 'O'
    ret
switch_player ENDP

display_board PROC
    mov ecx, 0
print_loop:
    mov al, board[ecx]
    call WriteChar
    cmp ecx, 2
    je print_newline
    cmp ecx, 5
    je print_newline
    mov al, '|'
    call WriteChar
    jmp continue_loop
print_newline:
    call Crlf
continue_loop:
    inc ecx
    cmp ecx, 9
    jl print_loop
    ret
display_board ENDP

check_win PROC
    mov al, 0
    call check3
    mov al, 3
    call check3
    mov al, 6
    call check3
    mov al, 0
    call check_col
    mov al, 1
    call check_col
    mov al, 2
    call check_col
    call check_diag1
    call check_diag2
    ret
check_win ENDP

check3 PROC
    push eax
    movzx ebx, al
    mov al, board[ebx]
    cmp al, '_'
    je skip_row
    cmp al, board[ebx+1]
    jne skip_row
    cmp al, board[ebx+2]
    jne skip_row
    mov win_flag, 1
skip_row:
    pop eax
    ret
check3 ENDP

check_col PROC
    push eax
    movzx ebx, al
    mov al, board[ebx]
    cmp al, '_'
    je skip_col
    add ebx, 3
    cmp al, board[ebx]
    jne skip_col
    add ebx, 3
    cmp al, board[ebx]
    jne skip_col
    mov win_flag, 1
skip_col:
    pop eax
    ret
check_col ENDP

check_diag1 PROC
    mov al, board[0]
    cmp al, '_'
    je skip_d1
    cmp al, board[4]
    jne skip_d1
    cmp al, board[8]
    jne skip_d1
    mov win_flag, 1
skip_d1:
    ret
check_diag1 ENDP

check_diag2 PROC
    mov al, board[2]
    cmp al, '_'
    je skip_d2
    cmp al, board[4]
    jne skip_d2
    cmp al, board[6]
    jne skip_d2
    mov win_flag, 1
skip_d2:
    ret
check_diag2 ENDP

END main
