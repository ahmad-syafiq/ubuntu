<?php date_default_timezone_set('Asia/Jakarta');

function pr($text='', $return = false)
{
	$is_multiple = (func_num_args() > 2) ? true : false;
	if(!$is_multiple)
	{
		if(is_numeric($return))
		{
			if($return==1 || $return==0)
			{
				$return = $return ? true : false;
			}else $is_multiple = true;
		}
		if(!is_bool($return)) $is_multiple = true;
	}
	if($is_multiple)
	{
		echo "<pre>\n";
		echo "<b>1 : </b>";
		print_r($text);
		$i = func_num_args();
		if($i > 1)
		{
			$j = array();
			$k = 1;
			for($l=1;$l < $i;$l++)
			{
				$k++;
				echo "\n<b>$k : </b>";
				print_r(func_get_arg($l));
			}
		}
		echo "\n</pre>";
	}else{
		if($return)
		{
			ob_start();
		}
		echo "<pre>\n";
		print_r($text);
		echo "\n</pre>";
		if($return)
		{
			$output = ob_get_contents();
			ob_end_clean();
			return $output;
		}
	}
}
function iLog($text, $is_print = false, $is_html = true)
{
	$debug = debug_backtrace();
	$file  = $debug[0]['file'];
	$line  = $debug[0]['line'];
	if (defined('_MST'))
	{
		$r = explode('|', _MST);
		foreach ($r as $p)
		{
			$p = trim($p);
			if (!empty($p))
			{
				$file = preg_replace('~^'.preg_quote($p, '~').'~s', '', $file);
			}
		}
		$file = preg_replace('~^'.preg_quote(_ROOT, '~').'~s', '', $file);
	}
	$f = !empty($debug[0]) ? $file.':'.$line : '';
	if ($is_print)
	{
		if ($is_html)
		{
			pr($text, $f);
		}else{
			print_r($text);
			echo "\n".$f."\n";
		}
	}else{
		file_put_contents('/home/x/Desktop/ilog.txt', date('Y-m-d H:i:s: ').$f."\n".print_r($text, 1)."\n\n", FILE_APPEND);
	}
}