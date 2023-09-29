class ReactionsController < ApplicationController
    # Start *TODO: "Agregamos controlador"
    def new_user_reaction
        @user = current_user
        @type = params[:reaction_type]
        @publication = Publication.find(params[:publication_id]) if params[:publication_id]
        @comment = Comment.find(params[:comment_id]) if params[:comment_id]
        @kind = params[:kind]

        respond_to do |format|
            (@type == "comment") ? reaction_comment = Reaction.find_by(user_id: @user,
                comment_id: @comment.id) : reaction_publication = Reaction.find_by(user_id: @user.id, publication_id: @publication.id)

                if reaction_publication || reaction_comment
                  format.html { redirect_to publication_path(@publication), notice: 'You already reacted to this publication' }
                else
                  (@type == "publication") ? @reaction = Reaction.new(user_id: @user.id, publication_id:
                  @publication.id, reaction_type: @type, kind: @kind) : @reaction = Reaction.new(user_id:
                  @user.id, comment_id: @comment.id, reaction_type: @type, kind: @kind)
                if @reaction.save!
                  format.html { redirect_to publication_path(@publication), notice: 'Reaction was successfully created.' }
                else
                  format.html { redirect_to publication_path(@publication), notice: 'Something went wrong' }
                end
                
            end
        end
    end
    # End *TODO: ""
end
