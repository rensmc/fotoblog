class ControlController < ApplicationController
	#http_basic_autenticate_with :name => "sergio" :password =>"secreto"
	def index
		@fotos = Foto.all
	end

	def foto_nueva
		@foto = Foto.new
	end

	def guardar_foto
		@foto = Foto.new(params[:foto])
		if @foto.save
			flash[:mensaje] = "Foto guardada con éxito"
			redirect_to :action => 'index'
		else
			#Se cumple validación
			flash[:mensaje] = "El campo del título e imagen"
			render :action => 'foto_nueva'
		end
	end

end
