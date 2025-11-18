.model small
.stack 100h
.data

m0 db "                ***Mini Calculator***$"
m1 db "For Addition, type       :'1'$"
m2 db "For Subtraction, type    :'2'$"
m3 db "For Multiplication, type :'3'$"
m4 db "For Division, type       :'4'$"
m5 db "Enter 2 Number for Addition: $"
m6 db "Enter 2 Number for Subtraction: $"
m7 db "Enter 2 Number for Multiplication: $"
m8 db "Enter 2 Number for Division: $"
m9 db "Choose an Option : $"
m10 db "Deciaml Result is       : $"
m11 db "                ***THANK YOU***$"
m12 db "Please Enter a Valid Option : $"
m13 db "Binary Result is: $"
m14 db "Hexadecimal Result is: $"
m15 db "       Reminder: $"
m16 db "For Another Calculation, type : '1'$"
m17 db "To EXIT, type                 : '2'$"
m18 db "Invalid input. $"

.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,m0
    mov ah,9
    int 21h
    
    start:
    
    call nl
    call nl
    
    lea dx,m1
    mov ah,9
    int 21h
    
    call nl
    
    lea dx,m2
    mov ah,9
    int 21h
    
    call nl
    
    lea dx,m3
    mov ah,9
    int 21h
    
    call nl
    
    lea dx,m4
    mov ah,9
    int 21h
    
    call nl
    call nl
    
    lea dx,m9
    mov ah,9
    int 21h
    
    calc:
    mov ah,1
    int 21h
    mov bl,al
    
    call nl
    call nl
    
    cmp bl,'1'
    je addd
    
    cmp bl,'2'
    je subb
    
    cmp bl,'3'
    je mull
    
    cmp bl,'4'
    je divv
    
    lea dx,m12
    mov ah,9
    int 21h
    
    jmp calc
    
    addd:
    lea dx,m5
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,2
    mov dl,'+'
    int 21h
    
    mov ah,1
    int 21h
    mov cl,al
    
    add bl,cl
    mov bh,bl
    sub bl,48
    cmp bl,'9'
    jg i
    
    call nl
    call nl
    
    call dr
    
    mov ah,2
    mov dl,bl
    int 21h
    
    call nl
    call hr
    
    call nl
    call br
    
    call nl
    call nl
    
    lea dx,m16
    mov ah,9
    int 21h
    call nl
    lea dx,m17
    mov ah,9
    int 21h
    call nl
    lea dx,m9
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,al
    cmp bl, '1'
    je start
    
    call nl
    call nl
    
    call tnx
    jmp exit
    
    subb:
    
    lea dx,m6
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,2
    mov  dl,'-'
    int 21h
    
    mov ah,1
    int 21h
    mov cl,al
    cmp bl,cl
    jl j
    
    sub bl,cl
    cmp bl,'9'
    jg j
    add bl,48
    
    call nl
    call nl
    call dr
    
    mov ah,2
    mov dl,bl
    int 21h
    
    call nl
    call hr
    
    call nl
    call br
    
    call nl
    call nl
    
    lea dx,m16
    mov ah,9
    int 21h
    call nl
    lea dx,m17
    mov ah,9
    int 21h
    call nl
    lea dx,m9
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,al
    cmp bl, '1'
    je start
    
    call nl
    call nl
    
    call tnx
    
    jmp exit
    
    mull:
    lea dx,m7
    mov ah,9
    int 21h
    
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    
    mov ah,1
    int 21h
    sub al,48
    mov cl,al
    mov ch,0
    
    mov ah,2
    mov dl,'*'
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov bl,al
    mov bh,0
    
    mov ax,cx
    
    mul bx
    mov cx,ax
    add cl,48
    cmp cl,'9'
    jg k
    
    call nl
    call nl
    call dr
    
    mov ah,2
    mov dl,cl
    int 21h
    mov bl,cl
    
    call nl
    call hr
    
    call nl
    call br
    
    call nl
    call nl
    
    lea dx,m16
    mov ah,9
    int 21h
    call nl
    lea dx,m17
    mov ah,9
    int 21h
    call nl
    lea dx,m9
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,al
    cmp bl,'1'
    je start
    
    call nl
    call nl
    
    call tnx
    jmp exit
    
    divv:
    lea dx,m8
    mov ah,9
    int 21h
    
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    
    mov ah,1
    int 21h
    sub al,48
    mov cl,al
    
    mov ah,2
    mov dl,'/'
    int 21h
    
    mov ah,1
    int 21h
    
    sub al,48
    cmp al,0
    je l
    mov bl,al
    
    cmp cl,bl
    jl l
    
    mov ax,cx
    
    div bl
    mov cx,ax
    add cl,48
    
    call nl
    call nl
    call dr
    
    mov ah,2
    mov dl,cl
    int 21h
    mov bl,cl
    
    lea dx,m15
    mov ah,9
    int 21h
    
    mov cl,ch
    
    add cl,48
    mov bh,cl
    mov ah,2
    mov dl,cl
    int 21h
    
    call nl
    call hr
    
    lea dx,m15
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,'3'
    int 21h
    mov dl,bh
    int 21h
    mov dl,'h'
    int 21h
    
    call nl
    call br
    
    lea dx,m15
    mov ah,9
    int 21h
    
    add bl,bh
    call br1
    
    call nl
    call nl
    
    lea dx,m16
    mov ah,9
    int 21h
    call nl
    lea dx,m17
    mov ah,9
    int 21h
    call nl
    lea dx,m9
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,al
    cmp bl,'1'
    je start
    
    call nl
    call nl
    
    call tnx
    
    jmp exit
    
    nl:
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    ret
    
    tnx:
    lea dx,m11
    mov ah,9
    int 21h
    ret
    
    dr:
    lea dx,m10
    mov ah,9
    int 21h
    ret
    
    br:
    lea dx,m13
    mov ah,9
    int 21h
    
    sub bl,48
    
    mov cx,8
    top:
    shl bl,1
    jc one
    
    mov ah,2
    mov dl,'0'
    int 21h
    
    loop top
    jmp next
    
    one:
    mov ah,2
    mov dl,'1'
    int 21h
    loop top
    
    next:
    ret
    
    hr:
    lea dx,m14
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,'3'
    int 21h
    mov dl,bl
    int 21h
    mov dl,'h'
    int 21h
    
    ret
    
    br1:
    sub bl,48
    mov cx,8
    top1:
    shl bl,1
    jc one1
    
    mov ah,2
    mov dl,'0'
    int 21h
    
    loop top1
    jmp next1
    
    one1:
    mov ah,2
    mov dl,'1'
    int 21h
    
    loop top1
    
    next1:
    
    ret
    
    i:
    call nl
    call nl
    
    lea dx,m18
    mov ah,9
    int 21h
    call nl
    
    jmp addd
    
    j:
    call nl
    call nl
    
    lea dx,m18
    mov ah,9
    int 21h
    call nl
    
    jmp subb
    
    k:
    call nl
    call nl
    
    lea dx,m18
    mov ah,9
    int 21h
    call nl
    
    jmp mull
    
    l:
    call nl
    call nl
    
    lea dx,m18
    mov ah,9
    int 21h
    call nl
    
    jmp divv
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main