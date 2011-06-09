class LinksController < ApplicationController
  before_filter :grab_category_from_category_id

  def index
    @links = links.all
    @title = @category ? @category.name : "Links"
    @blah = params[:category_id] || "blah"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @links }
    end
  end

  def shuffle 
    @links = links.all

    choice = rand(@links.count)
    redirect_to @links[choice].url
  end

  def show
    @link = links.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @link }
    end
  end

  def new
    @link = links.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @link }
    end
  end

  def edit
    @link = links.find(params[:id])
  end

  def create
    @link = links.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to([@category, @link], :notice => 'Link was successfully created.') }
        format.xml  { render :xml => @link, :status => :created, :location => @link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @link = links.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to([@category, @link], :notice => 'Link was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @link = links.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to(category_links_url) }
      format.xml  { head :ok }
    end
  end

  private 

  def links 
    @category ? @category.links : Link
  end

  def grab_category_from_category_id
    @category = Category.find(params[:category_id]) if params[:category_id]
  end
end
