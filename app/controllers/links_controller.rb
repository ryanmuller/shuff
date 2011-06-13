class LinksController < ApplicationController
before_filter :grab_category_from_category_id

  def index
    @links = links.all
    @title = @category ? @category.name : "Links"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @links }
    end
  end

  def shuffle 
    @links = links.all

    if @links.count == 0
      redirect_to @category ? @category : root_path, :notice => "You need some links first!"
    else
      choice = rand(@links.count)
      redirect_to @links[choice].url
    end
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
    @link = links.build(params[:link])
    @link.user_id = current_user

    respond_to do |format|
      if @link.save
        format.html { redirect_to(@link.category, :notice => 'Link was successfully created.') }
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
        format.html { redirect_to(@category, :notice => 'Link was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @link = links.find(params[:id])
    @category = @link.category
    @link.destroy

    respond_to do |format|
      format.html { redirect_to(@category) }
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
