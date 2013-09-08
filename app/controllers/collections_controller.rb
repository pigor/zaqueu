class CollectionsController < ApplicationController
  def new
    @collection = current_user.collections.build
  end

  def create
    @collection = current_user.collections.build(collection_params)

    if @collection.save
      redirect_to root_url, notice: "Cobrança cadastrada com sucesso"
    else
      flash[:alert] = "Erro ao cadastrar essa cobrança, verifique se todos os campos estão preenchidos" 
      render :new
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.delete

    redirect_to root_path, notice: "Cobrança removida com sucesso!"
  end

  private

  def collection_params
    params.require(:collection).permit(:description, :deadline)
  end
end
