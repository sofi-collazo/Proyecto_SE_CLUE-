extends Node2D

var objetos = ["Soga","Hacha","Tijeras","Martillo","Bate"]
var personajes = ["Celeste","Blanco","Pardo","Amapola","Mora"]
var lugar = ["Cocina","Sala", "Dormitorio", "Jardin","Sotano"]
var Historia = -1
var rng = RandomNumberGenerator.new()
var intento = 0
#----------------------------- CASO 1 ------------------------
#----------------------------- ARMA -------------------------
var conversacion1OBJ = [
	"Se ha encontrado el objeto Soga en la sala",
	"Se ha encontrado el objeto Hacha en el jardin", 
	"Se ha encontrado el objeto Tijeras en la cocina ", 
	"Se ha encontrado el objeto Martillo en el sonato",
	"Se ha encontrado el objero Bate en el dormitorio"]
#-------------------------- PERSONA -----------------------
var conversacion1PER = [
	"Celeste ha mencionado que estaba en la sala",
	"Blanco ha mencionado haber estado en el jardin",
	"Pardo ha mencionado haber estado en el sotano", 
	"Mora ha mencionado haber estado en el dormitorio", 
	"Amapola ha mencionado haber estado en la cocina"]
# ------------------------ LUGAR ----------------------------
var conversacion1LUG = [
	"Se ha encontrado el objeto tijeras, se ha visto a Amapola en el lugar", 
	"Se ha encontrado el objeto soga, no se encontraron personas en el lugar ", 
	"Se ha encontrado el objeto bate, se ha visto a Mora en el lugar",
	"Se ha encontrado el objeto Hacha, no se encontraron personas en el lugar",  
	"Se ha encontrado el objeto Martillo, se ha visto a Pardo en el lugar"]
var correcta1 = [1,3,1]
#------------------- CASO 2------------------------------------
var conversacion2OBJ = [
	"Se ha encontrado el objeto Soga en el sotano",
	"Se ha encontrado el objeto Hacha en la sala", 
	"Se ha encontrado el objeto Tijeras en el dormitorio ", 
	"Se ha encontrado el objeto Martillo en el jardin ",
	"Se ha encontrado el objero Bate en la cocina"]
var conversacion2PER = [
	"Celeste ha mencionado que estaba en el dormitorio",
	"Blanco ha mencionado haber estado en el sonano",
	"Pardo ha mencionado haber estado en la cocina", 
	"Mora ha mencionado haber estado en el jardin ", 
	"Amapola ha mencionado haber estado en la sala"]
var conversacion2LUG =  [
	"Se ha encontrado el objeto bate, se ha visto a Pardo en el lugar", 
	"Se ha encontrado el objeto Hacha, se ha visto a Amapola en el lugar ", 
	"Se ha encontrado el objeto tijeras, no se encontraron personas en el lugar",
	"Se ha encontrado el objeto martillo, se ha visto a Mora en el lugar",  
	"Se ha encontrado el objeto soga, se ha visto Blanco en el lugar"]
var correcta2 = [2,0,2]
#--------------------------- CASO 3-------------------------------
var conversacion3OBJ = [
	"Se ha encontrado el objeto Soga en el dormitorio",
	"Se ha encontrado el objeto Hacha en la sala", 
	"Se ha encontrado el objeto Tijeras en el jardin ", 
	"Se ha encontrado el objeto Martillo en el sotano",
	"No se ha encontrado el objero Bate en la cocina"]
	
var conversacion3PER = [
	"Celeste ha mencionado que estaba en el jardin",
	"Blanco ha mencionado haber estado en la sala",
	"Pardo ha mencionado haber estado en la cocina", 
	"Mora ha mencionado haber estado en el sotano", 
	"Amapola ha mencionado haber estado en el dormitorio"]
var conversacion3LUG =  [
	"No se ha encontrado el objeto bate, se ha visto a Pardo en el lugar", 
	"Se ha encontrado el objeto Hacha, se ha visto a blanco en el lugar ", 
	"Se ha encontrado el objeto soga, se ha visto a Amapola en el lugar",
	"Se ha encontrado el objeto tijeras, no se encontraron personas en el lugar",  
	"Se ha encontrado el objeto Martillo, se ha visto a Mora en el lugar "]
var correcta3 = [4,2,0]
#------------------------- CASO 4---------------------------------
var conversacion4OBJ = [
	"Se ha encontrado el objeto Soga en el dormitorio",
	"Se ha encontrado el objeto Hacha en la cocina", 
	"Se ha encontrado el objeto Tijeras en la sala", 
	"Se ha encontrado el objeto Martillo en en el sotano",
	"Se ha encontrado el objero Bate el jardin"]
