class Crawler < ActiveRecord::Base

	def self.get_website_scapine
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
	end


	def self.get_website_atlas
		mechanize = Mechanize.new
		page = mechanize.get('http://atlascambio.tur.br/')
		get_val = page.search(".//strong")

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
	 if c.to_s.gsub(/\s+/, "") != '<strong>Menu</strong>'.to_s.gsub(/\s+/, "")
	
		content = c.to_s.encode('UTF-8').gsub(/\s+/, "").gsub(160.chr("UTF-8"),"").gsub('<strongvalue="',"").gsub('">', "").gsub('</strong>', "").gsub(',','.')

		if content[0..15] == 'DolarxRealCompra' 
			us_c = content[16..19] 
		end 
		if content[0..14] == 'RealVendaxDolar' 
			us_v = content[15..18] 
		end 
		if content[0..14] == 'EuroxRealCompra' 
			es_c = content[15..18] 
		end 
		if content[0..13] == 'RealVendaxEuro' 
			es_v = content[14..17] 
		end 
		if content[0..14] == 'PesoxRealCompra' 
			ps_c = content[15..18] 
		end 
		if content[0..13] == 'PesoxRealVenda' 
			ps_v = content[14..17] 
		end 
		if content[0..17] == 'GuaranixRealCompra' 
			gs_c = content[18..21] 
		end 
		if content[0..16] == 'GuaranixRealVenda' 
			gs_v = content[17..20] 
		end
	 end 
 end 
	 	#insert realxdolar
    Exchange.create(
    	company_id: 2,
    	date:    Time.now,
    	currency_id: 3,
    	:for =>      1,
    	buy:        us_c.to_f,
    	sale:       us_v.to_f,
    )

	 	#insert realxpeso
    Exchange.create(
    	company_id: 2,
    	date:    Time.now,
    	currency_id: 3,
    	:for =>      4,
    	buy:        ps_c.to_f,
    	sale:       ps_v.to_f,
    )

	 	#insert realxeuro
    Exchange.create(
    	company_id: 2,
    	date:    Time.now,
    	currency_id: 3,
    	:for =>      5,
    	buy:        es_c.to_f,
    	sale:       es_v.to_f,
    )
	
	 	#insert realxguarani
    Exchange.create(
    	company_id: 2,
    	date:    Time.now,
    	currency_id: 3,
    	:for =>      2,
    	buy:        gs_c.to_f,
    	sale:       gs_v.to_f,
    )
	end

	def self.get_website_mercosur
		mechanize = Mechanize.new

		list_crawler = Company.where(crawler_id: 3) #mercosur
		list_crawler.each do |lc|
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
  	end #lista empresas
	end
end
