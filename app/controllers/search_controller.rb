class SearchController < ApplicationController
  def index
    @malls = []
    if request.xhr? && params[:lat].present? && params[:lon].present?
      records = CartoDB::Connection.query "SELECT * FROM centros_compras_euskadi"
      @malls = records.rows
      render :partial => 'malls' and return
    end
  end
end
