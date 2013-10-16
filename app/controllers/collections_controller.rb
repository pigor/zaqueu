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

  def notify
    collection = Collection.find(params[:collection_id])

    collection.notify(manual: true)

    redirect_to root_url, notice: "Cobrança enviada com sucesso!"
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.delete

    redirect_to root_path, notice: "Cobrança removida com sucesso!"
  end

  private

  def collection_params
    params.require(:collection).permit(:email, :description, :deadline, :repetition)
  end
end
