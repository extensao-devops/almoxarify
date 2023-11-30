module Api
	module V1
		class UpdateItemController < ApplicationController
            def create
                item = Item.find_by(name: update_params['name'])

                case
                when item.blank?
                    render json: {status: 'FAILURE', message: 'Item not founded', data:{}}, status: :unprocessable_entity
                when item.quantity < update_params['quantity']
                    render json: {status: 'FAILURE', message: 'Item quantity in stock is less than requested', data:{}}, status: :unprocessable_entity
                else
                    item.quantity = item.quantity - update_params['quantity']
                    if item.save
                        render json: {status: 'SUCCESS', message: "Item quantity updated successfully", data:item}, status: :ok
                    else
                        render json: {status: 'ERROR', message: 'Could not update item quantity', data:item.errors}, status: :unprocessable_entity
                    end
                end
            end

            def update_params
                params.permit(:name, :quantity)
            end
        end
    end
end