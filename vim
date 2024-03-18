Comments

Put your cursor on the first # character, press CtrlV (or CtrlQ for gVim), and go down until the last commented line and press x, that will delete all the # characters vertically.

For commenting a block of text is almost the same:

First, go to the first line you want to comment, press CtrlV. This will put the editor in the VISUAL BLOCK mode.
Then using the arrow key and select until the last line
Now press ShiftI, which will put the editor in INSERT mode and then press #. This will add a hash to the first line.
Then press Esc (give it a second), and it will insert a # character on all other selected lines.
For the stripped-down version of vim shipped with debian/ubuntu by default, type : s/^/# in the third step instead (any remaining highlighting of the first character of each line can be removed with :nohl).

indentation
Vjjj>  # Выбрать 3 строки и добавить отступ
Vjjj<  # Выбрать 3 строки и уменьшить отступ

Comments
Нажмите Shift + V для входа в визуальный режим.
Выберите необходимые строки, используя клавиши со стрелками.
Нажмите : для открытия командной строки внизу экрана.
Введите norm I# для добавления символа комментария (# в данном случае) в начало каждой выбранной строки. Например, если нужно закомментировать выбранные строки с использованием #, введите:
:norm I#