var conversacion4PER = [
	"Celeste ha mencionado que estaba en el jardin",
	"Blanco ha mencionado haber estado en la cocina ",
	"Pardo ha mencionado haber estado en la sala", 
	"Mora ha mencionado haber estado en el dormitorio", 
	"Amapola ha mencionado haber estado en el sotano"]
var conversacion4LUG =  [
	"Se ha encontrado el objeto Hacha, se ha Blanco visto a  en el lugar", 
	"Se ha encontrado el objeto tijeras, se ha visto a pardo en el lugar ", 
	"Se ha encontrado el objeto soga, se ha visto a Mora en el lugar",
	"Se ha encontrado el objeto bate, se ha visto a Celeste en el lugar",  
	"Se ha encontrado el objeto Martillo, no se ha visto a Amapola en el lugar"]
var correcta4 = [3,4,4]
#-------------------------- CASO 5---------------------------------
var conversacion5OBJ = [
	"Se ha encontrado el objeto Soga en la sala, son un ligero rastro de sangre",
	"Se ha encontrado el objeto Hacha en el jardin", 
	"Se ha encontrado el objeto Tijeras el dormitorio ", 
	"Se ha encontrado el objeto Martillo en el sotano",
	"Se ha encontrado el objero Bate en en la cocina"]
var conversacion5PER = [
	"Celeste ha mencionado que estaba en la cocina",
	"Blanco ha mencionado haber estado en el dormitorio",
	"Pardo ha mencionado haber estado en el jardin", 
	"Mora ha mencionado haber estado en la sala", 
	"Amapola ha mencionado haber estado en el sotano"]
var conversacion5LUG =  [
	"Se ha encontrado el objeto bate, se ha visto a Celeste en el lugar",  # cocina
	"Se ha encontrado el objeto soga, no se encontraron personas en el lugar ", # sala
	"Se ha encontrado el objeto tijeras, se ha visto a Blanco en el lugar", # Dormi
	"Se ha encontrado el objeto Hacha, se ha visto a Pardo en el lugar",   # jardin
	"Se ha encontrado el objeto martillo, se ha visto a Amapola en el lugar"]
var correcta5 = [0,4,1]

#------------------------------------ SELECCION -----------------------------
var conversacionSOBJ = []
var conversacionSPER = []
var conversacionSLUG = []

var button = Button.new()
var opc1=-1
var opc2=-1
var opc3=-1

func validar():
	var text =""
	var l = Label.new()
	var la = Label.new()
	var lo = Label.new()
	if(Historia==1):
		if(opc1==correcta1[0]):
			la.text = "Arma Correcta"
			print("Arma Correcta")
			text="Arma Correcta"
			add_child(l)
		else:
			la.text = "Arma Incorrecta"
			print("Arma Incorrecta")
			text="Arma Incorrecta"
			add_child(l)
		if(opc2==correcta1[1]):
			lo.text = "Persona Correcta"
			add_child(l)
			print("Personaje Correcto")
		else:
			lo.text = "Persona Incorrecta"
			add_child(l)
			print("Personaje Incorrecto")
		if(opc3==correcta1[2]):
			l.text = " Correcta"
			add_child(l)
			print("Lugar Correcto")
		else:
			print("Lugar Incorrecto")
	if(Historia==2):
		if(opc1==correcta2[0]):
			la.text = "Arma Correcta"
			add_child(l)
			print("Arma Correcta")
		else:
			la.text = "Arma Incorrecta"
			add_child(l)
			print("Arma Incorrecta")
		if(opc2==correcta2[1]):
			lo.text = "Persona Correcta"
			add_child(l)
			print("Personaje Correcto")
		else:
			lo.text = "Persona Incorrecta"
			add_child(l)
			print("Personaje Incorrecto")
		if(opc3==correcta2[2]):
			l.text = " Correcta"
			add_child(l)
			print("Lugar Correcto")
		else:
			l.text = " Inorrecta"
			add_child(l)
			print("Lugar Incorrecto")
	if(Historia==3):
		if(opc1==correcta3[0]):
			la.text = "Arma Correcta"
			add_child(l)
			print("Arma Correcta")
		else:
			la.text = "Arma Incorrecta"
			add_child(l)
			print("Arma Incorrecta")
		if(opc2==correcta3[1]):
			lo.text = "Persona Correcta"
			add_child(l)
			print("Personaje Correcto")
		else:
			lo.text = "Persona Incorrecta"
			add_child(l)
			print("Personaje Incorrecto")
		if(opc3==correcta3[2]):
			l.text = " Correcta"
			add_child(l)
			print("Lugar Correcto")
		else:
			l.text = " inorrecta"
			add_child(l)
			print("Lugar Incorrecto")
	if(Historia==4):
		if(opc1==correcta4[0]):
			la.text = "Arma Correcta"
			add_child(l)
			print("Arma Correcta")
		else:
			la.text = "Arma Incorrecta"
			add_child(l)
			print("Arma Incorrecta")
		if(opc2==correcta4[1]):
			lo.text = "Persona Correcta"
			add_child(l)
			print("Personaje Correcto")
		else:
			lo.text = "Persona Incorrecta"
			add_child(l)
			print("Personaje Incorrecto")
		if(opc3==correcta4[2]):
			l.text = "Correcta"
			add_child(l)
			print("Lugar Correcto")
		else:
			l.text = " Incorrecta"
			add_child(l)
			print("Lugar Incorrecto")
	if(Historia==5):
		if(opc1==correcta5[0]):
			la.text = "Arma Correcta"
			add_child(l)
			print("Arma Correcta")
		else:
			la.text = "Arma Incorrecta"
			add_child(l)
			print("Arma Incorrecta")
		if(opc2==correcta5[1]):
			lo.text = "Persona Correcta"
			add_child(l)
			print("Personaje Correcto")
		else:
			lo.text = "Persona Incorrecta"
			add_child(l)
			print("Personaje Incorrecto")
		if(opc3==correcta5[2]):
			l.text = " Correcta"
			add_child(l)
			print("Lugar Correcto")
		else:
			l.text = " Incorrecta"
			add_child(l)
			print("Lugar Incorrecto")


		
