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
                 (create-accessor read-write))
)
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
		(default 70)
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
		(type INSTANCE)
		(allowed-classes Fecha)
		(create-accessor read-write))
	(multislot Aulas
		(type INSTANCE)
		(allowed-classes Aula)
		(cardinality 0 3)
		(create-accessor read-write))
;;**********************************************
;;	(single-slot Prueba
;;		(type INTEGER)
;;		(create-accessor read-write))
)
(defclass Fecha 
	(is-a USER)
	(role concrete)
	(single-slot Dia
		(type INSTANCE)
		(allowed-classes Dia)
		(create-accessor read-write))
	(single-slot Hora
		(type SYMBOL)
;+		(comment "M si ocupa medio dia, C si ocupa el dia completo")
		(allowed-symbols M C)
		(create-accessor read-write))
)
(defclass Dia
	(is-a USER)
	(role concrete)
	(single-slot Mes
		(type INTEGER)
		(allowed-values 1 6 7 9)
		(create-accessor read-write))
	(single-slot Ndia
		(type INTEGER)
		(range 0 31)
		(default 0)
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
		(default 100)
		(create-accessor read-write))
	(multislot Ocupada
		(type INSTANCE)
		(allowed-classes Fecha)
		(create-accessor read-write))
)
(definstances examenes
	([gradoii] of Grado
		(Nombre ii))
	([gradoim] of Grado
		(Nombre im))
	([SinFechaExamen] of FechaExamen
	);;	(Prueba 7))

	([AU01] of Aula
		(Numero 1)
		(Aforo 70))
	([AU02] of Aula
                (Numero 2)
                (Aforo 100))
	([AU03] of Aula
                (Numero 3)
                (Aforo 120))
        ([AU04] of Aula
                (Numero 4)
                (Aforo 100))
	([AU05] of Aula
                (Numero 5)
                (Aforo 70))
        ([AU06] of Aula
                (Numero 6)
                (Aforo 60))
        ([AU07] of Aula
                (Numero 7)
                (Aforo 120))
        ([AU08] of Aula
                (Numero 8)
                (Aforo 100))
	([AU09] of Aula
                (Numero 9)
                (Aforo 90))
        ([AU10] of Aula
                (Numero 10)
                (Aforo 100))
        ([AU11] of Aula
                (Numero 11)
                (Aforo 110))
        ([AU12] of Aula
                (Numero 12)
                (Aforo 150))
        ([AU13] of Aula
                (Numero 13)
                (Aforo 70))

	([AS01] of Asignatura
		(Plan ii)
		(Curso 1)
		(Cuatrimestre 1)
		(Matriculados 70)
		(NombreAsignatura Algebra))
	([AS02] of Asignatura
                (Plan ii)
                (Curso 1)
		(Cuatrimestre 1)
		(Matriculados 50)
                (NombreAsignatura Calculo))
	([AS03] of Asignatura
                (Plan ii)
                (Curso 1)
		(Cuatrimestre 1)
		(Matriculados 120)
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
	
;;Si no se ha inicializado el problema:
	(not (Inicializado))
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

	(bind ?c (find-all-instances ((?s Curso)) TRUE))
        (loop-for-count (?j 1 (length ?c))
                (do-for-all-instances((?ins Asignatura)) (and (eq ?ins:Curso (send (nth$ ?j ?c) get-Anyo)) (eq ?ins:Plan (send (nth$ ?j ?c) get-Plan))) (switch (send ?ins get-Cuatrimestre)
                        (case 1 then (slot-insert$ (nth$ ?j ?c) PrimerCuatrimestre 10 ?ins))
                        (case 2 then (slot-insert$ (nth$ ?j ?c) SegundoCuatrimestre 10 ?ins)))
                )
        )
	(do-for-all-instances((?ins Asignatura)) 
		(send ?ins put-Llamamiento1 [SinFechaExamen]) 
		(send ?ins put-Llamamiento2 [SinFechaExamen])
		(send ?ins put-Convocatoria1 [SinFechaExamen])
		(send ?ins put-Convocatoria2 [SinFechaExamen])
	)
;	(bind ?o (send [gradoii] get-Primero))
;	(printout t ?o crlf)
;	(bind ?n (send ?o get-PrimerCuatrimestre))
;	(printout t ?n crlf)
	(loop-for-count (?i 1 31) 
		(make-instance of Dia (Ndia ?i) (Mes 1))
		(make-instance of Dia (Ndia ?i) (Mes 6))
		(make-instance of Dia (Ndia ?i) (Mes 7))
		(make-instance of Dia (Ndia ?i) (Mes 9))
	)
	(assert (Inicializado))
)

(defrule Conv1C1L2 "Regla que coloca los examenes del primer llamamiento  de la primera convocatoria del primer cuatrimestre"


 	?x <- (object(is-a Asignatura) (Plan ?plan) (Curso ?curso) (Cuatrimestre 1) (Llamamiento1 ?l & : (eq ?l  [SinFechaExamen])))	
	?dia <- (object(is-a Dia) (Mes 1) (Ndia ?ndia))
	(test (<  ?ndia 19))
	(test (> ?ndia 8))
	(not
		(object (is-a Asignatura) (Plan ?plan) (Curso  ?curso) (Cuatrimestre 1) 
		(Llamamiento1 ?l2 &  
			: (and (neq(send ?l2 get-Fecha) [nil])
				(eq (send (send ?l2 get-Fecha) get-Dia) ?dia)))
		)
	)

;	 (test (neq (send (send ?l2 get-Fecha) get-Dia) ?dia))
 

;	(test (eq ?l [SinFechaExamen]))	;;;;;;;;FUNCIONA

;	(test (or (eq (send ?x get-Llamamiento1) [SinFechaExamen]) (eq (send ?x get-Llamamiento2) [SinFechaExamen]) ))

	=>
	
;	(printout t (eq (send [AS01] get-Llamamiento1) [SinFechaExamen])crlf)
	(printout t ?x crlf)
	(printout t (send ?x get-Llamamiento2) crlf)
)



