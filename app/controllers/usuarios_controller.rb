class UsuariosController < ApplicationController
  def get_all_usuarios
    usuarios = Usuario.all
    render json: usuarios
  end

  def login
    usuario = Usuario.authenticate(params[:username], params[:pdw])

    if usuario
      # Inicio de sesión exitoso
      render json: { message: 'Inicio de sesión exitoso', usuario: usuario }, status: :ok
    else
      # Credenciales inválidas
      render json: { message: 'Credenciales inválidas' }, status: :unauthorized
    end
  end

  def registrar_usuario
    username = params[:username]
    pdw = params[:pdw]

    existing_user = Usuario.find_by(username: username)

    if existing_user
      render json: { error: 'El nombre de usuario ya está en uso' }, status: :unprocessable_entity
    else
      usuario = Usuario.create(username: username, pdw: pdw)
      render json: usuario, status: :created
    end
  end


end
