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
end
