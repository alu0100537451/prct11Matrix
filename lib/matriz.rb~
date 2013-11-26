require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require "../lib/racional.rb"

class Matrices
        include Comparable
        include Enumerable

        attr_accessor :filas, :columnas, :matriz

	def initialize(f, c)
                #atributo
                 @filas=f.to_i; #Numero de filas
                 @columnas=c.to_i; #Numero de columnas
        end

#################################################      
	def +(other) 
		if(self.filas == other.filas and self.columnas == other.columnas)
                        # SELF Matrices densas
                        if self.instance_of?Densa
                                temp = Densa.new(self.filas, self.columnas, nil)
                                if other.instance_of?Densa
                                        
                                        0.upto(@filas-1) do |i| #for i in (0...@filas.to_i)
                                             0.upto(@columnas-1) do |j| #for j in (0...@columnas.to_i)
                                                        temp.matriz[i][j] = (self.matriz[i][j]) + (other.matriz[i][j])
                                                end
                                        end
                                end

                                if other.instance_of?Dispersa
                                        for i in (0...@filas.to_i)
                                                for j in (0...@columnas.to_i)
                                                        encontrado = 0
                                                        for k in (0...other.posx.size)
                                                                if (i==other.posx[k] and j==other.posy[k] and encontrado==0)
                                                                        temp.matriz[i][j] = (self.matriz[i][j]) + (other.valor[k])
                                                                        encontrado = 1        
                                                                end
                                                        end
                                                        if (encontrado == 0)
                                                                temp.matriz[i][j] = self.matriz[i][j]
                                                        end
                                                end
                                        end
                                end
                        end

                        # SELF Matriz Dispersa
                        if self.instance_of?Dispersa
                                if other.instance_of?Densa
                                        temp = Densa.new(self.filas, self.columnas, nil)
                                        for i in (0...@filas.to_i)
                                                for j in (0...@columnas.to_i)
                                                        encontrado = 0
                                                        for k in (0...self.posx.size.to_i)
                                                                if (i==self.posx[k] and j==self.posy[k] and encontrado==0)
                                                                        temp.matriz[i][j] = (other.matriz[i][j]) + (self.valor[k])
                                                                        encontrado = 1        
                                                                end
                                                        end
                                                        if (encontrado == 0)
                                                                temp.matriz[i][j] = other.matriz[i][j]
                                                        end
                                                end
                                        end
                                end
                

                                if other.instance_of?Dispersa
                                        temp = Dispersa.new(self.filas,self.columnas,[],[],[])
                                        temp.valor = self.valor
                                        temp.posx = self.posx
                                        temp.posy = self.posy

                                        for j in (0...other.posx.size.to_i)
                                                encontrado = false
                                                for k in (0...self.posx.size.to_i)
                                                        if(other.posx[j] == temp.posx[k] and other.posy[j] == temp.posy[k])
                                                                temp.valor[k] = temp.valor[k] + other.valor[j]
                                                                encontrado = true
                                                        end
                                                        
                                                end
                                                if (encontrado == false)
                                                        temp.posx << other.posx[j]
                                                        temp.posy << other.posy[j]
                                                        temp.valor << other.valor[j]
                                                end
                                        end
                                end
                        end
                
                        return temp
                else
                        return nil
                       
end		
end		
		
