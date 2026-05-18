// Amigos Directos de Ana

MATCH (a:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(amigo:Estudiante)
RETURN amigo.nombre AS amigo;

// Materias que Cursan los Amigos de Ana

MATCH (a:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(amigo:Estudiante)
MATCH (amigo)-[:INSCRITO_EN]->(m:Materia)
RETURN DISTINCT amigo.nombre AS amigo, m.nombre AS materia;

// Profesores que Imparten Materias que Cursan los Amigos de Ana

MATCH (a:Estudiante {nombre: "Ana"})-[:AMIGO_DE]->(amigo:Estudiante)
MATCH (amigo)-[:INSCRITO_EN]->(m:Materia)
MATCH (p:Profesor)-[:IMPARTE]->(m)
RETURN DISTINCT amigo.nombre AS amigo, m.nombre AS materia, p.nombre AS profesor;

// Amigos de los Amigos de Ana

MATCH (a:Estudiante {nombre: "Ana"})-[:AMIGO_DE*1..2]-(conectado:Estudiante)
WHERE conectado.nombre <> "Ana"
RETURN DISTINCT conectado.nombre AS conectado;

// Estudiantes con Calificaciones Iguale o Mayores a 90

MATCH (e:Estudiante)-[i:INSCRITO_EN]->(m:Materia)
WHERE i.calificacion >= 90
RETURN e.nombre AS estudiante, m.nombre AS materia, i.calificacion AS calificacion
ORDER BY i.calificacion DESC;