// Visualizar Nodos (Paso 14)
MATCH (n)
RETURN n;

// Consultar Estudiantes (Paso 15)
MATCH (e:Estudiante)
RETURN e.id, e.nombre, e.carrera, e.semestre;

// Consultar Materias (Paso 16)
MATCH (m:Materia)
RETURN m.id, m.nombre, m.area;

// Consultar Profesores (Paso 17)
MATCH (p:Profesor)
RETURN p.id, p.nombre, p.departamento;

// Consultar Relaciones de Inscripción (Paso 18)
MATCH (e:Estudiante)-[:INSCRITO_EN]->(m:Materia)
RETURN e.nombre AS estudiante, m.nombre AS materia;

// Consultar Relaciones de Impartición
MATCH (p:Profesor)-[:IMPARTE]->(m:Materia)
RETURN p.nombre AS profesor, m.nombre AS materia;