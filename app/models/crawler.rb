class Crawler < ActiveRecord::Base
	def self.get_website_all
		c = Company.find_by_id(1)
		if c.status == true
			begin
				open('http://scappinicambio.com.br')
				mechanize = Mechanize.new
				page = mechanize.get('http://scappinicambio.com.br')
				get_val = page.search(".//td")

			  us_c = ''
			  us_v = ''
			  ps_c = ''
			  ps_v = ''
			  es_c = ''
			  es_v = ''
			  gs_c = ''
			  gs_v = ''
			  count = 0
			  content = ''
			  get_val.each do |c|
				  if c.to_s.gsub(/\s+/, "") != '<tdstyle="text-align:center;"><strong><fontsize="2"> Compra </font></strong></td>'.to_s.gsub(/\s+/, "") and 
				 	  c.to_s.gsub(/\s+/, "") != '<tdstyle="text-align:center;"><strong><fontsize="2"> Venda </font></strong></td>'.to_s.gsub(/\s+/, "")
						content = "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(",",".").gsub('<tdstyle="text-align:center;">&#65279;'.to_s, "" ).gsub('<tdstyle="text-align:center;"><spanstyle="text-align:start;">'.to_s, "").gsub('</span></td>'.to_s, "").gsub('</td>',"").gsub(160.chr("UTF-8"),"")
					  if content[0..2] == '{0}'
							us_c =content[3..7]
					 	end
					 	if content[0..2] == '{1}'
						 	us_v =content[3..7]
					 	end
					 	if content[0..2] == '{2}'
							ps_c =content[3..7]
					 	end
					 	if content[0..2] == '{3}'
						  ps_v =content[3..7]
					 	end
					 	if content[0..2] == '{4}'
						 	es_c =content[3..7]
					 	end
					 	if content[0..2] == '{5}'
						 	es_v =content[3..7]
					 	end
					 	if content[0..2] == '{6}'
						 	gs_c =content[3..7].gsub(".","")
					 	end
					 	if content[0..2] == '{7}'
						 	gs_v = content[3..7].gsub(".","")
					 	end
				 	count += 1
				 end
			 end
			 	#insert realxdolar
		    Exchange.create(
		    	company_id: 1,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      1,
		    	buy:        us_c.to_f,
		    	sale:       us_v.to_f,
		    )

			 	#insert realxpeso
		    Exchange.create(
		    	company_id: 1,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      4,
		    	buy:        ps_c.to_f,
		    	sale:       ps_v.to_f,
		    )

			 	#insert realxeuro
		    Exchange.create(
		    	company_id: 1,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      5,
		    	buy:        es_c.to_f,
		    	sale:       es_v.to_f,
		    )
			
			 	#insert realxguarani
		    Exchange.create(
		    	company_id: 1,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      2,
		    	buy:        gs_c.to_f,
		    	sale:       gs_v.to_f,
		    )

			rescue			
				c.update_attributes(status: false)
			end
		end

		c = Company.find_by_id(2)
		if c.status == true
			begin
				open('http://atlascambio.tur.br/')

				mechanize = Mechanize.new
				page = mechanize.get('http://atlascambio.tur.br/')
				get_val = page.search(".//span")


				us_rs_c = ''
				us_rs_v = ''

				rs_gs_c = ''
				rs_gs_v = ''

				ps_rs_c = ''
				ps_rs_v = ''

				es_rs_c = ''
				es_rs_v = ''
			  count = 0
			  content = ''

				 get_val.each do |c| 
					 if c.to_s.encode('UTF-8').gsub(/\s+/, "")[0..14] == '<spanclass="c4"' 
						content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(".","").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub('<spanclass="c4">',"")

						 if content[0..2] == '{0}' 
							 us_rs_c = content[3..6] 
						 end 

						 if content[0..2] == '{1}' 
							 us_rs_v =content[3..6] 
						 end 

						 if content[0..2] == '{2}' 
							 ps_rs_c =content[3..6] 
						 end 

						 if content[0..2] == '{3}' 
							 ps_rs_v =content[3..6] 
						 end 


						 if content[0..2] == '{4}' 
							 es_rs_c =content[3..6] 
						 end 

						 if content[0..2] == '{5}' 
							 es_rs_v =content[3..6] 
						 end 

						 if content[0..2] == '{6}' 
							 rs_gs_c =content[3..6] 
						 end 

						 if content[0..2] == '{7}' 
							 rs_gs_v =content[3..6] 
						 end 
					 	 count += 1 
					  end 
				 end 

			 	#insert realxdolar
		    Exchange.create(
		    	company_id: 2,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      1,
		    	buy:        us_rs_c.to_f,
		    	sale:       us_rs_v.to_f,
		    )

			 	#insert realxpeso
		    Exchange.create(
		    	company_id: 2,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      4,
		    	buy:        ps_rs_c.to_f,
		    	sale:       ps_rs_v.to_f,
		    )

			 	#insert realxeuro
		    Exchange.create(
		    	company_id: 2,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      5,
		    	buy:        es_rs_c.to_f,
		    	sale:       es_rs_v.to_f,
		    )
			
			 	#insert realxguarani
		    Exchange.create(
		    	company_id: 2,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      2,
		    	buy:        rs_gs_c.to_f,
		    	sale:       rs_gs_v.to_f,
		    )
			rescue
				c.update_attributes(status: false)
			end
		end

		list_crawler = Company.where(crawler_id: 3) #mercosur

		list_crawler.each do |lc|
			if lc.status == true
			begin
				open(lc.crawler_url.to_s)
				mechanize = Mechanize.new
				page = mechanize.get(lc.crawler_url.to_s)
				get_val = page.search(".//td")
				us_gs_c = ''
				us_gs_v = ''

				rs_gs_c = ''
				rs_gs_v = ''

				us_rs_c = ''
				us_rs_v = ''

				es_gs_c = ''
				es_gs_v = ''

				ps_gs_c = ''
				ps_gs_v = ''

				ps_rs_c = ''
				ps_rs_v = ''

				es_us_c = ''
				es_us_v = ''

				us_ps_c = ''
				us_ps_v = ''

				es_rs_c = ''
				es_rs_v = ''

				count = 0
				content = ''
				get_val.each do |c|
					if c.to_s.gsub(/\s+/, "")[0..28] == '<tdwidth="65%"align="center">'
					
						content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub('<tdwidth="65%"align="center">', "").gsub("</td>", "")

						if content[0..2] == '{0}'
							us_gs_c =content[3..7]
						end

						if content[0..2] == '{1}'
							us_gs_v =content[3..7]
						end

						if content[0..2] == '{2}'
							rs_gs_c =content[3..7]
						end

						if content[0..2] == '{3}'
							rs_gs_v =content[3..7]
						end

						if content[0..2] == '{4}'
							us_rs_c =content[3..7]
						end

						if content[0..2] == '{5}'
							us_rs_v =content[3..7]
						end

						if content[0..2] == '{6}'
							es_gs_c =content[3..7]
						end

						if content[0..2] == '{7}'
							es_gs_v =content[3..7]
						end

						if content[0..2] == '{8}'
							ps_gs_c =content[3..7]
						end

						if content[0..2] == '{9}'
							ps_gs_v =content[3..7]
						end

						if content[0..3] == '{10}'
							ps_rs_c =content[4..7]
						end

						if content[0..3] == '{11}'
							ps_rs_v =content[4..7]
						end

						if content[0..3] == '{12}'
							es_us_c =content[4..7]
						end

						if content[0..3] == '{13}'
							es_us_v =content[4..7]
						end

						if content[0..3] == '{14}'
							us_ps_c =content[4..7]
						end

						if content[0..3] == '{15}'
							us_ps_v =content[4..7]
						end

						if content[0..3] == '{16}'
							es_rs_c =content[4..7]
						end

						if content[0..3] == '{17}'
							es_rs_v =content[4..7]
						end
					 	count += 1
				 	end
			end

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      2,
	    	buy:        us_gs_c.to_f,
	    	sale:       us_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 3,
	    	:for =>      2,
	    	buy:        rs_gs_c.to_f,
	    	sale:       rs_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 3,
	    	:for =>      2,
	    	buy:        rs_gs_c.to_f,
	    	sale:       rs_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      3,
	    	buy:        us_rs_c.to_f,
	    	sale:       us_rs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 5,
	    	:for =>      2,
	    	buy:        es_gs_c.to_f,
	    	sale:       es_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 4,
	    	:for =>      2,
	    	buy:        ps_gs_c.to_f,
	    	sale:       ps_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 4,
	    	:for =>      3,
	    	buy:        ps_rs_c.to_f,
	    	sale:       ps_rs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 5,
	    	:for =>      1,
	    	buy:        es_us_c.to_f,
	    	sale:       es_us_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      4,
	    	buy:        us_ps_c.to_f,
	    	sale:       us_ps_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 5,
	    	:for =>      3,
	    	buy:        es_rs_c.to_f,
	    	sale:       es_rs_v.to_f,
    	)
			rescue				
				lc.update_attributes(status: false)
			end
		end
  	end #lista empresas

		c = Company.find_by_id(11)
		if c.status == true
			begin
				open('http://www.lamoneda.com.py/Cotizacionmatriz.php')

				mechanize = Mechanize.new
				page = mechanize.get('http://www.lamoneda.com.py/Cotizacionmatriz.php')
				get_val = page.search(".//td")

				 us_gs_c = ''
				 us_gs_v = ''

				 rs_gs_c = ''
				 rs_gs_v = ''

				 ps_gs_c = ''
				 ps_gs_v = ''

				 es_gs_c = ''
				 es_gs_v = ''

				 us_rs_c = ''
				 us_rs_v = ''

				 us_ps_c = ''
				 us_ps_v = ''

				 us_es_c = ''
				 us_es_v = ''

				 count = 0
				 content = ''
				 get_val.each do |c|
					 if c.to_s.gsub(/\s+/, "")[0..16] == '<tdalign="right">'
					
						content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub('<tdalign="right">', "").gsub("</td>", "")

						 if content[0..2] == '{0}'
							 us_gs_c =content[3..7].gsub(".","")
						 end

						 if content[0..2] == '{1}'
							 us_gs_v =content[3..7].gsub(".","")
						 end

						 if content[0..2] == '{2}'
							 rs_gs_c =content[3..7].gsub(".","")
						 end

						 if content[0..2] == '{3}'
							 rs_gs_v =content[3..7].gsub(".","")
						 end


						 if content[0..2] == '{4}'
							 ps_gs_c =content[3..7].gsub(".","")
						 end

						 if content[0..2] == '{5}'
							 ps_gs_v =content[3..7].gsub(".","")
						 end

						 if content[0..2] == '{6}'
							 es_gs_c =content[3..7].gsub(".","")
						 end

						 if content[0..2] == '{7}'
							 es_gs_v =content[3..7].gsub(".","")
						 end

						 if content[0..2] == '{8}'
							 us_rs_c =content[3..7]
						 end

						 if content[0..2] == '{9}'
							 us_rs_v =content[3..7]
						 end

						 if content[0..3] == '{10}'
							 us_ps_c =content[4..7]
						 end

						 if content[0..3] == '{11}'
							 us_ps_v =content[4..7]
						 end		

						 if content[0..3] == '{12}'
							 us_es_c =content[4..7]
						 end

						 if content[0..3] == '{13}'
							 us_es_v =content[4..7]
						 end		
					 	 count += 1
				 	 	end
				 	end

			    Exchange.create(
			    	company_id: 11,
			    	date:    Time.now,
			    	currency_id: 1,
			    	:for =>      2,
			    	buy:        us_gs_c.to_f,
			    	sale:       us_gs_v.to_f,
			    )

			    Exchange.create(
			    	company_id: 11,
			    	date:    Time.now,
			    	currency_id: 3,
			    	:for =>      2,
			    	buy:        rs_gs_c.to_f,
			    	sale:       rs_gs_v.to_f,
			    )

			    Exchange.create(
			    	company_id: 11,
			    	date:    Time.now,
			    	currency_id: 4,
			    	:for =>      2,
			    	buy:        ps_gs_c.to_f,
			    	sale:       ps_gs_v.to_f,
			    )
			    Exchange.create(
			    	company_id: 11,
			    	date:    Time.now,
			    	currency_id: 5,
			    	:for =>      2,
			    	buy:        es_gs_c.to_f,
			    	sale:       es_gs_v.to_f,
			    )

			    Exchange.create(
			    	company_id: 11,
			    	date:    Time.now,
			    	currency_id: 1,
			    	:for =>      3,
			    	buy:        us_rs_c.to_f,
			    	sale:       us_rs_v.to_f,
			    )

			    Exchange.create(
			    	company_id: 11,
			    	date:    Time.now,
			    	currency_id: 1,
			    	:for =>      4,
			    	buy:        us_ps_c.to_f,
			    	sale:       us_ps_v.to_f,
			    )
			    Exchange.create(
			    	company_id: 11,
			    	date:    Time.now,
			    	currency_id: 1,
			    	:for =>      5,
			    	buy:        us_es_c.to_f,
			    	sale:       us_es_v.to_f,
			    )
			rescue
				c.update_attributes(status: false)
			end
		end

		c = Company.find_by_id(11)
		if c.status == true
			begin
				open('http://mundialcambios.com.py/cambios/display-cambios.php')

			mechanize = Mechanize.new
			page = mechanize.get('http://mundialcambios.com.py/cambios/display-cambios.php')
			get_val = page.search(".//td")

			us_gs_c = ''
			us_gs_v = ''

			rs_gs_c = ''
			rs_gs_v = ''

			ps_gs_c = ''
			ps_gs_v = ''

			es_gs_c = ''
			es_gs_v = ''

			us_rs_c = ''
			us_rs_v = ''

			us_ps_c = ''
			us_ps_v = ''

			us_es_c = ''
			us_es_v = ''

			count = 0
	 		content = ''

		get_val.each do |c|
		 if c.to_s.gsub(/\s+/, "")[0..14] == '<tdclass="com">' or c.to_s.gsub(/\s+/, "")[0..14] == '<tdclass="ven">'
		
			content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(".","").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub('<tdclass="com"><pclass="com">',"").gsub('</p></td>', "").gsub('<tdclass="ven"><pclass="ven">', "")

			 if content[0..2] == '{0}'
				 us_gs_c =content[3..9]
			 end

			 if content[0..2] == '{1}'
				 us_gs_v =content[3..9]
			 end

			 if content[0..2] == '{2}'
				 rs_gs_c =content[3..9]
			 end

			 if content[0..2] == '{3}'
				 rs_gs_v =content[3..9]
			 end


			 if content[0..2] == '{4}'
				 ps_gs_c =content[3..7]
			 end

			 if content[0..2] == '{5}'
				 ps_gs_v =content[3..7]
			 end

			 if content[0..3] == '{12}'
				 es_gs_c =content[4..9]
			 end

			 if content[0..3] == '{13}'
				 es_gs_v =content[4..9]
			 end

			 if content[0..3] == '{20}'
				 us_rs_c =content[4..9]
			 end

			 if content[0..3] == '{21}'
				 us_rs_v =content[4..9]
			 end

			 if content[0..3] == '{22}'
				 us_ps_c =content[4..9]
			 end

			 if content[0..3] == '{23}'
				 us_ps_v =content[4..9]
			 end		

			 if content[0..3] == '{30}'
				 us_es_c =content[4..7]
			 end

			 if content[0..3] == '{31}'
				 us_es_v =content[4..7]
			 end		
		 	 count += 1
		 	 end
		 end
		    Exchange.create(
		    	company_id: 14,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      2,
		    	buy:        us_gs_c.to_f,
		    	sale:       us_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 14,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      2,
		    	buy:        rs_gs_c.to_f,
		    	sale:       rs_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 14,
		    	date:    Time.now,
		    	currency_id: 4,
		    	:for =>      2,
		    	buy:        ps_gs_c.to_f,
		    	sale:       ps_gs_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 14,
		    	date:    Time.now,
		    	currency_id: 5,
		    	:for =>      2,
		    	buy:        es_gs_c.to_f,
		    	sale:       es_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 14,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      3,
		    	buy:        us_rs_c.to_f,
		    	sale:       us_rs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 14,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      4,
		    	buy:        us_ps_c.to_f,
		    	sale:       us_ps_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 14,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      5,
		    	buy:        us_es_c.to_f,
		    	sale:       us_es_v.to_f,
		    )

			rescue
				c.update_attributes(status: false)
			end
		end

		c = Company.find_by_id(15)
		if c.status == true
			begin
				open('http://www.fortunacambios.com.py/informaciones-utiles.php')

			mechanize = Mechanize.new
			page = mechanize.get('http://www.fortunacambios.com.py/informaciones-utiles.php')
			get_val = page.search(".//p")


			us_gs_c = ''
			us_gs_v = ''

			rs_gs_c = ''
			rs_gs_v = ''

			ps_gs_c = ''
			ps_gs_v = ''

			es_gs_c = ''
			es_gs_v = ''

			us_rs_c = ''
			us_rs_v = ''

			us_ps_c = ''
			us_ps_v = ''

			us_es_c = ''
			us_es_v = ''

			count = 0
			content = ''

			get_val.each do |c|
				if c.to_s.gsub(/\s+/, "")[0..19] == '<pclass="montocompra' or c.to_s.gsub(/\s+/, "")[0..18] == '<pclass="montoventa'
				
					content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub('<pclass="montocompra',"").gsub('<pclass="montoventa', "").gsub('</p>',"").gsub('sube">', "").gsub('baja">',"")

					if content[0..2] == '{6}'
						us_gs_c =content[3..9]
					end

					if content[0..2] == '{7}'
						us_gs_v =content[3..9]
					end

					if content[0..2] == '{4}'
						rs_gs_c =content[3..9]
					end

					if content[0..2] == '{5}'
						rs_gs_v =content[3..9]
					end


					if content[0..2] == '{2}'
						ps_gs_c =content[3..7]
					end

					if content[0..2] == '{3}'
						ps_gs_v =content[3..7]
					end

					if content[0..2] == '{0}'
						es_gs_c =content[3..9]
					end

					if content[0..2] == '{1}'
						es_gs_v =content[3..9]
					end

					if content[0..3] == '{10}'
						us_rs_c =content[4..9]
					end

					if content[0..3] == '{11}'
						us_rs_v =content[4..9]
					end

					if content[0..3] == '{12}'
						us_ps_c =content[4..9]
					end

					if content[0..3] == '{13}'
						us_ps_v =content[4..9]
					end		

					if content[0..2] == '{8}'
						us_es_c =content[3..7]
					end

					if content[0..2] == '{9}'
						us_es_v =content[3..7]
					end		
				 	count += 1
			 	end
			end		
		    Exchange.create(
		    	company_id: 15,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      2,
		    	buy:        us_gs_c.to_f,
		    	sale:       us_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 15,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      2,
		    	buy:        rs_gs_c.to_f,
		    	sale:       rs_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 15,
		    	date:    Time.now,
		    	currency_id: 4,
		    	:for =>      2,
		    	buy:        ps_gs_c.to_f,
		    	sale:       ps_gs_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 15,
		    	date:    Time.now,
		    	currency_id: 5,
		    	:for =>      2,
		    	buy:        es_gs_c.to_f,
		    	sale:       es_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 15,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      3,
		    	buy:        us_rs_c.to_f,
		    	sale:       us_rs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 15,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      4,
		    	buy:        us_ps_c.to_f,
		    	sale:       us_ps_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 15,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      5,
		    	buy:        us_es_c.to_f,
		    	sale:       us_es_v.to_f,
		    )		

			rescue
				c.update_attributes(status: false)
			end
		end

		c = Company.find_by_id(17)
		if c.status == 17
			begin
				open('http://bonanzacambios.com.py/index.php')

			mechanize = Mechanize.new
			page = mechanize.get('http://bonanzacambios.com.py/index.php')
			get_val = page.search(".//h5")

			us_gs_c = ''
			us_gs_v = ''

			rs_gs_c = ''
			rs_gs_v = ''

			ps_gs_c = ''
			ps_gs_v = ''

			es_gs_c = ''
			es_gs_v = ''

			us_rs_c = ''
			us_rs_v = ''

			us_ps_c = ''
			us_ps_v = ''

			us_es_c = ''
			us_es_v = ''

			count = 0
			content = ''

			get_val.each do |c|
				if c.to_s.gsub(/\s+/, "")[0..10] != '<h5class="p' 
					if c.to_s.gsub(/\s+/, "")[0..10] != '<h5><spancl'
						if c.to_s.gsub(/\s+/, "")[0..6] != '<h5styl'
						
						content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(".","").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub('<h5>',"").gsub('</h5>',"").gsub(/([a-zA-Z])/,'').gsub('<="-"="-:12;"></>',"").gsub('<="--"="-:12;-:12;"></>',"").gsub('<="--"="-:12;"></>',"").gsub('<="-"="-:12;-:12;"></>',"")[0..124]

							if content[0..2] == '{1}'
								us_gs_c =content[3..9]
							end

							if content[0..2] == '{3}'
								us_gs_v =content[3..9]
							end

							if content[0..2] == '{5}'
								rs_gs_c =content[3..9]
							end

							if content[0..2] == '{7}'
								rs_gs_v =content[3..9]
							end


							if content[0..3] == '{13}'
								ps_gs_c =content[4..7]
							end

							if content[0..3] == '{15}'
								ps_gs_v =content[4..7]
							end

							if content[0..2] == '{9}'
								es_gs_c =content[3..9]
							end

							if content[0..3] == '{11}'
								es_gs_v =content[4..9]
							end

							if content[0..3] == '{20}'
								us_rs_c =content[4..9]
							end

							if content[0..3] == '{21}'
								us_rs_v =content[4..9]
							end

							if content[0..3] == '{18}'
								us_ps_c =content[4..9]
							end

							if content[0..3] == '{19}'
								us_ps_v =content[4..9]
							end		

							if content[0..3] == '{16}'
								us_es_c =content[4..7]
							end

							if content[0..3] == '{17}'
								us_es_v =content[4..7]
							end		
						 	count += 1
						end	
					end
				end
			end	
	    Exchange.create(
	    	company_id: 17,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      2,
	    	buy:        us_gs_c.to_f,
	    	sale:       us_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: 17,
	    	date:    Time.now,
	    	currency_id: 3,
	    	:for =>      2,
	    	buy:        rs_gs_c.to_f,
	    	sale:       rs_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: 17,
	    	date:    Time.now,
	    	currency_id: 4,
	    	:for =>      2,
	    	buy:        ps_gs_c.to_f,
	    	sale:       ps_gs_v.to_f,
	    )
	    Exchange.create(
	    	company_id: 17,
	    	date:    Time.now,
	    	currency_id: 5,
	    	:for =>      2,
	    	buy:        es_gs_c.to_f,
	    	sale:       es_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: 17,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      3,
	    	buy:        us_rs_c.to_f,
	    	sale:       us_rs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: 17,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      4,
	    	buy:        us_ps_c.to_f,
	    	sale:       us_ps_v.to_f,
	    )
	    Exchange.create(
	    	company_id: 17,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      5,
	    	buy:        us_es_c.to_f,
	    	sale:       us_es_v.to_f,
	    )					
			rescue
				c.update_attributes(status: false)
			end
		end

		c = Company.find_by_id(22)
		if c.status == true
			begin
			open('http://www.maxicambios.com.py/')
			mechanize = Mechanize.new
			page = mechanize.get('http://www.maxicambios.com.py/')
			get_val = page.search(".//div")

			us_gs_c = ''
			us_gs_v = ''

			rs_gs_c = ''
			rs_gs_v = ''

			ps_gs_c = ''
			ps_gs_v = ''

			es_gs_c = ''
			es_gs_v = ''

			us_rs_c = ''
			us_rs_v = ''

			us_ps_c = ''
			us_ps_v = ''

			us_es_c = ''
			us_es_v = ''

			count = 0
			content = ''	

	 		get_val.each do |c|
	 			if c.to_s.encode('UTF-8').gsub(/\s+/, "")[0..14] == '<divclass="subi' or c.to_s.encode('UTF-8').gsub(/\s+/, "")[0..14] ==  '<divclass="bajo'
		
				content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(".","").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub(/([a-zA-Z])/,'').gsub('<="">', "").gsub('</>', "").gsub('<=""="-:13;">', "")[0..80]

				 if content[0..2] == '{1}'
					 us_gs_c =content[3..9]
				 end

				 if content[0..2] == '{0}'
					 us_gs_v =content[3..9]
				 end

				 if content[0..2] == '{5}'
					 rs_gs_c =content[3..9]
				 end

				 if content[0..2] == '{4}'
					 rs_gs_v =content[3..9]
				 end


				 if content[0..2] == '{3}'
					 ps_gs_c =content[2..7]
				 end

				 if content[0..2] == '{2}'
					 ps_gs_v =content[3..7]
				 end

				 if content[0..2] == '{9}'
					 es_gs_c =content[3..9]
				 end

				 if content[0..2] == '{8}'
					 es_gs_v =content[3..9]
				 end

				 if content[0..3] == '{34}'
					 us_rs_c =content[4..9]
				 end

				 if content[0..3] == '{35}'
					 us_rs_v =content[4..9]
				 end

				 if content[0..3] == '{36}'
					 us_ps_c =content[4..9]
				 end

				 if content[0..3] == '{37}'
					 us_ps_v =content[4..9]
				 end		

				 if content[0..3] == '{32}'
					 us_es_c =content[4..7]
				 end

				 if content[0..3] == '{33}'
					 us_es_v =content[4..7]
				 end		
			 	 count += 1
			 end	 	
		 end

	    Exchange.create(
	    	company_id: 22,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      2,
	    	buy:        us_gs_c.to_f,
	    	sale:       us_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: 22,
	    	date:    Time.now,
	    	currency_id: 3,
	    	:for =>      2,
	    	buy:        rs_gs_c.to_f,
	    	sale:       rs_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: 22,
	    	date:    Time.now,
	    	currency_id: 4,
	    	:for =>      2,
	    	buy:        ps_gs_c.to_f,
	    	sale:       ps_gs_v.to_f,
	    )
	    Exchange.create(
	    	company_id: 22,
	    	date:    Time.now,
	    	currency_id: 5,
	    	:for =>      2,
	    	buy:        es_gs_c.to_f,
	    	sale:       es_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: 22,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      3,
	    	buy:        us_rs_c.to_f,
	    	sale:       us_rs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: 22,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      4,
	    	buy:        us_ps_c.to_f,
	    	sale:       us_ps_v.to_f,
	    )
	    Exchange.create(
	    	company_id: 22,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      5,
	    	buy:        us_es_c.to_f,
	    	sale:       us_es_v.to_f,
	    )					
			rescue
				c.update_attributes(status: false)			
			end
		end

		c = Company.find_by_id(60)
		if c.status == true
			begin
				open('http://cambiosalberdi.com/')
				mechanize = Mechanize.new
				page = mechanize.get('http://cambiosalberdi.com/')
				get_val = page.search(".//div")
				us_gs_c = ''
				us_gs_v = ''

				rs_gs_c = ''
				rs_gs_v = ''

				ps_gs_c = ''
				ps_gs_v = ''

				es_gs_c = ''
				es_gs_v = ''

				us_rs_c = ''
				us_rs_v = ''

				us_ps_c = ''
				us_ps_v = ''

				us_es_c = ''
				us_es_v = ''

				count = 0
				content = ''

				get_val.each do |c|
					if c.to_s.encode('UTF-8').gsub(/\s+/, "")[0..36] == '<divclass="span2pagination-right"><p>'
						content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(".","").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub('</p></div>', "")[37..60]

						if content[0..2] == '{0}'
							us_gs_c =content[3..9]
						end

						if content[0..2] == '{1}'
							us_gs_v =content[3..9]
						end

						if content[0..2] == '{4}'
							rs_gs_c =content[3..9]
						end

						if content[0..2] == '{5}'
							rs_gs_v =content[3..9]
						end

						if content[0..2] == '{2}'
							ps_gs_c =content[3..7]
						end

						if content[0..2] == '{3}'
							ps_gs_v =content[3..7]
						end

						if content[0..2] == '{6}'
							es_gs_c =content[3..9]
						end

						if content[0..2] == '{7}'
							es_gs_v =content[3..9]
						end

						if content[0..3] == '{10}'
							us_rs_c =content[4..9]
						end

						if content[0..3] == '{11}'
							us_rs_v =content[4..9]
						end

						if content[0..2] == '{8}'
							us_ps_c =content[3..9]
						end

						if content[0..2] == '{9}'
							us_ps_v =content[3..9]
						end		

						if content[0..3] == '{12}'
							us_es_c =content[4..7]
						end

						if content[0..3] == '{13}'
							us_es_v =content[4..7]
						end		
					 	count += 1
					 end
				end		
		    Exchange.create(
		    	company_id: 60,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      2,
		    	buy:        us_gs_c.to_f,
		    	sale:       us_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 60,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      2,
		    	buy:        rs_gs_c.to_f,
		    	sale:       rs_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 60,
		    	date:    Time.now,
		    	currency_id: 4,
		    	:for =>      2,
		    	buy:        ps_gs_c.to_f,
		    	sale:       ps_gs_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 60,
		    	date:    Time.now,
		    	currency_id: 5,
		    	:for =>      2,
		    	buy:        es_gs_c.to_f,
		    	sale:       es_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 60,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      3,
		    	buy:        us_rs_c.to_f,
		    	sale:       us_rs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 60,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      4,
		    	buy:        us_ps_c.to_f,
		    	sale:       us_ps_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 60,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      5,
		    	buy:        us_es_c.to_f,
		    	sale:       us_es_v.to_f,
		    )				
			rescue
				c.update_attributes(status: false)			
			end
		end

		c = Company.find_by_id(9)
		if c.status == true
			begin
				open('http://cambiosalberdi.com/')
				mechanize = Mechanize.new
				page = mechanize.get('http://cambiosalberdi.com/')
				get_val = page.search(".//div")
				us_gs_c = ''
				us_gs_v = ''

				rs_gs_c = ''
				rs_gs_v = ''

				ps_gs_c = ''
				ps_gs_v = ''

				es_gs_c = ''
				es_gs_v = ''

				us_rs_c = ''
				us_rs_v = ''

				us_ps_c = ''
				us_ps_v = ''

				us_es_c = ''
				us_es_v = ''

				count = 0
				content = ''

				get_val.each do |c|
					if c.to_s.encode('UTF-8').gsub(/\s+/, "")[0..36] == '<divclass="span2pagination-right"><p>'
						content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(".","").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub('</p></div>', "")[37..60]

						 if content[0..3] == '{14}'
							 us_gs_c =content[4..9]
						 end

						 if content[0..3] == '{15}'
							 us_gs_v =content[4..9]
						 end

						 if content[0..3] == '{18}'
							 rs_gs_c =content[4..9]
						 end

						 if content[0..3] == '{19}'
							 rs_gs_v =content[4..9]
						 end

						 if content[0..3] == '{16}'
							 ps_gs_c =content[4..7]
						 end

						 if content[0..3] == '{17}'
							 ps_gs_v =content[4..7]
						 end

						 if content[0..3] == '{20}'
							 es_gs_c =content[4..9]
						 end

						 if content[0..3] == '{21}'
							 es_gs_v =content[4..9]
						 end

						 if content[0..3] == '{24}'
							 us_rs_c =content[4..9]
						 end

						 if content[0..3] == '{25}'
							 us_rs_v =content[4..9]
						 end

						 if content[0..3] == '{22}'
							 us_ps_c =content[4..9]
						 end

						 if content[0..3] == '{23}'
							 us_ps_v =content[4..9]
						 end		

						 if content[0..3] == '{26}'
							 us_es_c =content[4..9]
						 end

						 if content[0..3] == '{27}'
							 us_es_v =content[4..9]
						 end
					 	count += 1
					 end
				end		
		    Exchange.create(
		    	company_id: 9,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      2,
		    	buy:        us_gs_c.to_f,
		    	sale:       us_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 9,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      2,
		    	buy:        rs_gs_c.to_f,
		    	sale:       rs_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 9,
		    	date:    Time.now,
		    	currency_id: 4,
		    	:for =>      2,
		    	buy:        ps_gs_c.to_f,
		    	sale:       ps_gs_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 9,
		    	date:    Time.now,
		    	currency_id: 5,
		    	:for =>      2,
		    	buy:        es_gs_c.to_f,
		    	sale:       es_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 9,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      3,
		    	buy:        us_rs_c.to_f,
		    	sale:       us_rs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 9,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      4,
		    	buy:        us_ps_c.to_f,
		    	sale:       us_ps_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 9,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      5,
		    	buy:        us_es_c.to_f,
		    	sale:       us_es_v.to_f,
		    )				
			rescue
				c.update_attributes(status: false)			
			end
		end 

		c = Company.find_by_id(61)
		if c.status == true
			begin
				open('http://cambiosalberdi.com/')
				mechanize = Mechanize.new
				page = mechanize.get('http://cambiosalberdi.com/')
				get_val = page.search(".//div")
				us_gs_c = ''
				us_gs_v = ''

				rs_gs_c = ''
				rs_gs_v = ''

				ps_gs_c = ''
				ps_gs_v = ''

				es_gs_c = ''
				es_gs_v = ''

				us_rs_c = ''
				us_rs_v = ''

				us_ps_c = ''
				us_ps_v = ''

				us_es_c = ''
				us_es_v = ''

				count = 0
				content = ''

				get_val.each do |c|
					if c.to_s.encode('UTF-8').gsub(/\s+/, "")[0..36] == '<divclass="span2pagination-right"><p>'
						content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(".","").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub('</p></div>', "")[37..60]

					if content[0..3] == '{28}'
						us_gs_c =content[4..9]
					end

					if content[0..3] == '{29}'
						us_gs_v =content[4..9]
					end

					if content[0..3] == '{32}'
						rs_gs_c =content[4..9]
					end

					if content[0..3] == '{33}'
						rs_gs_v =content[4..9]
					end

					if content[0..3] == '{30}'
						ps_gs_c =content[4..7]
					end

					if content[0..3] == '{31}'
						ps_gs_v =content[4..7]
					end

					if content[0..3] == '{34}'
						es_gs_c =0
					end

					if content[0..3] == '{35}'
						es_gs_v =0
					end

					if content[0..3] == '{36}'
						us_rs_c =content[4..9]
					end

					if content[0..3] == '{37}'
						us_rs_v =content[4..9]
					end

					if content[0..3] == '{34}'
						us_ps_c =content[4..9]
					end

					if content[0..3] == '{35}'
						us_ps_v =content[4..9]
					end		

					if content[0..3] == '{38}'
						us_es_c =content[4..9]
					end

					if content[0..3] == '{39}'
						us_es_v =content[4..9]
					end	
					 	count += 1
					 end
				end		
		    Exchange.create(
		    	company_id: 61,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      2,
		    	buy:        us_gs_c.to_f,
		    	sale:       us_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 61,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      2,
		    	buy:        rs_gs_c.to_f,
		    	sale:       rs_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 61,
		    	date:    Time.now,
		    	currency_id: 4,
		    	:for =>      2,
		    	buy:        ps_gs_c.to_f,
		    	sale:       ps_gs_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 61,
		    	date:    Time.now,
		    	currency_id: 5,
		    	:for =>      2,
		    	buy:        es_gs_c.to_f,
		    	sale:       es_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 61,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      3,
		    	buy:        us_rs_c.to_f,
		    	sale:       us_rs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 61,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      4,
		    	buy:        us_ps_c.to_f,
		    	sale:       us_ps_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 61,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      5,
		    	buy:        us_es_c.to_f,
		    	sale:       us_es_v.to_f,
		    )			
			rescue
				c.update_attributes(status: false)			
			end
		end

		c = Company.find_by_id(65)
		if c.status == true
			begin
				open('http://www.money.com.py/index.php')
				mechanize = Mechanize.new
				page = mechanize.get('http://www.money.com.py/index.php')
				get_val = page.search(".//td")

				us_gs_c = ''
				us_gs_v = ''

				rs_gs_c = ''
				rs_gs_v = ''

				ps_gs_c = ''
				ps_gs_v = ''

				es_gs_c = ''
				es_gs_v = ''

				us_rs_c = ''
				us_rs_v = ''

				us_ps_c = ''
				us_ps_v = ''

				us_es_c = ''
				us_es_v = ''

				count = 0
				content = ''

				get_val.each do |c|
						content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub('<tdstyle="background-color:#cccccc;">', "").gsub('<td>', "").gsub('</td>', "")[0..60]

						if content[0..3] == '{22}'
							us_gs_c =content[4..9]
						end

						if content[0..3] == '{23}'
							us_gs_v =content[4..9]
						end

						if content[0..3] == '{25}'
							rs_gs_c =content[4..9]
						end

						if content[0..3] == '{26}'
							rs_gs_v =content[4..9]
						end

						if content[0..3] == '{28}'
							ps_gs_c =content[4..7]
						end

						if content[0..3] == '{29}'
							ps_gs_v =content[4..7]
						end

						if content[0..3] == '{31}'
							es_gs_c =content[4..9]
						end

						if content[0..3] == '{32}'
							es_gs_v =content[4..9]
						end

						if content[0..3] == '{34}'
							us_rs_c =content[4..9]
						end

						if content[0..3] == '{35}'
							us_rs_v =content[4..9]
						end

						if content[0..3] == '{37}'
							us_ps_c =content[4..9]
						end

						if content[0..3] == '{38}'
							us_ps_v =content[4..9]
						end		

						if content[0..3] == '{40}'
							us_es_c =content[4..9]
						end

						if content[0..3] == '{41}'
							us_es_v =content[4..9]
						end		
					 	count += 1
				end

		    Exchange.create(
		    	company_id: 65,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      2,
		    	buy:        us_gs_c.to_f,
		    	sale:       us_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 65,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      2,
		    	buy:        rs_gs_c.to_f,
		    	sale:       rs_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 65,
		    	date:    Time.now,
		    	currency_id: 4,
		    	:for =>      2,
		    	buy:        ps_gs_c.to_f,
		    	sale:       ps_gs_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 65,
		    	date:    Time.now,
		    	currency_id: 5,
		    	:for =>      2,
		    	buy:        es_gs_c.to_f,
		    	sale:       es_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 65,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      3,
		    	buy:        us_rs_c.to_f,
		    	sale:       us_rs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 65,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      4,
		    	buy:        us_ps_c.to_f,
		    	sale:       us_ps_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 65,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      5,
		    	buy:        us_es_c.to_f,
		    	sale:       us_es_v.to_f,
		    )			
			rescue
				c.update_attributes(status: false)			
			end
		end

		c = Company.find_by_id(68)
		if c.status == true
			begin
				open('http://www.eurocambios.com.py/final_web/html/graficas/cotiza1.php')
				mechanize = Mechanize.new
				page = mechanize.get('http://www.eurocambios.com.py/final_web/html/graficas/cotiza1.php')
				get_val = page.search(".//div")

				 us_gs_c = ''
				 us_gs_v = ''

				 rs_gs_c = ''
				 rs_gs_v = ''

				 ps_gs_c = ''
				 ps_gs_v = ''

				 es_gs_c = ''
				 es_gs_v = ''

				 us_rs_c = ''
				 us_rs_v = ''

				 us_ps_c = ''
				 us_ps_v = ''

				 us_es_c = ''
				 us_es_v = ''

				 count = 0
				 content = ''
		 		get_val.each do |c|
					content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(".","").gsub(",",".").gsub(160.chr("UTF-8"),"").gsub('<divalign="right"class="Estilo2">', "").gsub('</div>', "")[0..60]

					 if content[0..2] == '{0}'
						 us_gs_c =content[3..9]
					 end

					 if content[0..2] == '{1}'
						 us_gs_v =content[3..9]
					 end

					 if content[0..2] == '{6}'
						 rs_gs_c =content[3..9]
					 end

					 if content[0..2] == '{7}'
						 rs_gs_v =content[3..9]
					 end

					 if content[0..2] == '{4}'
						 ps_gs_c =content[3..7]
					 end

					 if content[0..2] == '{5}'
						 ps_gs_v =content[3..7]
					 end

					 if content[0..2] == '{2}'
						 es_gs_c =content[3..9]
					 end

					 if content[0..2] == '{3}'
						 es_gs_v =content[3..9]
					 end		
				 	 count += 1
		 		end

		    Exchange.create(
		    	company_id: 68,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      2,
		    	buy:        us_gs_c.to_f,
		    	sale:       us_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 68,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      2,
		    	buy:        rs_gs_c.to_f,
		    	sale:       rs_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: 68,
		    	date:    Time.now,
		    	currency_id: 4,
		    	:for =>      2,
		    	buy:        ps_gs_c.to_f,
		    	sale:       ps_gs_v.to_f,
		    )
		    Exchange.create(
		    	company_id: 68,
		    	date:    Time.now,
		    	currency_id: 5,
		    	:for =>      2,
		    	buy:        es_gs_c.to_f,
		    	sale:       es_gs_v.to_f,
		    )
	 		rescue			
				c.update_attributes(status: false)			
			end
		end

		list_crawler = Company.where(crawler_id: 4).select('id,status,crawler_url') #yrendague
		list_crawler.each do |lc|
			if lc.status == true
				begin
					open("http://www.yrendague.com.py/modelos.php?cotizacion&id_sucursal=#{lc.crawler_url.to_s}&page=undefined")
				mechanize = Mechanize.new
				page = mechanize.get("http://www.yrendague.com.py/modelos.php?cotizacion&id_sucursal=#{lc.crawler_url.to_s}&page=undefined")
				get_val = page.search(".//strong")
				page2 = mechanize.get("http://www.yrendague.com.py/modelos.php?arbitraje&id_sucursal=#{lc.crawler_url.to_s}&page=undefined")
				get_val2 = page2.search(".//strong")


				us_gs_c = '' 
				us_gs_v = '' 

				rs_gs_c = '' 
				rs_gs_v = '' 

				ps_gs_c = '' 
				ps_gs_v = '' 

				es_gs_c = '' 
				es_gs_v = '' 

				us_rs_c = '' 
				us_rs_v = '' 

				us_ps_c = '' 
				us_ps_v = '' 

				us_es_c = '' 
				us_es_v = '' 

				count = 0 
				content = '' 
				get_val.each do |c| 
					content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(",",".").gsub('<strong>',"").gsub(/([a-zA-Z])/,'').gsub('<="">=</></>',"").gsub('<="--"></></>', "").gsub(160.chr("UTF-8"),"")[0..60]

				if content[0..2] == '{0}' 
					us_gs_c =content[3..9] 
				end 

				if content[0..2] == '{1}' 
					us_gs_v =content[3..9] 
				end 

				if content[0..2] == '{2}' 
					rs_gs_c =content[3..9] 
				end 

				if content[0..2] == '{3}' 
					rs_gs_v =content[3..9] 
				end 

				if content[0..2] == '{4}' 
					ps_gs_c =content[3..7] 
				end 

				if content[0..2] == '{5}' 
					ps_gs_v =content[3..7] 
				end 

				if content[0..2] == '{6}' 
					es_gs_c =content[3..9] 
				end 

				if content[0..2] == '{7}' 
					es_gs_v =content[3..9] 
				end 		
			 	count += 1 
			end 

			get_val2.each do |c| 
				content =  "{#{count}}" + c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(",",".").gsub('<strong>',"").gsub(/([a-zA-Z])/,'').gsub('<="">=</></>',"").gsub('<="--"></></>', "").gsub(160.chr("UTF-8"),"")[0..60]

					if lc.crawler_url.to_s == '1' #arbitrario CDE
						if content[0..2] == '{8}' 
							us_rs_c =content[3..9] 
						end 

						if content[0..2] == '{9}' 
							us_rs_v =content[3..9] 
						end 

						if content[0..3] == '{10}' 
							us_ps_c =content[4..9] 
						end 

						if content[0..3] == '{11}' 
							us_ps_v =content[4..9] 
						end 		

						if content[0..3] == '{16}' 
							us_es_c =content[4..7] 
						end 

						if content[0..3] == '{17}' 
							us_es_v =content[4..7] 
						end

					elsif lc.crawler_url.to_s == '4' #arbitrario PJC

						if content[0..2] == '{8}' 
							us_rs_c =content[3..9] 
						end 

						if content[0..2] == '{9}' 
							us_rs_v =content[3..9] 
						end 

						if content[0..3] == '{10}' 
							us_ps_c =content[4..9] 
						end 

						if content[0..3] == '{11}' 
							us_ps_v =content[4..9] 
						end 		

						if content[0..3] == '{12}' 
							us_es_c =content[4..7] 
						end 

						if content[0..3] == '{13}' 
							us_es_v =content[4..7] 
						end
					elsif lc.crawler_url.to_s == '5' #arbitrario NE
						
						if content[0..2] == '{8}' 
							us_rs_c =content[3..9] 
						end 

						if content[0..2] == '{9}' 
							us_rs_v =content[3..9] 
						end 

							us_ps_c = 0

							us_ps_v = 0

						if content[0..3] == '{10}' 
							us_es_c =content[4..7] 
						end 

						if content[0..3] == '{11}' 
							us_es_v =content[4..7] 
						end

					elsif lc.crawler_url.to_s == '6' #arbitrario ASU

						if content[0..2] == '{8}' 
							us_rs_c =content[3..9] 
						end 

						if content[0..2] == '{9}' 
							us_rs_v =content[3..9] 
						end 

						if content[0..3] == '{10}' 
							us_ps_c =content[4..9] 
						end 

						if content[0..3] == '{11}' 
							us_ps_v =content[4..9] 
						end 		

						if content[0..3] == '{16}' 
							us_es_c =content[4..7] 
						end 

						if content[0..3] == '{17}' 
							us_es_v =content[4..7] 
						end
					end
				 	count += 1 
				end 

		    Exchange.create(
		    	company_id: lc.id.to_i,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      2,
		    	buy:        us_gs_c.to_f,
		    	sale:       us_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: lc.id.to_i,
		    	date:    Time.now,
		    	currency_id: 3,
		    	:for =>      2,
		    	buy:        rs_gs_c.to_f,
		    	sale:       rs_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: lc.id.to_i,
		    	date:    Time.now,
		    	currency_id: 4,
		    	:for =>      2,
		    	buy:        ps_gs_c.to_f,
		    	sale:       ps_gs_v.to_f,
		    )
		    Exchange.create(
		    	company_id: lc.id.to_i,
		    	date:    Time.now,
		    	currency_id: 5,
		    	:for =>      2,
		    	buy:        es_gs_c.to_f,
		    	sale:       es_gs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: lc.id.to_i,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      3,
		    	buy:        us_rs_c.to_f,
		    	sale:       us_rs_v.to_f,
		    )

		    Exchange.create(
		    	company_id: lc.id.to_i,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      4,
		    	buy:        us_ps_c.to_f,
		    	sale:       us_ps_v.to_f,
		    )
		    Exchange.create(
		    	company_id: lc.id.to_i,
		    	date:    Time.now,
		    	currency_id: 1,
		    	:for =>      5,
		    	buy:        us_es_c.to_f,
		    	sale:       us_es_v.to_f,
		    )	
	 		rescue
				lc.update_attributes(status: false)
			end
		end
		end

		list_crawler = Company.where(crawler_id: 5) #chaco
		list_crawler.each do |lc|
			url = lc.crawler_url.to_s
			uri = URI(url)
			response = Net::HTTP.get(uri)
			par_json = JSON.parse(response)    
			get_var =  par_json['items']

			us_gs_c = ''
			us_gs_v = ''

			rs_gs_c = ''
			rs_gs_v = ''

			ps_gs_c = ''
			ps_gs_v = ''

			es_gs_c = ''
			es_gs_v = ''

			us_rs_c = ''
			us_rs_v = ''

			us_ps_c = ''
			us_ps_v = ''

			us_es_c = ''
			us_es_v = ''
			get_var.each do |g|
				if g['isoCode'].to_s == 'USD'
					us_gs_c = g['purchasePrice'].to_f 
					us_gs_v = g['salePrice'].to_f
				end
				if g['isoCode'].to_s == 'BRL'
					rs_gs_c = g['purchasePrice'].to_f 
					rs_gs_v = g['salePrice'].to_f

					us_rs_c = g['purchaseArbitrage'].to_f
					us_rs_v = g['saleArbitrage'].to_f
				end
				if g['isoCode'].to_s == 'ARS'
					ps_gs_c = g['purchasePrice'].to_f 
					ps_gs_v = g['salePrice'].to_f

					us_ps_c = g['purchaseArbitrage'].to_f
					us_ps_v = g['saleArbitrage'].to_f
				end
				if g['isoCode'].to_s == 'EUR'
					es_gs_c = g['purchasePrice'].to_f 
					es_gs_v = g['salePrice'].to_f

					us_es_c = g['purchaseArbitrage'].to_f
					us_es_v = g['saleArbitrage'].to_f
				end
			end
	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      2,
	    	buy:        us_gs_c.to_f,
	    	sale:       us_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 3,
	    	:for =>      2,
	    	buy:        rs_gs_c.to_f,
	    	sale:       rs_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 4,
	    	:for =>      2,
	    	buy:        ps_gs_c.to_f,
	    	sale:       ps_gs_v.to_f,
	    )
	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 5,
	    	:for =>      2,
	    	buy:        es_gs_c.to_f,
	    	sale:       es_gs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      3,
	    	buy:        us_rs_c.to_f,
	    	sale:       us_rs_v.to_f,
	    )

	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      4,
	    	buy:        us_ps_c.to_f,
	    	sale:       us_ps_v.to_f,
	    )
	    Exchange.create(
	    	company_id: lc.id,
	    	date:    Time.now,
	    	currency_id: 1,
	    	:for =>      5,
	    	buy:        us_es_c.to_f,
	    	sale:       us_es_v.to_f,
	    )	
	  end
	end	
end