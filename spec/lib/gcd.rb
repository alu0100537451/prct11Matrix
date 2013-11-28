#=gcd.rb
#
# Autores:: Aarón José Vera Cerdeña,Jacobo Saavedra Valdes
#
# == Este fichero contiene:
#    Se calcula el máximo común divisor de las fracciones 
#
def gcd(u, v)
	u, v = u.abs, v.abs
	while v > 0
		u, v = v, u % v
	end
	u
end

