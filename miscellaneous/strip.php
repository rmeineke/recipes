#!/usr/bin/php -q
<?php
require_once('require.php');

$files = get_file_list();

//backup_files($files);

$hdr = file_get_contents('../header.txt');
$ftr = file_get_contents('../footer.txt');

foreach($files as $file) {
    
    //skip the index file
    if ($file === 'index.html') {
        echo "==> Skipping $file <==\n";
        continue;
    }
    
	//dump file into array
	$strings = file($file);
	
    $body = '';
	//process individual lines
	foreach($strings as $line) {
		$line = strip($line);
        $body .= "$line\n";
	}
	
    $newfile = $hdr . $body . $ftr;
    file_put_contents($file, $newfile);
}
?>
