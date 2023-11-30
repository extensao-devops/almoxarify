module Api
	module V1
		class CategoriesController < ApplicationController
            def index
                categories = Category.all
                render json: {status: 'SUCCESS', message: 'Categories list all', data:categories}, status: :ok
            end

            def show
                category = Category.where(id: params[:id])
                unless category.blank?
                    render json: {status: 'SUCCESS', message: 'Category founded', data:category}, status: :ok
                else
                    render json: {status: 'FAILURE', message: 'Category not founded', data:{}}, status: :unprocessable_entity
                end
            end

            def create
                category = Category.find_or_initialize_by(name: category_params['name'], description: category_params['description'])
                action = category.new_record? ? "created" : "updated"

                if category.save
                    render json: {status: 'SUCCESS', message: "Category #{action} successfully", data:category}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Could not create category', data:category.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                category = Category.find_by(id: params['id'])
                unless category.blank?
                    category.destroy
                    render json: {status: 'SUCCESS', message: 'Category deleted', data:category}, status: :ok
                else
                    render json: {status: 'FAILURE', message: 'Category not founded', data:{}}, status: :unprocessable_entity
                end
            end

            private

            def category_params
                params.permit(:name, :description)
            end
        end
    end
end