func Cuadro(var a):
	intento= intento+1
	#$CuadroAceptacion.add_button("intento: %s gastado: "%intento,true,a)
	$AcceptDialog.set_title("Conversacion")
	$AcceptDialog.set_text(a)
	$AcceptDialog.show()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	Historia = rng.randi_range(1,5)
	print("se selecciono la historia %s" % Historia)
	if (Historia==1):
		conversacionSOBJ = conversacion1OBJ
		conversacionSPER = conversacion1PER
		conversacionSLUG = conversacion1LUG
	if (Historia==2):
		conversacionSOBJ = conversacion2OBJ
		conversacionSPER = conversacion2PER
		conversacionSLUG = conversacion2LUG
	if (Historia==3):
		conversacionSOBJ = conversacion3OBJ
		conversacionSPER = conversacion3PER
		conversacionSLUG = conversacion3LUG
	if (Historia==4):
		conversacionSOBJ = conversacion4OBJ
		conversacionSPER = conversacion4PER
		conversacionSLUG = conversacion4LUG
	if (Historia==5):
		conversacionSOBJ = conversacion5OBJ
		conversacionSPER = conversacion5PER
		conversacionSLUG = conversacion5LUG
		pass
	


# Presiona opcion de arma  ----- Muestra 
func _on_Arma_pressed():
	get_node("VBoxArma").show()
	get_node("Arma").show()
	get_node("Persona").show()
	get_node("Ubicacion").show()
	pass 
	#----------- Guarda elementos 
func _on_ret_arma_pressed():
	get_node("VBoxArma").hide()
	get_node("Arma").show()
	get_node("Persona").show()
	get_node("Ubicacion").show()
	
	pass # Replace with function body.
# Presiona opcion persona 
func _on_Persona_pressed():
	get_node("VBoxPersona").show()
	get_node("Arma").show()
	get_node("Persona").show()
	get_node("Ubicacion").show()
	pass 
	
func _on_r_persona_pressed():
	get_node("VBoxPersona").hide()
	get_node("Arma").show()
	get_node("Persona").show()
	get_node("Ubicacion").show()
	pass # Replace with function body.

# Presiona opcion Lugar 
func _on_Ubicacion_pressed():
	get_node("VBoxLugar").show()
	get_node("Arma").show()
	get_node("Persona").show()
	get_node("Ubicacion").show()
	pass 

func _on_ret_lugar_pressed():
	get_node("VBoxLugar").hide()
	get_node("Arma").show()
	get_node("Persona").show()
	get_node("Ubicacion").show()
	pass 

# -------------------------------- ARMAS ----------------------
func _on_Soga_pressed():
	Cuadro(conversacionSOBJ[0])
	pass 
func _on_Hacha_pressed():
	Cuadro(conversacionSOBJ[1])
	pass 
func _on_Tijeras_pressed():
	Cuadro(conversacionSOBJ[2])
	pass 
func _on_Martillo_pressed():
	Cuadro(conversacionSOBJ[3])
	pass 
func _on_Bate_pressed():
	Cuadro(conversacionSOBJ[4])
	pass 