def *(other)
	temp=Densa.new(self.filas,other.columnas,nil)

	
                       # SELF Matrices densas
                if self.instance_of?Densa
			if other.instance_of?Densa
			  ###########################DENSA*DENSA#####################################
			  self.filas.times do |i| 			  
				  other.columnas.times do |j|
				    temp.matriz[i][j]=0
					  other.columnas.times do |k|
						  temp.matriz[i][j] = temp.matriz[i][j] + (self.matriz[i][k] * other.matriz[k][j])
					  end
				  end
			  end
			end
			if other.instance_of?Dispersa			  
			  ###########################DENSA*DISPERSA#####################################
			  ##################Formamos una matriz densa a partir de la dispersa###########			  
			  #0.upto(@filas-1) do |i| #for i in (0...@filas.to_i)			      
                                            #0.upto(@columnas-1) do |j| #for j in (0...@columnas.to_i)					      
			  disptodens = Densa.new(self.filas,other.columnas,[0,0,0,0,0,0,0,0,0])
			  for i in (0...@filas.to_i)
                                                for j in (0...@columnas.to_i)
                                                        encontrado = 0
                                                        for k in (0...other.posx.size)
							  if (i==other.posx[k] and j==other.posy[k] and encontrado==0)
							    disptodens.matriz[i][j] = other.valor[k]							    
							    #puts other.posx[i]
							    #puts other.posy[j]
							    #puts other.valor[k]                                                                								          
                                                        end                                                        
							end                                                                                                        
						end   			
						
			  end
						#puts disptodens.to_s
						
						self.filas.times do |i|				      
						  disptodens.columnas.times do |j|				    
						    temp.matriz[i][j]=0					  
						    disptodens.columnas.times do |k|						  
						      temp.matriz[i][j] = temp.matriz[i][j] + (self.matriz[i][k] * disptodens.matriz[k][j])					  
						    end				  
						  end			  
						end
			  
			end		
		end
		

		if self.instance_of?Dispersa
		  if other.instance_of?Dispersa		        
		    ###########################DISPERSA*DISPERSA#####################################
		    ##1
		    disptodens = Densa.new(self.filas,other.columnas,[0,0,0,0,0,0,0,0,0])
			  for i in (0...@filas.to_i)
                                                for j in (0...@columnas.to_i)
                                                        encontrado = 0
                                                        for k in (0...other.posx.size)
							  if (i==other.posx[k] and j==other.posy[k] and encontrado==0)
							    disptodens.matriz[i][j] = other.valor[k]							    
							    #puts other.posx[i]
							    #puts other.posy[j]
							    #puts other.valor[k]                                                                								          
                                                        end                                                        
							end                                                                                                        
						end   			
						
			  end
		    ##2
			  disptodens2 = Densa.new(other.filas,self.columnas,[0,0,0,0,0,0,0,0,0])
			  for i in (0...@filas.to_i)
                                                for j in (0...@columnas.to_i)
                                                        encontrado = 0
                                                        for k in (0...self.posx.size)
							  if (i==self.posx[k] and j==self.posy[k] and encontrado==0)
							    disptodens2.matriz[i][j] = self.valor[k]							 							    
                                                        end                                                        
							end                                                                                                        
						end   			
						
			  end
			  
			  temp=Densa.new(self.filas, self.columnas,[0,0,0,0,0,0,0,0,0])
			  puts disptodens.to_s
			  puts disptodens2.to_s
			  disptodens.filas.times do |i| 			  
				  disptodens2.columnas.times do |j|
				    temp.matriz[i][j]=0
					  disptodens2.columnas.times do |k|
						  temp.matriz[i][j] = temp.matriz[i][j] + (disptodens2.matriz[i][k] * disptodens.matriz[k][j])
					  end
				  end
			  end		    
		  end
		  
		  if other.instance_of?Densa
		    ###########################DISPERSA*DENSA#####################################
		    disptodens = Densa.new(other.filas,self.columnas,[0,0,0,0,0,0,0,0,0])
			  for i in (0...@filas.to_i)
                                                for j in (0...@columnas.to_i)
                                                        encontrado = 0
                                                        for k in (0...self.posx.size)
							  if (i==self.posx[k] and j==self.posy[k] and encontrado==0)
							    disptodens.matriz[i][j] = self.valor[k]							    				
                                                        end                                                        
							end                                                                                                        
						end   			
						
			  end
			  puts disptodens.to_s
			  puts other.to_s
			  temp=Densa.new(self.filas, self.columnas,[0,0,0,0,0,0,0,0,0])
			  
			  other.filas.times do |i|				      			
			    other.columnas.times do |j|				    				
			      
			      disptodens.columnas.times do |k|				
				temp.matriz[i][j] = temp.matriz[i][j] + (disptodens.matriz[i][k] * other.matriz[k][j])
			      end				  				
			      		
			    end			  				
			  end			  			  		    
		  
		  end
		  
		end
		temp
						              
	
end
                

	
	
	
	
##############################################################################

##############################RESTA###########################################

def -(other)        
                if(self.filas == other.filas and self.columnas == other.columnas)
                        # SELF Matrices densas
                        if self.instance_of?Densa
                                temp = Densa.new(self.filas, self.columnas, nil)
                                if other.instance_of?Densa                
                                        for i in (0...@filas.to_i)
                                                for j in (0...@columnas.to_i)
                                                        temp.matriz[i][j] = (self.matriz[i][j]) - (other.matriz[i][j])
                                                end
                                        end
                                end

                                if other.instance_of?Dispersa
                                        for i in (0...@filas.to_i)
                                                for j in (0...@columnas.to_i)
                                                        encontrado = 0
                                                        for k in (0...other.posx.size)
                                                                if (i==other.posx[k] and j==other.posy[k] and encontrado==0)
                                                                        temp.matriz[i][j] = (self.matriz[i][j]) - (other.valor[k])
                                                                        encontrado = 1        
                                                                end
                                                        end
                                                        if (encontrado == 0)
                                                                temp.matriz[i][j] = self.matriz[i][j]
                                                        end
                                                end
                                        end
                                end
                        end

                        # SELF Matriz Dispersa
                        if self.instance_of?Dispersa
                                if other.instance_of?Densa
                                        temp = Densa.new(self.filas, self.columnas, nil)
                                        for i in (0...@filas.to_i)
                                                for j in (0...@columnas.to_i)
                                                        encontrado = 0
                                                        for k in (0...self.posx.size.to_i)
                                                                if (i==self.posx[k] and j==self.posy[k] and encontrado==0)
                                                                        temp.matriz[i][j] = (other.matriz[i][j]) - (self.valor[k])
                                                                        encontrado = 1        
                                                                end
                                                        end
                                                        if (encontrado == 0)
                                                                temp.matriz[i][j] = other.matriz[i][j]
                                                        end
                                                end
                                        end
                                end
                

                                if other.instance_of?Dispersa
                                        temp = Dispersa.new(self.filas,self.columnas,[],[],[])
                                        temp.valor = self.valor
                                        temp.posx = self.posx
                                        temp.posy = self.posy

                                        for j in (0...other.posx.size.to_i)
                                                encontrado = false
                                                for k in (0...self.posx.size.to_i)
                                                        if(other.posx[j] == temp.posx[k] and other.posy[j] == temp.posy[k])
                                                                temp.valor[k] = temp.valor[k] - other.valor[j]
                                                                encontrado = true
                                                        end
                                                        
                                                end
                                                if (encontrado == false)
                                                        temp.posx << other.posx[j]
                                                        temp.posy << other.posy[j]
                                                        temp.valor << other.valor[j]
                                                end
                                        end
                                end
                        end
                
                        return temp
                else
                        return nil
                end
        end
        
