class SearchController < ApplicationController
  def index
    @malls = []
    debugger
    if request.xhr? && params[:lat].present? && params[:lon].present?
      records = CartoDB::Connection.query "SELECT * FROM centros_compras_euskadi_done"
      @malls = records.rows.reject{|m| m.latitude.nil? || m.longitude.nil? }.map{|m| {:nombre => m.nombre, :cartodb_id => m.cartodb_id, :direccion => m.direccion, :municipio => m.municipio, :latitude => m.latitude, :longitude => m.longitude}}
      render :partial => 'malls' and return
    end
  end
end
