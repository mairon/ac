class PagesController < ApplicationController
	
	def index
		render layout: "page"	
	end

	def search
		sql = "SELECT C.COMPANY_ID,
						      C.ID,
						      C.UNIT,
						      C.CITY_ID,
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
						AND UNIT = 0
						ORDER BY 6 DESC"

		sql_map = "SELECT C.ID AS COMPANY_ID,
						      C.CITY_ID,
						      C.NAME,
						      C.LATITUDE,
						      C.LONGITUDE,
						      C.ADDRESS,
						      C.TELEPHONE,
						      C.AVATAR_FILE_NAME,
						      C.PIN_FILE_NAME,
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
		@companies = ExchangeOperation.find_by_sql [sql, params[:where], params[:have], params[:want]]
		@companies_map = ExchangeOperation.find_by_sql [sql_map, params[:where], params[:have], params[:want]]
		render layout: "page_search"	
	end
end