#------------------------- PERSONAS ----------------------------------

func _on_Celeste_pressed():
	Cuadro(conversacionSPER[0])
	pass # Replace with function body.
func _on_Blanco_pressed():
	Cuadro(conversacionSPER[1])
	pass # Replace with function body.
func _on_Pardo_pressed():
	Cuadro(conversacionSPER[2])
	pass # Replace with function body.
func _on_Amapola_pressed():
	Cuadro(conversacionSPER[3])
	pass # Replace with function body.
func _on_Mora_pressed():
	Cuadro(conversacionSPER[4])
	pass # Replace with function body.

#--------------------------------------- LUGAR -----------------------
func _on_Sala_pressed():
	Cuadro(conversacionSLUG[0])
	pass # Replace with function body.
func _on_Cocina_pressed():
	Cuadro(conversacionSLUG[1])
	pass # Replace with function body.
func _on_Dormitorio_pressed():
	Cuadro(conversacionSLUG[2])
	pass # Replace with function body.
func _on_Jardin_pressed():
	Cuadro(conversacionSLUG[3])
	pass # Replace with function body.
func _on_Sotano_pressed():
	Cuadro(conversacionSLUG[4])
	pass # Replace with function body.

# -------------------------------------------
func _on_Aceptar_pressed():
	get_node("Aceptar").hide()
	get_node("Arma").hide()
	get_node("Persona").hide()
	get_node("Ubicacion").hide()
	get_node("Confirmacion").show()
	get_node("VBoxArma").hide()
	get_node("VBoxPersona").hide()
	get_node("VBoxLugar").hide()
	get_node("Seleccione").hide()
	pass # Replace with function body.

func _on_A_Soga_pressed():
	opc1 = 0
	get_node("Confirmacion/Arma_1").hide()
	
	pass # Replace with function body.
func _on_A_Hacha_pressed():
	opc1 = 1
	get_node("Confirmacion/Arma_1").hide()
	
	pass # Replace with function body.
func _on_A_Tijeras_pressed():
	opc1 = 2
	get_node("Confirmacion/Arma_1").hide()
	
	pass # Replace with function body.
func _on_A_Martillo_pressed():
	opc1 = 3
	get_node("Confirmacion/Arma_1").hide()
	
	pass # Replace with function body.
func _on_A_Bate_pressed():
	opc1 = 4
	get_node("Confirmacion/Arma_1").hide()
	
	pass # Replace with function body.
#--------------------------------------------------------
func _on_P_Celeste_pressed():
	opc2 = 0
	get_node("Confirmacion/Persona_1").hide()
	pass # Replace with function body.

func _on_P_Blanco_pressed():
	opc2 = 1
	
	get_node("Confirmacion/Persona_1").hide()
	pass # Replace with function body.


func _on_P_Pardo_pressed():
	opc2 = 2
	
	get_node("Confirmacion/Persona_1").hide()
	pass # Replace with function body.


func _on_P_Amapola_pressed():
	opc2 = 3
	
	get_node("Confirmacion/Persona_1").hide()
	pass # Replace with function body.


func _on_A_Mora_pressed():
	opc2 = 4
	
	get_node("Confirmacion/Persona_1").hide()
	pass # Replace with function body.
#---------------------------------------------
func _on_L_Cocina_pressed():
	opc3 = 0
	get_node("Confirmacion/Lugar").hide()
	get_node("Confirmacion/Arma_1").hide()
	get_node("Confirmacion/Persona_1").hide()
	validar()
	pass # Replace with function body.
func _on_L_Sala_pressed():
	opc3 = 1
	get_node("Confirmacion/Lugar").hide()
	get_node("Confirmacion/Arma_1").hide()
	get_node("Confirmacion/Persona_1").hide()
	validar()
	pass # Replace with function body.
func _on_L_Dormitorio_pressed():
	opc3 = 2
	get_node("Confirmacion/Lugar").hide()
	get_node("Confirmacion/Arma_1").hide()
	get_node("Confirmacion/Persona_1").hide()
	validar()
	pass # Replace with function body.
	
func _on_L_Jardin_pressed():
	opc3 = 3
	get_node("Confirmacion/Lugar").hide()
	get_node("Confirmacion/Arma_1").hide()
	get_node("Confirmacion/Persona_1").hide()
	validar()
	pass # Replace with function body.
func _on_L_Sotano_pressed():
	opc3 = 4
	get_node("Confirmacion/Lugar").hide()
	get_node("Confirmacion/Arma_1").hide()
	get_node("Confirmacion/Persona_1").hide()
	validar()
	pass # Replace with function body.


