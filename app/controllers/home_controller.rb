require 'rubygems'
require 'set'
require 'open-uri'
require 'net/http'

class HomeController < ApplicationController

  def index
    respond_to do |format|
      format.html
    end
  end
  
  def playtrack
    @song = Song.find(params[:id])
    #debugger
  end
  
  def mergeActiveAuthUsers
    @u = User.find(:all, :limit=>5, :order => "favorite_count DESC")
    @a = Authorization.find(:all, :limit => 5, :order => "favorite_count DESC")
    @a = @a + @u
    @a = @a.sort {|x,y| x.favorite_count <=> y.favorite_count}.reverse
  end
  
  def top_downloads_paginate
    @topdownloads = TopDownload.paginate :page => params[:page], :order => "rank asc"
  end
  def charts_paginate
    @charts = Chart.paginate :page => params[:chart_page], :order => "publish_date desc"
  end
end
