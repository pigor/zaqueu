class CollectionsController < ApplicationController
  def new
    @collection = current_user.collections.build
  end

  def create
    @collection = current_user.collections.build(collection_params)

    if @collection.save
      redirect_to root_url, notice: "Cobrança cadastrada com sucesso"
    else
      render :new
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def notify
    collection = Collection.find(params[:collection_id])

    collection.notify(manual: true)

    redirect_to root_url, notice: "Cobrança enviada com sucesso!"
  end

  def close_notify
    collection = Collection.find(params[:collection_id])

    Notification.close_notify(collection).deliver

    redirect_to login_url, notice: "Aviso enviado com sucesso, aguarde o retorno!"
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
