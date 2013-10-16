Run the program the following way
perl regr.pl

make sure you terminal buffer is large enough to store all output(if you desire that. I have included a pause in the program just before it starts printing a lot of stuff for
stochastic gradient so you can check my answers for 4 a,b and c.)

Enter the filename with the extension. the program will fail if you don't give the exact filename.

For a b and c there is nothing much to do, just record the results. the program will prompt you to continue on to stochastic gradient descent. then i am displaying the iteration count,
previous iteration loss, and current iteration loss. I display w1 and w0 once convergence is achieved.

You have an option to stop in the middle if the loss starts increasing. every time it increases, I increment a counter. once the counter reaches 5 i divide alpha by 150. 
I managed to get convergence at loss=1377619515446.54 after only 59 iterations. since i randomly choose a data point, the results may vary from execution to execution. sometimes the 
loss converges at a higher value after more iterations.if you want to keep looping without changing anything just keep your finger on enter.

if one can correctly manipulate alpha and record an optimum training set of points for the data, convergence at a ow loss after much fewer iterations than batch descent
can be achieved.
