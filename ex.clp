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
	(single-slot Aula
		(type INSTANCE)
		(allowed-classes Aula)
;		(cardinality 0 3)
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
		(allowed-symbols M T)
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
;;;;Definicion de mensajes para mostrar resultados

(defmessage-handler Dia print primary()
;;	(call-next-handler)
	(printout t ?self:Ndia)
	(printout t "/")
	(printout t ?self:Mes)
	(printout t "/2015" crlf) 
)

(defmessage-handler Fecha print primary()
;;      (call-next-handler)
	(printout t "Dia: ")
        (send ?self:Dia print)
        (printout t "Hora: ")
        (printout t ?self:Hora crlf)
)

(defmessage-handler FechaExamen print primary()
;;      (call-next-handler)
        (send ?self:Fecha print)
        (printout t "Aula: ")
        
	
;	(loop-for-count (?i 1 (length ?self:Aula))
;		(printout t (send (nth$ ?i ?self:Aula) get-Numero) " ")
;	)
	(if (neq ?self:Aula [nil]) then
		(printout t (send ?self:Aula get-Numero) " ")
	)
	(printout t crlf)
)
(defmessage-handler Asignatura print primary()
;;      (call-next-handler)
        (printout t ?self:NombreAsignatura crlf)
        (printout t "Curso: " ?self:Curso crlf)
        (printout t "Primer llamamiento: " crlf)

	(if (neq ?self:Llamamiento1 [SinFechaExamen]) then
        	(send ?self:Llamamiento1 print)
	else 
		(printout t ?self:Llamamiento1 crlf)
	)

	(printout t "Segundo llamamiento: " crlf)

	(if (neq ?self:Llamamiento2 [SinFechaExamen]) then
                (send ?self:Llamamiento2 print)
        else
                (printout t ?self:Llamamiento2 crlf)
        )

	(printout t "Segunda convocatoria: " crlf)

        (if (neq ?self:Convocatoria1 [SinFechaExamen]) then
                (send ?self:Convocatoria1 print)
        else
                (printout t ?self:Convocatoria1 crlf)
        )

        (printout t "Tercera convocatoria: " crlf)
        
	(if (neq ?self:Convocatoria2 [SinFechaExamen]) then
                (send ?self:Convocatoria2 print)
        else
                (printout t ?self:Convocatoria2 crlf)
        )
)


(defrule ini
(declare (salience 100))
	
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
	(loop-for-count (?i 1 31) 
		(make-instance of Dia (Ndia (- 31 ?i)) (Mes 1))
		(make-instance of Dia (Ndia (- 31 ?i)) (Mes 6))
		(make-instance of Dia (Ndia (- 31 ?i)) (Mes 7))
		(make-instance of Dia (Ndia (- 31 ?i)) (Mes 9))
	)
	(assert (Inicializado))
)

(defrule Conv1L11 "Regla que coloca los examenes del primer llamamiento  de la primera convocatoria de cada  cuatrimestre"
(declare (salience 90))

        ?x <- (object(is-a Asignatura) (Plan ?plan) (Curso ?curso) (Cuatrimestre ?Cuat) (Llamamiento1 ?l & : (eq ?l  [SinFechaExamen])))

        ?dia <- (object(is-a Dia) (Mes ?M &
                                        : (or (and (eq ?Cuat 1) (eq ?M 1))
                                              (and (eq ?Cuat 2) (eq ?M 6))
                                          )
                                   ) (Ndia ?ndia)
                )

        (test (>  ?ndia 8))
        (test (< ?ndia 19))
        (not
                (object (is-a Asignatura) (Plan ?plan) (Curso  ?) (Cuatrimestre ?)
                (Llamamiento1 ?l2 &
                        : (and (neq(send ?l2 get-Fecha) [nil])
                                (eq (send (send ?l2 get-Fecha) get-Dia) ?dia)))
                )
        )
        ?aula <- (object(is-a Aula) (Numero ?Numero) (Aforo ?af & : (>= ?af (send ?x get-Matriculados))))

        (not (object (is-a Asignatura) (Plan ?) (Curso ?) (Cuatrimestre ?Cuat)
                (Llamamiento1 ?l3 &
                        :  (and (eq ?aula (send ?l3 get-Aula)) (neq (send ?l3 get-Fecha) [nil]) (eq (send (send ?l3 get-Fecha) get-Dia) ?dia))

                )
             )
        )

        =>

        (bind ?fecha (make-instance of Fecha
                (Dia ?dia)
                (Hora C)
                )
        )
        (bind ?fechaexamen (make-instance of FechaExamen
                (Fecha ?fecha)
                (Aula ?aula))
        )
        (send ?x put-Llamamiento1 ?fechaexamen)
)




(defrule Conv1L12 "Regla que coloca los examenes del primer llamamiento  de la primera convocatoria de cada  cuatrimestre"
(declare (salience 88))

 	?x <- (object(is-a Asignatura) (Plan ?plan) (Curso ?curso) (Cuatrimestre ?Cuat) (Llamamiento1 ?l & : (eq ?l  [SinFechaExamen])))	
	
	?dia <- (object(is-a Dia) (Mes ?M &
                                        : (or (and (eq ?Cuat 1) (eq ?M 1))
                                              (and (eq ?Cuat 2) (eq ?M 6))
                                          )
                                   ) (Ndia ?ndia)
		)

	(test (>  ?ndia 8))
	(test (< ?ndia 19))
	(not
		(object (is-a Asignatura) (Plan ?plan) (Curso  ?curso) (Cuatrimestre ?Cuat) 
		(Llamamiento1 ?l2 &  
			: (and (neq(send ?l2 get-Fecha) [nil])
				(eq (send (send ?l2 get-Fecha) get-Dia) ?dia)))
		)
	)
	?aula <- (object(is-a Aula) (Numero ?Numero) (Aforo ?af & : (>= ?af (send ?x get-Matriculados))))	
 
	(not (object (is-a Asignatura) (Plan ?) (Curso ?) (Cuatrimestre ?Cuat)
		(Llamamiento1 ?l3 & 
			:  (and (eq ?aula (send ?l3 get-Aula)) (neq (send ?l3 get-Fecha) [nil]) (eq (send (send ?l3 get-Fecha) get-Dia) ?dia))
			  
		)
	     )
	)

	=>
	
	(bind ?fecha (make-instance of Fecha
		(Dia ?dia)
		(Hora C)
		)
	)
	(bind ?fechaexamen (make-instance of FechaExamen
		(Fecha ?fecha)
		(Aula ?aula))
	)
	(send ?x put-Llamamiento1 ?fechaexamen)
)

(defrule Conv1L2 "Regla que coloca los examenes del segundo llamamiento  de la primera convocatoria de cada cuatrimestre"
(declare (salience 80))

	?x <- (object(is-a Asignatura) (Plan ?plan) (Curso ?curso) (Cuatrimestre ?Cuat) (Llamamiento1 ?l0 & : (neq ?l0 [SinFechaExamen])) (Llamamiento2 ?l & : (eq ?l  [SinFechaExamen])))

	?dia <- (object(is-a Dia) (Mes ?M &
                                        : (or (and (eq ?Cuat 1) (eq ?M 1))
                                              (and (eq ?Cuat 2) (eq ?M 6))
                                       	  )
                                  ) (Ndia ?ndia)
		)
        (test (>  ?ndia 21))
        (test (< ?ndia 31))

;;;;Tiene que haber un minimo de 5 dias de diferencia entre llamamientos
	(test  (>= (- ?ndia (send (send (send ?l0 get-Fecha) get-Dia) get-Ndia)) 5))  

        (not
                (object (is-a Asignatura) (Plan ?plan) (Curso  ?curso) (Cuatrimestre ?Cuat)
                (Llamamiento2 ?l2 &
                        : (and (neq(send ?l2 get-Fecha) [nil])
                                (eq (send (send ?l2 get-Fecha) get-Dia) ?dia)))
                )
        )
        ?aula <- (object(is-a Aula) (Numero ?Numero) (Aforo ?af & : (>= ?af (send ?x get-Matriculados))))

        (not (object (is-a Asignatura) (Plan ?) (Curso ?) (Cuatrimestre ?Cuat)
                (Llamamiento2 ?l3 &
                        :  (and (eq ?aula (send ?l3 get-Aula)) (neq (send ?l3 get-Fecha) [nil]) (eq (send (send ?l3 get-Fecha) get-Dia) ?dia))

                )
             )
        )

        =>

        (bind ?fecha (make-instance of Fecha
                (Dia ?dia)
                (Hora C)
                )
        )
        (bind ?fechaexamen (make-instance of FechaExamen
                (Fecha ?fecha)
                (Aula ?aula))
        )
        (send ?x put-Llamamiento2 ?fechaexamen)
)


(defrule Conv2 "Regla que coloca los examenes de la segunda convocatoria de cada cuatrimestre"
(declare (salience 70))

        ?x <- (object(is-a Asignatura) (Plan ?plan) (Curso ?curso) (Cuatrimestre ?Cuat) 
			(Llamamiento1 ?l0 & : (neq ?l0 [SinFechaExamen])) 
			(Llamamiento2 ?l & : (neq ?l  [SinFechaExamen])) 
			(Convocatoria1 ?C1 & : (eq ?C1 [SinFechaExamen]))
	      )

        ?dia <- (object(is-a Dia) (Mes ?M &
                                        : (or (and (eq ?Cuat 1) (eq ?M 6))
                                              (and (eq ?Cuat 2) (eq ?M 7))
                                          )
                                  ) (Ndia ?ndia)
                )
        (test (>  ?ndia 9))
        (test (< ?ndia 31))


        (not
                (object (is-a Asignatura) (Plan ?plan) (Curso  ?curso) (Cuatrimestre ?Cuat) (Llamamiento1 ?) (Llamamiento2 ?)
                (Convocatoria1 ?l2 &
                        : (and (neq(send ?l2 get-Fecha) [nil])
                                (eq (send (send ?l2 get-Fecha) get-Dia) ?dia)))
                )
        )
        ?aula <- (object(is-a Aula) (Numero ?Numero) (Aforo ?af & : (>= ?af (send ?x get-Matriculados))))

        (not (object (is-a Asignatura) (Plan ?) (Curso ?) (Cuatrimestre ?) (Llamamiento1 ?) (Llamamiento2 ?)
                (Convocatoria1 ?l3 &
                        :  (and (eq ?aula (send ?l3 get-Aula)) (neq (send ?l3 get-Fecha) [nil]) (eq (send (send ?l3 get-Fecha) get-Dia) ?dia))

                )
             )
        )

        =>

        (bind ?fecha (make-instance of Fecha
                (Dia ?dia)
                (Hora C)
                )
        )
        (bind ?fechaexamen (make-instance of FechaExamen
                (Fecha ?fecha)
                (Aula ?aula))
        )
        (send ?x put-Convocatoria1 ?fechaexamen)
)



(defrule Conv3 "Regla que coloca los examenes de la tercera convocatoria de cada cuatrimestre"
(declare (salience 60))

        ?x <- (object(is-a Asignatura) (Plan ?plan) (Curso ?curso) (Cuatrimestre ?Cuat)
                        (Llamamiento1 ?l0 & : (neq ?l0 [SinFechaExamen]))
                        (Llamamiento2 ?l & : (neq ?l  [SinFechaExamen]))
                        (Convocatoria1 ?C1 & : (neq ?C1 [SinFechaExamen]))
			(Convocatoria2 ?C2 & : (eq ?C2 [SinFechaExamen]))
              )

        ?dia <- (object(is-a Dia) (Mes ?M &
                                        : (or (and (eq ?Cuat 1) (eq ?M 7))
                                              (and (eq ?Cuat 2) (eq ?M 9))
                                          )
                                  ) (Ndia ?ndia)
                )
        (test (>  ?ndia 9))
        (test (< ?ndia 31))


        (not
                (object (is-a Asignatura) (Plan ?plan) (Curso  ?curso) (Cuatrimestre ?Cuat) (Llamamiento1 ?) (Llamamiento2 ?) (Convocatoria1 ?)
                (Convocatoria2 ?l2 &
                        : (and (neq(send ?l2 get-Fecha) [nil])
                                (eq (send (send ?l2 get-Fecha) get-Dia) ?dia)))
                )
        )
        ?aula <- (object(is-a Aula) (Numero ?Numero) (Aforo ?af & : (>= ?af (send ?x get-Matriculados))))

        (not (object (is-a Asignatura) (Plan ?) (Curso ?) (Cuatrimestre ?) (Llamamiento1 ?) (Llamamiento2 ?) (Convocatoria1 ?)
                (Convocatoria2 ?l3 &
                        :  (and (eq ?aula (send ?l3 get-Aula)) (neq (send ?l3 get-Fecha) [nil]) (eq (send (send ?l3 get-Fecha) get-Dia) ?dia))

                )
             )
        )

        =>
 
        (bind ?fecha (make-instance of Fecha
                (Dia ?dia)
                (Hora C)
                )
        )
        (bind ?fechaexamen (make-instance of FechaExamen
                (Fecha ?fecha)
                (Aula ?aula))
        )
        (send ?x put-Convocatoria2 ?fechaexamen)
)


