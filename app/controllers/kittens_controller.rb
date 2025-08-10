class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten, notice: 'Successfully created a new Kitten!'
    else
      render 'new', notice: 'Failed to create Kitten'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    # no need for a instance variable a local one will suffice since this method will never be rendered, ir is only patch /put to the db
    kitten = Kitten.find(params[:id])
    kitten.update!(kitten_params)

    redirect_to kitten
  end

  def destroy
    kitten = Kitten.find(params[:id])
    kitten.destroy!

    redirect_to kittens_path, notice: 'The kitten was erased (:sad)'
  end

  private

  def kitten_params
    params.expect(kitten: %i[name age cuteness softness])
    # https://dev.to/jessalejo/comparing-paramsexpect-to-paramsrequire-and-paramsfetch-5a69
  end
end
