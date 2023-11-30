module Api
	module V1
		class ItemsController < ApplicationController
            def create
                item = Item.find_or_initialize_by(name: params['name'], description: params['description'])
                category = Category.find_by(name: params['category'])

                if category.blank?
                    render json: {status: 'ERROR', message: 'Category not found', data:{}}, status: :unprocessable_entity
                else
                    action = category.new_record? ? "created" : "updated"

                    item.category = category
                    item.quantity = params['quantity']

                    if item.save
                        render json: {status: 'SUCCESS', message: "Item #{action} successfully", data:item}, status: :ok
                    else
                        render json: {status: 'ERROR', message: 'Could not create Item', data:item.errors}, status: :unprocessable_entity
                    end
                end
            end

            def index
                items = Item.all
                render json: {status: 'SUCCESS', message: 'Items list all', data:items}, status: :ok
            end

            def show
                item = Item.where(id: params[:id])
                unless item.blank?
                    render json: {status: 'SUCCESS', message: 'Item founded', data:item}, status: :ok
                else
                    render json: {status: 'FAILURE', message: 'Item not founded', data:{}}, status: :unprocessable_entity
                end
            end

            def destroy
                item = Item.where(id: params['id'])
                unless item.blank?
                    item.destroy
                    render json: {status: 'SUCCESS', message: 'Item deleted', data:item}, status: :ok
                else
                    render json: {status: 'FAILURE', message: 'Item not founded', data:{}}, status: :unprocessable_entity
                end
            end
        end
    end
end