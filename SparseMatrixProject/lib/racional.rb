#=racional.rb
#
# Autores:: Aarón José Vera Cerdeña,Jacobo Saavedra Valdes
#
# == Este fichero contiene:
#
#
#
#
require "./lib/gcd.rb"
# === Clase Racional
#
# Definición de la clase _Racional_ compuesta por
# * metodo initialize
# * metodo to_s(other)
# * metodo +(other)
# * metodo *(other)
# * metodo /(other)
# * metodo num
# * metodo denom
# * metodo to_f
# * metodo abs
# * metodo %
# * metodo reciprocal
# * metodo -@
# * metodo <=>
#
class Racional
	include Comparable

	def initialize(numerador, denominador)
		@numerador = numerador
		@denominador = denominador
	end
	attr_reader :numerador, :denominador


	def to_s#Método que devuelve un String
                "#{@numerador}/#{@denominador}"
        end
	
	def +(other)#Calcular la suma
                if (@denominador == other.denominador )
                        nume=@numerador + other.numerador
                        deno=@denominador
                        mcd=gcd(nume,deno)
                else
                        aux= @denominador * other.denominador
                        nume = ((aux / @denominador ) * @numerador) + ((aux / other.denominador ) * other.numerador)
                        deno = @denominador*other.denominador
                        mcd=gcd(nume,deno)
                end
                
                temp = Racional.new(nume/mcd, deno/mcd)
        end


	def -(other)#Calcular la resta	de un Racional
                if (@denominador == other.denominador )
                        nume=@numerador - other.numerador
                        deno=@denominador
                        mcd=gcd(nume,deno)
                
                else
                        aux= @denominador * other.denominador
                        nume = ((aux / @denominador ) * @numerador) - ((aux / other.denominador ) * other.numerador)
                        deno=@denominador*other.denominador
                        mcd=gcd(nume,deno)
                
                end
                
                
                temp = Racional.new(nume/mcd, deno/mcd)
        end


	 def * (other)#Calcular el producto de un Racional
                nume = @numerador * other.numerador
                deno = @denominador * other.denominador
                mcd=gcd(nume,deno)
                temp = Racional.new(nume / mcd ,deno / mcd )
        
        end

#####Calcular la division
        def / (other)
        
                nume = @numerador *other.denominador
                deno = @denominador * other.numerador
                mcd= gcd(nume,deno)
                temp = Racional.new(nume/mcd, deno/mcd )
        
        end


	def num#####Devolver el numerador
		@numerador
	end


	def denom #####Devolver el denominador
		@denominador		
	end


	def to_f#####Flotante
		flotante = numerador.to_f/denominador
	end

	
	def abs#####Calcular el absoluto de la fraccion
		absnum = numerador.abs
		absdenom = denominador.abs
		abs = Racional.new(absnum, absdenom)
	end


	def % (other)#####Calcular el resto
		nume = @numerador * other.denominador
                deno = @denominador * other.numerador
                mcd  = gcd(nume,deno)

		temp = ((nume/mcd) % (deno/mcd))
		

	end

	
	def reciprocal#####Calcular el reciproco de la fraccion
		Racional.new(@denominador,@numerador)
	end


	def -@#####Calcular el opuesto de la fraccion
		negado = Racional.new(-denominador, numerador)
	end

	def <=> (other)
		if other.instance_of? Racional
			return (numerador.to_f/denominador)<=>(other.numerador.to_f/other.denominador)
		else
			false
	end
       
end
end
