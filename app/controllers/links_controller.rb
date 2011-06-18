class LinksController < ApplicationController
before_filter :grab_category_from_category_id

  def shuffle 
    @links = links.all

    if @links.count == 0
      redirect_to @category ? @category : root_path, :notice => "You need some links first!"
    else
      @link = @links[rand(@links.count)]
    end
  end

  def create
    @link = links.build(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to(@link.category, :notice => 'Link was successfully created.') }
        format.xml  { render :xml => @link, :status => :created, :location => @link }
      else
        format.html { render "categories/show" }
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
