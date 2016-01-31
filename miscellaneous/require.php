<?php
function get_file_list() {
	return glob('*.html');
}

function backup_files($files) {
	foreach($files as $file) {
		echo "Backing up: $file\n";
		//copy(old, new)
		$new = $file . '.bak';
		copy($file, $new);
	}
}

function strip($line) {
	$line = strip_tags($line);
	$line = preg_replace('/_*/', '', $line);
    $line = str_replace('Ingredients:', 'Ingredients', $line);
    $line = str_replace('Directions:', 'Directions', $line);
	$line = str_replace('Ingredients', "<h2>Ingredients</h2>\n\n<ul>\n<li>", $line);
    $line = str_replace('Directions', "<h2>Directions</h2>\n\n<p>", $line);
    $line = str_replace('&nbsp;', '', $line);
    $line = trim($line);
	return $line;
}
?>
