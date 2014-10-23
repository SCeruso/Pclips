(defclass Grado "Clase para cada grado"
	(is-a USER)
	(role concrete)
	(single-slot Nombre 
		(type SYMBOL)
		(create-accessor read-write))
	(single-slot Primero
		(type INSTANCE)
		(allowed-classes Curso)
		(create-accessor read-write))
	(single-slot Segundo
                (type INSTANCE)
		(allowed-classes Curso)
                (create-accessor read-write))
	(single-slot Tercero
                (type INSTANCE)
		(allowed-classes Curso)                
                (create-accessor read-write))
	(single-slot Cuarto
                (type INSTANCE)
                (allowed-classes Curso)
                 (create-accessor read-write)))
;	(multislot Cursos
;		(type INSTANCE)
;		(allowed-classes Cusrso)
;		(create-accessor read-write)))i

(defclass Curso "Clase para almacenar las asignaturas de cada curso"
	(is-a USER)
	(role concrete)
	(single-slot Plan
		(type SYMBOL)
		(create-accessor read-write))
	(single-slot Anyo
		(type INTEGER)
		(create-accessor read-write))
	(multislot PrimerCuatrimestre
		(type INSTANCE)
		(allowed-classes Asignatura)
		(cardinality 0 5)
		(create-accessor read-write))
	(multislot SegundoCuatrimestre
		(type INSTANCE)
		(allowed-classes Asignatura)
		(cardinality 0 5)
		(create-accessor read-write))
)
(defclass Asignatura "Clase con informacion respecto cada asignatura"
	(is-a USER)
	(role concrete)
	(single-slot Cuatrimestre
		(type INTEGER)
		(create-accessor read-write))
	(single-slot Curso
		(type INTEGER)
		(create-accessor read-write))
	(single-slot Plan
		(type SYMBOL)
		(create-accessor read-write))
	(single-slot NombreAsignatura
		(type SYMBOL)
		(create-accessor read-write))
	(single-slot ExamenObligatorio
;+		(comment "Es obligatorio realizar examen presencial")
		(type SYMBOL)
		(allowed-symbols si no)
		(default si)
		(create-accessor read-write))
	(single-slot ExamenUnico
;+		(comment "Si el examen de los grupos de mañana y tarde es a la misma hora")
		(type SYMBOL)
                (allowed-symbols si no)
                (default no)
                (create-accessor read-write))
	(single-slot Matriculados
;+		(comment "Numero de alumnos matriculados")
		(type INTEGER)
		(default 100)
		(create-accessor read-write))
;+Los siguientes atributos dan la fecha y aula para cada convocatoria/llamamiento
	(single-slot Llamamiento1
		(type INSTANCE)
		(allowed-classes FechaExamen)
		(create-accessor read-write))
	(single-slot Llamamiento2
                (type INSTANCE)
                (allowed-classes FechaExamen)
                (create-accessor read-write))
	 (single-slot Convocatoria1
                (type INSTANCE)
                (allowed-classes FechaExamen)
                (create-accessor read-write))
	 (single-slot Convocatoria2
                (type INSTANCE)
                (allowed-classes FechaExamen)
                (create-accessor read-write))
)
(defclass FechaExamen
	(is-a USER)
	(role concrete)
	(single-slot Fecha
		(type INTEGER)
		(create-accessor read-write))
	(multislot Aulas
		(type INSTANCE)
		(allowed-classes Aula)
		(cardinality 0 3)
		(create-accessor read-write))
)
(defclass Aula
	(is-a USER)
	(role concrete)
	(single-slot Numero
		(type INTEGER)
		(create-accessor read-write))
	(single-slot Aforo
		(type INTEGER)
		(create-accessor read-write))
)
(definstances examenes
	([gradoii] of Grado
		(Nombre ii))
	([gradoim] of Grado
		(Nombre im))
	([AS01] of Asignatura
		(Plan ii)
		(Curso 1)
		(Cuatrimestre 1)
		(NombreAsignatura Algebra))
	([AS02] of Asignatura
                (Plan ii)
                (Curso 1)
		(Cuatrimestre 1)
                (NombreAsignatura Calculo))
	([AS03] of Asignatura
                (Plan ii)
                (Curso 1)
		(Cuatrimestre 1)
                (NombreAsignatura Fisica))
        ([AS04] of Asignatura
                (Plan ii)
                (Curso 1)
		(Cuatrimestre 1)
                (NombreAsignatura Empresas))
	([AS05] of Asignatura
                (Plan ii)
                (Curso 1)
                (Cuatrimestre 1)
                (NombreAsignatura Informatica_Basica))
	([AS06] of Asignatura
                (Plan ii)
                (Curso 1)
                (Cuatrimestre 2)
                (NombreAsignatura Principios_Computadores))
        ([AS07] of Asignatura
                (Plan ii)
                (Curso 1)
                (Cuatrimestre 2)
                (NombreAsignatura Optimizacion))
        ([AS08] of Asignatura
                (Plan ii)
                (Curso 1)
                (Cuatrimestre 2)
                (NombreAsignatura Sistemas_Electronicos))
        ([AS09] of Asignatura
                (Plan ii)
                (Curso 1)
                (Cuatrimestre 2)
                (NombreAsignatura Expresion_Grafica))
        ([AS10] of Asignatura
                (Plan ii)
                (Curso 1)
                (Cuatrimestre 2)
                (NombreAsignatura Algoritmos))
	([AS11] of Asignatura
                (Plan ii)
                (Curso 2)
                (Cuatrimestre 1)
                (NombreAsignatura Estadistica))
	([AS12] of Asignatura
                (Plan ii)
                (Curso 2)
                (Cuatrimestre 1)
                (NombreAsignatura Computabilidad))
	([AS13] of Asignatura
                (Plan ii)
                (Curso 2)
                (Cuatrimestre 1)
                (NombreAsignatura Sistemas_Operativos))
        ([AS14] of Asignatura
                (Plan ii)
                (Curso 2)
                (Cuatrimestre 1)
                (NombreAsignatura Ingles))
	([AS15] of Asignatura
                (Plan ii)
                (Curso 2)
                (Cuatrimestre 1)
                (NombreAsignatura Estructura_Computadores))
        ([AS16] of Asignatura
                (Plan ii)
                (Curso 2)
                (Cuatrimestre 2)
                (NombreAsignatura Redes))
	([AS17] of Asignatura
                (Plan ii)
                (Curso 2)
                (Cuatrimestre 2)
                (NombreAsignatura Administracion_Sistemas))
	([AS18] of Asignatura
                (Plan ii)
                (Curso 2)
                (Cuatrimestre 2)
                (NombreAsignatura Codigo_Deontologico))
        ([AS19] of Asignatura
                (Plan ii)
                (Curso 2)
                (Cuatrimestre 2)
                (NombreAsignatura Ingenieria_Software))
	([AS20] of Asignatura
                (Plan ii)
                (Curso 2)
                (Cuatrimestre 2)
                (NombreAsignatura Algoritmos_Avanzados))
        ([AS21] of Asignatura
                (Plan ii)
                (Curso 3)
                (Cuatrimestre 1)
                (NombreAsignatura Sistemas_Interaccion))
	([AS22] of Asignatura
                (Plan ii)
                (Curso 3)
                (Cuatrimestre 1)
                (NombreAsignatura Gestion_Proyectos))
	([AS23] of Asignatura
                (Plan ii)
                (Curso 3)
                (Cuatrimestre 1)
                (NombreAsignatura Lenguajes_Paradigmas))
        ([AS24] of Asignatura
                (Plan ii)
                (Curso 3)
                (Cuatrimestre 1)
                (NombreAsignatura Bases_Datos))
	([AS25] of Asignatura
                (Plan ii)
                (Curso 3)
                (Cuatrimestre 1)
                (NombreAsignatura Inteligencia_Artificial))
        ([AS26] of Asignatura
                (Plan ii)
                (Curso 3)
                (Cuatrimestre 2)
                (NombreAsignatura Inteligencia_Artificial_Avanzada ))
	([AS27] of Asignatura
                (Plan ii)
                (Curso 3)
                (Cuatrimestre 2)
                (NombreAsignatura Procesadores_Lenguajes))
	([AS28] of Asignatura
                (Plan ii)
                (Curso 3)
                (Cuatrimestre 2)
                (NombreAsignatura Desarrollo_Aplicaciones ))
        ([AS29] of Asignatura
                (Plan ii)
                (Curso 3)
                (Cuatrimestre 2)
                (NombreAsignatura Tratamiento_Inteligente_Datos))
	([AS30] of Asignatura
                (Plan ii)
                (Curso 3)
                (Cuatrimestre 2)
                (NombreAsignatura Analisis_Algoritmos ))
        ([AS31] of Asignatura
                (Plan ii)
                (Curso 4)
                (Cuatrimestre 1)
                (NombreAsignatura Sistemas_Inteligentes))
	([AS32] of Asignatura
                (Plan ii)
                (Curso 4)
                (Cuatrimestre 1)
                (NombreAsignatura Interfaces_Inteligentes))
	([AS33] of Asignatura
                (Plan ii)
                (Curso 4)
                (Cuatrimestre 1)
                (NombreAsignatura Complejidad_Computacional))
        ([AS34] of Asignatura
                (Plan ii)
                (Curso 4)
                (Cuatrimestre 1)
                (NombreAsignatura Robotica))
	([AS35] of Asignatura
                (Plan ii)
                (Curso 4)
                (Cuatrimestre 1)
                (NombreAsignatura Logistica))
        ([AS36] of Asignatura
                (Plan ii)
                (Curso 4)
                (Cuatrimestre 2)
                (NombreAsignatura Inteligencia_Emocional))
	([primeroii] of Curso
		(Plan ii)
		(Anyo 1))
	([segundoii] of Curso
		(Plan ii)
		(Anyo 2))
	([terceroii] of Curso
		(Plan ii)
		(Anyo 3))
	([cuartoii] of Curso
		(Plan ii)
		(Anyo 4))
)

