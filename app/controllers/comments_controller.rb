class CommentsController < ApplicationController

    def create
        comment = Comment.create(comment_params)
        redirect_to museum_path(comment.museum)
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        @comment.save
        redirect_to museum_path(@comment.museum)
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :museum_id, :content)
    end
        
end
