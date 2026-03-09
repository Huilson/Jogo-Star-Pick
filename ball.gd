extends CharacterBody2D
# Define que o objeto usa física de personagem 2D do Godot

var gravity = 900
# Valor da gravidade. Controla a velocidade com que a bola cai.

var bounce = -60
var speed = 200
# Velocidade horizontal da bola (esquerda/direita)

func _physics_process(delta):
# Função chamada automaticamente a cada frame da física

	velocity.y += gravity * delta
	# Aplica gravidade à bola.
	# delta garante que o movimento seja consistente independente 
	# do FPS.

	var direction = 0
	# Variável que vai armazenar a direção horizontal do movimento.
	# -1 = esquerda
	#  0 = parado
	#  1 = direita

	# -------- CONTROLE POR TECLADO --------
	direction += Input.get_axis("ui_left", "ui_right")
	# Lê as teclas configuradas no Input Map.
	# Se pressionar esquerda retorna -1
	# Se pressionar direita retorna 1
	# Se não pressionar nada retorna 0

	# -------- CONTROLE POR GIROSCÓPIO --------
	var accel = Input.get_accelerometer()
	# Obtém os dados do acelerômetro do celular.
	# O resultado é um Vector3 com os valores de inclinação do 
	# dispositivo.

	direction += accel.x
	# Usa a inclinação horizontal do celular para mover a bola.
	# Inclinar o celular para esquerda ou direita altera o valor 
	# de accel.x.

	velocity.x = direction * speed
	# Define a velocidade horizontal da bola.
	# A direção (-1 a 1) é multiplicada pela velocidade máxima.
	
	if is_on_floor():
		# Verifica se a bola está encostando no chão
		velocity.y *= bounce
		# Inverte a velocidade vertical para fazer a bola subir novamente.
		# Também reduz a velocidade, simulando perda de energia no quique.

	move_and_slide()
	# Move o personagem aplicando física e detectando colisões 
	#automaticamente.
