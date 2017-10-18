#!/bin/bash
set logscale y
set title "Residuals"
set ylabel 'Residual'
set xlabel 'Iteration'
plot "< cat log | grep 'Solving for p' | cut -d' ' -f9 | sed -n 'p;N;N' | tr -d ','" title 'p initial' with lines,\
"< cat log | grep 'Solving for p' | cut -d' ' -f13 | sed -n 'p;N;N' | tr -d ','" title 'p final' with lines,\
"< cat log | grep 'Solving for Ux' | cut -d' ' -f9 | tr -d ','" title 'Ux initial' with lines,\
"< cat log | grep 'Solving for Uy' | cut -d' ' -f9 | tr -d ','" title 'Uy initial' with lines,\
"< cat log | grep 'Solving for Uz' | cut -d' ' -f9 | tr -d ','" title 'Uz initial' with lines
#"< cat log | grep 'Solving for k' | cut -d' ' -f9 | tr -d ','" title 'k' with lines
pause 1
reread

# the code sed -n 'p;N;N' chooses which line of pressure correction to plot. The number of 'N' determines how many the ploting ignores. If 3 GAMG pressure solvers are employed, then 'p;N;N' will plot the FIRST GAMG, ignore the next two.

# -f9 determines which field to plot, counted after 'GAMG:', for example: "solving for p". e.g. GAMG: Solving for p, Initial residual = 0.193462, Final residual = 1.37372e-05, No Iterations 8. In this example the 9th field is 1.37372e-05.
