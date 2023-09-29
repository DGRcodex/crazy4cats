class CommentsController < ApplicationController
    # Start *TODO: "Controlador de creación de comentarios"
    def create
        @publication = Publication.find(params[:comment][:publication_id])
        @comment = Comment.new(comment_params)
        @comment.user = current_user

        respond_to do |format|
            if @comment.save
              format.html { redirect_to publication_path(@publication.id), notice:'Comment was successfully created.' }
            else
              format.html { redirect_to publication_path(@publication.id), notice:'Comment was not created.' }
            end
        end
    end

    private
    def comment_params
      params.require(:comment).permit(:content, :publication_id)
    end
    # End *TODO: ""
end
