<?php
header('Content-Type: application/json');

$url = $_SERVER['REQUEST_URI'];
$parts = explode('/', $url);
$database_name = $parts[count($parts) - 2]; // Extraer el nombre de la base de datos de la URL
$table_name = explode('?', end($parts))[0]; // Nombre de la tabla

$servername = "localhost";
$username = "root";
$password = "";
$database = "dbdonantes_" . $database_name;

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    // Lógica para manejar solicitudes GET aquí
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if ($id === 'todos') {
        $sql = "SELECT * FROM `$table_name`";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $response = [];
            while ($row = $result->fetch_assoc()) {
                $response[] = $row;
            }
            echo json_encode(["operacion" => true, "registros" => count($response), "datos" => $response]);
        } else {
            echo json_encode(["operacion" => true, "registros" => 0, "datos" => []]);
        }
    } else {
        echo json_encode(["operacion" => false, "mensaje" => "Parámetro 'id' inválido"]);
    }
} elseif ($method === 'POST' && $table_name === 'detalles') {
    // Lógica para manejar solicitudes POST aquí
    $data = json_decode(file_get_contents('php://input'), true);
    if (!isset($data['data'])) {
        echo json_encode(["operacion" => false, "mensaje" => "Datos de entrada inválidos"]);
        exit;
    }
    
    $conn->autocommit(FALSE); // Iniciar transacción
    try {
        foreach ($data['data'] as $detalle) {
            $sql = "INSERT INTO detalles (codigo_donacion, id_punto, nombre_producto, codigo_producto, cantidad, kg_unitario, costo_unitario, fecha_publicacion) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssssidd", $detalle['codigo_donacion'], $detalle['id_punto'], $detalle['nombre_producto'], $detalle['codigo_producto'], $detalle['cantidad'], $detalle['kg_unitario'], $detalle['costo_unitario']);
            $stmt->execute();
        }
        
        // Aquí se debe implementar la lógica para actualizar la tabla 'encabezados' basada en los registros insertados
        // Esto es un ejemplo simplificado y debe ser ajustado según la lógica de negocio específica
        // Por ejemplo: calcular totales y obtener datos de la tabla 'puntos' para completar 'encabezados'
        
        $conn->commit(); // Commit de la transacción
        echo json_encode(["operacion" => true, "mensaje" => "Donaciones insertadas correctamente"]);
    } catch (Exception $e) {
        $conn->rollback(); // Revertir todos los cambios si algo sale mal
        echo json_encode(["operacion" => false, "mensaje" => "Error al insertar donaciones"]);
    }
} else {
    echo json_encode(["operacion" => false, "mensaje" => "Método no soportado"]);
}

$conn->close();
?>
