require "../lib/matriz.rb"

	
=begin
	matrizden1 = Densa.new(3,3[1,3,5,2,4,6,7,8,9])
	matrizden2 = Densa.new(3,3[1,3,5,2,4,6,7,8,9])
	matrizdenS = Densa.new(3,3[0,0,0,0,0,0,0,0,0])

	matrizdenS = matrizden1 + matrizden2
	puts "#{(matrizdenS.to_s)}"

	matriz2 = Matrices.new([[2,4,6],[1,3,5],[2,7,8]])

	matrizs = Matrices.new([[0,0,0],[0,0,0],[0,0,0]])

	matriz4 = Matrices.new([[5,5,7],[4,5,8],[7,8,9]])

	matriz5 = Matrices.new([[2,4,6],[1,3,5],[2,7,8]])

	matrizr = Matrices.new([[0,0,0],[0,0,0],[0,0,0]])

	matrizt = Matrices.new([[5,5,7],[4,5,8],[7,8,9]])

	matrizo = Matrices.new([[2,4,6],[1,3,5],[2,7,8]])

####
	puts "####"
	puts "#{matriz1.dispersa}"	
	puts "####"
####

	puts "Matriz 1" 
	
	puts "#{matriz1.mostrar}"

	puts "Matriz 2" 

	puts "#{matriz2.mostrar}"
##SUMA	
	matrizs = matriz1 + matriz2

	puts "SUMA:" 

	puts "#{matrizs.mostrar}"
##RESTA
	puts "RESTA:"

	matrizr = matriz4 - matriz5

	puts "#{matrizr.mostrar}"
##PRODUCTO
	puts "PRODUCTO:" 
	
	matriz3 = matriz1 * matriz2

	puts "#{matriz3.mostrar}"
##TRASPUESTAS
	puts "TRASPUESTA de la primera matriz:"
	
	puts "#{matrizt.traspuesta.mostrar}"

##OPUESTA

#
	puts "OPUESTA de la segunda matriz:"
	
	puts "#{matrizo.opuesta.mostrar}"



=end
