class PagesController < ApplicationController
	
	def index
		render layout: "page"	
	end

	def search
		st = StandardExchange.select('operation').where(currency_have: params[:have], currency_want: params[:want]).last
		order = "DESC" if st.operation == 0
		sql = "SELECT C.COMPANY_ID,
						      C.ID,
						      C.UNIT,
						      C.CITY_ID,
						      E.OPERATION,
						      E.AMOUNT,
						      E.ACTIVE,
						      E.CREATED_AT,
						      SC.DEF_FORMAT,
						      (SELECT CC.ID FROM COMPANIES CC WHERE CC.COMPANY_ID = C.ID AND CC.CITY_ID = ? LIMIT 1 ) AS UNIT_ID,
						      (SELECT CC.LATITUDE FROM COMPANIES CC WHERE CC.COMPANY_ID = C.ID AND CC.CITY_ID = ? LIMIT 1 ),
						      (SELECT CC.LONGITUDE FROM COMPANIES CC WHERE CC.COMPANY_ID = C.ID AND CC.CITY_ID = ?  LIMIT 1 )
						FROM EXCHANGE_OPERATIONS E
						INNER JOIN COMPANIES C
						ON C.ID = E.COMPANY_ID
						INNER JOIN  STANDARD_EXCHANGES SC
						ON SC.CURRENCY_HAVE = E.HAVE_ID AND SC.CURRENCY_WANT = E.WANT_ID AND SC.OPERATION = E.OPERATION
						WHERE ? IN ((SELECT CC.CITY_ID FROM COMPANIES CC WHERE CC.COMPANY_ID = C.ID ))
						AND E.ACTIVE = TRUE
						AND E.HAVE_ID = ?
						AND E.WANT_ID = ?
						ORDER BY 6 #{order}"

		sql_map = "SELECT C.ID AS COMPANY_ID,
						      C.CITY_ID,
						      C.NAME,
						      C.LATITUDE,
						      C.LONGITUDE,
						      C.ADDRESS,
						      C.TELEPHONE,
						      E.OPERATION,
						      E.AMOUNT,
						      E.ACTIVE,
						      E.CREATED_AT,
						      SC.DEF_FORMAT
						FROM EXCHANGE_OPERATIONS E
						INNER JOIN COMPANIES C
						ON C.COMPANY_ID = E.COMPANY_ID
						INNER JOIN  STANDARD_EXCHANGES SC
						ON SC.CURRENCY_HAVE = E.HAVE_ID AND SC.CURRENCY_WANT = E.WANT_ID AND SC.OPERATION = E.OPERATION
						WHERE C.CITY_ID = ?
						AND E.ACTIVE = TRUE
						AND E.HAVE_ID = ?
						AND E.WANT_ID = ?
						ORDER BY 6"						
		@companies = ExchangeOperation.find_by_sql [sql, params[:where], params[:where], params[:where], params[:where], params[:have], params[:want]]
		ActiveRecord::Associations::Preloader.new.preload(@companies, :company)
		@companies_map = ExchangeOperation.find_by_sql [sql_map, params[:where], params[:have], params[:want]]
		ActiveRecord::Associations::Preloader.new.preload(@companies_map, :company)
		render layout: "page_search"	
	end
end