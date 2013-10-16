print "Enter the filename(make sure you don't forget to add the extension) \n";
$filename=<>;
chomp($filename);
open(f,$filename);
$i=0;
$ms=0;
$mp=0;
$maxs=0;
$maxp=0;
$prodsum=0;
$squaresum=0;
while(<f>)
{
	chomp;
	#print "$_\n";
	$_=~ m/([0-9]+)\s+([0-9]+)/;
	
	$sq[$i]=$2;
	$pr[$i]=$1;

	$i++;
	$ms+=$2;
	$mp+=$1;
	if($maxs<$2)
	{
		$maxs=$2;
	}
	if($maxp<$1)
	{
		$maxp=$1;
	}
	$prodsum+=$1*$2;
	$squaresum+=$2**2;
}
close(f);
$sumsqft=$ms;
$sumprice=$mp;
$ms/=$i;
$mp/=$i;
$n=$i;
print "\n\na. Mean sq ft=".$ms."\nMean price=".$mp."\n";
$devsums=0;
$devsump=0;
for($i=0;$i<$n;$i++)
{
	$devsums+=($sq[$i]-$ms)**2;
	$devsump+=($pr[$i]-$mp)**2;
}
$devs=($devsums/($n-1))**0.5;
$devp=($devsump/($n-1))**0.5;
print "\n\nDeviation for sq ft = ".$devs."\nDeviation for price=".$devp;
print "\n\nMax sq ft is ".$maxs."\nMax price is ".$maxp;
$w1=($prodsum*$n-$sumprice*$sumsqft)/($squaresum*$n-$sumsqft**2);
$w0=($sumprice-$w1*$sumsqft)/$n;

print "\n b. upon analytically computing, w0=$w0,w1=$w1";
for($i=0;$i<$n;$i++)
	{
		
		
		$loss+=($pr[$i]-($w0+$w1*$sq[$i]))**2;
		
	}
	print "\nLoss=".$loss;
$loss=$devsumsq;
$w1+=100;
$w0+=100;
$w1s=$w1;
$w0s=$w0;
$alpha=0.0000000001;
$lp=9999999999999999999;
$l2=0;

$ctr=0;
while ($lp!=$l2)
{
	if($ctr!=0)
	{
		$lp=$l2;
	}
	$devsum=0;
$devsum2=0;
$devsumsq=0;

	for($i=0;$i<$n;$i++)
	{
		
		$devsum+=($pr[$i]-($w0+$w1*$sq[$i]));
		$devsum2+=($pr[$i]-($w0+$w1*$sq[$i]))*$sq[$i];
		$devsumsq+=($pr[$i]-($w0+$w1*$sq[$i]))**2;
		#print "\n$devsum $devsum2 $devsumsq $pr[$i] $sq[$i]";
	}
	#print "\n $n devsum=$devsum.devsum2=$devsum2,devsumsq=$devsumsq";
$ctr++;
	$w0=$w0+$alpha*$devsum;
	$w1=$w1+$alpha*$devsum2;
	$l2=$devsumsq;
	
	
}
print "\n\nc. w0=$w0 w1=$w1 prev loss= $lp current loss=$l2 number of iterations to reach minimum =".($ctr-1)."\n\n";

print "Done with questions a,b and c. Proceeding to d. Moving on to stochastic gradient(press any key to continue)";
$progress=<>;
$ctr=0;
$lp=999999999999999;
$devsumsq=0;
$w1=$w1s;
$w0=$w0s;
$alpha=0.0000001;
$rctr=0;
while(true)
{
	
	if($ctr!=0)
	{
		$lp=$devsumsq;
	}
	$devsumsq=0;
	$i=rand($n);
	$devsum=($pr[$i]-($w0+$w1*$sq[$i]));
	$devsum2=($pr[$i]-($w0+$w1*$sq[$i]))*$sq[$i];
	for($i=0;$i<$n;$i++)
	{
		$devsumsq+=($pr[$i]-($w0+$w1*$sq[$i]))**2;
	}
	$w0=$w0+$alpha*$devsum;
	$w1=$w1+$alpha*$devsum2;
	$ctr++;
	print "\nprevious loss=$lp loss=$devsumsq alpha=$alpha iterations=$ctr\n";
	if($lp==$devsumsq)
	{
		print "\nYou have found the appropriate value of alpha.";
		print "\nloss=$devsumsq,w0=$w0,w1=$w1 iterations=$ctr iterations to actually reach the minimum is ".($ctr-1);
		last;
	}
	if($lp<$devsumsq)
	{
		print "cycle again(n to exit)?\n";
		$c= <>;
		chomp($c);
		if($c eq "n")
		{
			last;
		}
		$rctr++;
		if($rctr==5)
		{
			$alpha/=500;
			$rctr=0;
		}
	}
#	print "Change alpha?(y for yes)";
#	$c=<>;
#	chomp($c);
#	if($c eq "y")
#	{
#		$a=<>;
#		chomp($a);
#		$alpha=$a;
#		print $alpha;
#	}
		
			
	
	
	
}
		