(defrule ini
(declare (salience 20))
;	(bind ?c (find-all-instances ((?g Curso)) TRUE))
;	(bind ?b (find-all-instances ((?i Curso)) TRUE))
	=>	
	(bind ?g (find-all-instances ((?s Grado)) TRUE))
	(loop-for-count (?i 1 (length ?g))
		(do-for-all-instances((?ins Curso)) (eq ?ins:Plan (send (nth$ ?i ?g) get-Nombre)) (switch (send ?ins get-Anyo) 
			(case 1 then (send (nth$ ?i ?g) put-Primero ?ins))
			(case 2 then (send (nth$ ?i ?g) put-Segundo ?ins))
			(case 3 then (send (nth$ ?i ?g) put-Tercero ?ins))
                        (case 4 then (send (nth$ ?i ?g) put-Cuarto ?ins)))
		)	
	)
;;  	(bind ?x (find-instance ((?a Grado)) (eq ?a:Nombre ii)))		
;;	(bind ?y (send ?x get-Nombre))
;;	(printout t ?x crlf)
;;	(printout t  (send (nth 1 ?x) get-Primero) crlf)

	(bind ?c (find-all-instances ((?s Curso)) TRUE))
        (loop-for-count (?j 1 (length ?c))
                (do-for-all-instances((?ins Asignatura)) (and (eq ?ins:Curso (send (nth$ ?j ?c) get-Anyo)) (eq ?ins:Plan (send (nth$ ?j ?c) get-Plan))) (switch (send ?ins get-Cuatrimestre)
                        (case 1 then (slot-insert$ (nth$ ?j ?c) PrimerCuatrimestre 10 ?ins))
                        (case 2 then (slot-insert$ (nth$ ?j ?c) SegundoCuatrimestre 10 ?ins)))
                )
        )

;	(bind ?o (send [gradoii] get-Primero))
;	(printout t ?o crlf)
;	(bind ?n (send ?o get-PrimerCuatrimestre))
;	(printout t ?n crlf)
)
