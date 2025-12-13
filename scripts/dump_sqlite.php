<?php
if ($argc < 3) {
    echo "Usage: php dump_sqlite.php <input_db> <output_sql>\n";
    exit(1);
}
$input = $argv[1];
$output = $argv[2];
if (!file_exists($input)) {
    echo "Input DB not found: $input\n";
    exit(2);
}
try {
    $db = new PDO('sqlite:'.$input);
    $out = "PRAGMA foreign_keys=OFF;\nBEGIN TRANSACTION;\n";
    $tables = $db->query("SELECT name, sql FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';")->fetchAll(PDO::FETCH_ASSOC);
    foreach ($tables as $t) {
        if ($t['sql']) {
            $out .= $t['sql'] . ";\n\n";
        }
    }
    foreach ($tables as $t) {
        $table = $t['name'];
        $rows = $db->query("SELECT * FROM \"$table\"")->fetchAll(PDO::FETCH_ASSOC);
        foreach ($rows as $row) {
            $cols = array_map(function($c){ return '"'.str_replace('"','""',$c).'"'; }, array_keys($row));
            $vals = array_map(function($v){ if ($v===null) return 'NULL'; return "'".str_replace("'","''",$v)."'"; }, array_values($row));
            $out .= "INSERT INTO \"$table\" (".implode(',', $cols).") VALUES (".implode(',', $vals).");\n";
        }
        $out .= "\n";
    }
    $out .= "COMMIT;\n";
    file_put_contents($output, $out);
    echo "Dump written to: $output\n";
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
    exit(3);
}
