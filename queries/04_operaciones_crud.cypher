// 1. CREATE

CREATE (e:Estudiante {
  id: "101",
  nombre: "Carlos López",
  carrera: "Ingeniería en Sistemas",
  semestre: 3
});

MATCH (e:Estudiante {id: "101"})
MATCH (m:Materia {id: "MAT-101"})
CREATE (e)-[:INSCRITO_EN {
  calificacion: 95.5,
  periodo: "2025-1"
}]->(m);

// 2. READ

MATCH (e:Estudiante)
WHERE e.carrera CONTAINS "Sistemas"
RETURN e.nombre, e.carrera, e.semestre;

MATCH (e:Estudiante)-[i:INSCRITO_EN]->(m:Materia)
WHERE i.calificacion > 90
RETURN e.nombre AS estudiante, m.nombre AS materia, i.calificacion;

// 3. UPDATE

MATCH (e:Estudiante {id: "101"})
SET e.semestre = 4
RETURN e.nombre, e.semestre;

MATCH (e:Estudiante {id: "101"})-[i:INSCRITO_EN]->(m:Materia {id: "MAT-101"})
SET i.calificacion = 98.0
RETURN e.nombre, m.nombre, i.calificacion;

// DELETE

MATCH (e:Estudiante {id: "101"})-[i:INSCRITO_EN]->(m:Materia {id: "MAT-101"})
DELETE i;

MATCH (e:Estudiante {id: "101"})
DETACH DELETE e;