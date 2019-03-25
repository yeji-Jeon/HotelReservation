<?php

$mydata = filter_input(INPUT_POST, 'ids');
$dataarr = explode(",", $mydata);
$rand_keys = array_rand($dataarr, 3);
$resp = new stdClass();
$resp->rows = array();
for ( $i=0; $i< count($rand_keys); $i++ ) {
	//var_dump( $dataarr[$rand_keys[$i]]);
	$row = new stdClass();
	$row->RowId = $dataarr[$rand_keys[$i]];
	$row->Price = floatval(rand(1, 2000));
	$row->Quantity = rand(1,100);
	$resp->rows[] = $row;
}
echo json_encode($resp);