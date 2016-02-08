<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/reset.css"/>
<link rel="stylesheet" href="css/indexes.css"/>
<!--
<title><?php echo "ROBERT";?>Recipe File  &nbsp;  [December 31, 2015]</title>
-->
<title><?php $file = './updated.txt'; $str = 'Recipe File [' . date("F d, Y", filemtime($file)) . ']'; echo $str;?></title>


</head>


<body>
<div class="oneColumn">
<h1 class="center"><?php $file = './updated.txt'; $str = 'Recipe File [' . date("F d, Y", filemtime($file)) . ']'; echo $str;?></h1>
<ul class="mainPage">
<li><a href="./appetize/index.html">Appetizers, Salsa, &amp; Dips</a></li>
<li><a href="./bread/index.html">Breads</a></li>
<li><a href="./burgers/index.html">Burgers and Sandwiches</a></li>
<li><a href="./dessert/index.html">Desserts</a></li>
<li><a href="./drinks/index.html">Drinks</a></li>
<li><a href="./main_a-h/index.html">Main Dishes: A &rarr; H</a></li>
<li><a href="./main_i-q/index.html">Main Dishes: I &rarr; Q</a></li>
<li><a href="./main_r-z/index.html">Main Dishes: R &rarr; Z</a></li>
<li><a href="./salad/index.html">Salads &amp; Dressings</a></li>
<li><a href="./sauce/index.html">Sauces, Rubs, and Butters</a></li>
<li><a href="./side/index.html">Side Dishes</a></li>
<li><a href="./soup/index.html">Soups</a></li>
</ul>
<hr />
</div><!-- oneColumn -->


<p class="center footer">
Questions, corrections, and comments to: 
<a href="mailto:rmeineke@gmail.com">Robert Meineke</a>
</p>

<div class="oneColumn">
<hr />
<p>
There is an awful lot of copyrighted material contained in this repository.
If you like something here, please do not pass it off as your own.
</p>
</div>

</body>

</html>