end










class Dispersa < Matrices
attr_accessor :posx, :posy, :valor
        def initialize(f,c,posx, posy, valor)
                super(f,c)
                @posx = posx
                @posy = posy
                @valor = valor

        end

        def to_s
                s=String.new
                s << "["
                for i in (0...@filas.to_i)
                        s << "[#{posx[i]},#{posy[i]},#{valor[i]}]"
                end
                s << "]"
        end

        def max
                m = self.valor[0]
                for i in (0...self.valor.size.to_i)
                                if (self.valor[i]> m)
                                        m = self.valor[i]
                                end
                end
                return m
        end

        def min
                m = self.valor[0]
                for i in (0...self.valor.size.to_i)
                                if (self.valor[i]< m)
                                        m = self.valor[i]
                                end
                end
                return m
        end

        def pos(a,b)
                for i in (0...self.posx.size)
                        if(posx[i]==a and posy[i]==b)
                                return valor[i]
                        end
                end
                return nil
        end

end


class Densa < Matrices
attr_accessor :matriz
        
def initialize(f,c,m)
                super(f,c)
                @matriz = Array.new(@filas.to_i){Array.new(@columnas.to_i)}

                 if (m != nil)
                        #Rellenamos la matriz con lo valores recibidos
                         for i in (0...@filas.to_i)
                                for j in (0...@columnas.to_i)
                                        @matriz[i][j]=m[i*@columnas.to_i+j];
                                end
                         end
                 end
        end
        # Metodos getter devuelve el valor de una posicion determinada

        def pos(a,b)
                @matriz[a][b]
        end
        
        #Metodo que devuelve la matriz en forma de string
        def to_s
                "#{@matriz}"
        end



####Traspuesta de una matriz
        def traspuesta
                i=0
                mtrasp = Array.new(@filas) {Array.new(self.columnas)}
                while i < @filas
                        j=0
                        while j < @columnas
                                mtrasp[i][j] = self.matriz[j][i]
                                j+=1
                        end
                        i+=1
                end
                Matrices.new(mtrasp)
        end


####Opuesta de una matriz
        def opuesta

                i=0
                mop = Array.new(@filas) {Array.new(self.columnas)}
                while i < @filas
                        j=0
                        while j < @columnas
                                mop[i][j] = (self.matriz[i][j]) * (- 1)
                                j+=1
                        end
                        i+=1
                end
                Matrices.new(mop)

        end

############Método Mínimo######################################
      def minimo
                
          min = self.matriz[0][0]                
                i=0                                                                
                while i < @filas                                                 
                       j=0
                       while j < @columnas                                        
                              if(self.matriz[i][j] < min)                                        
                                        min = self.matriz[i][j]                                        
			      end
                              j+= 1                                
                        end
                        i+= 1                        
                end                                
                return min                
        end        

##############Método Máximo######################################
       def maximo
                
           max = self.matriz[0][0]                
                i = 0                                                                                
                while i < @filas                                                                       
                        j = 0                        
                        while j < @columnas                                                                        
                                if(self.matriz[i][j] > max)                                        
                                        max = self.matriz[i][j]                                        
                                end                                
                                j+= 1                                
                        end                        
                        i+= 1                        
                end                                
          return max                
        end        
end


	den1 = Densa.new(3,3,[1,2,3,4,5,6,7,8,9])
	den2 = Densa.new(3,3,[1,2,3,4,5,6,7,8,9])
	den3 = Densa.new(3,3,[0,0,0,0,0,0,0,0,0])
	disp1= Dispersa.new(3,3,[0,1,2],[0,1,2],[4,12,30])
	disp2= Dispersa.new(3,3,[1,1,2],[0,1,2],[44,16,32])
	
	  #puts den1.to_s
	  #puts den2.to_s

	

puts "#{(disp1*den1).to_s}"


