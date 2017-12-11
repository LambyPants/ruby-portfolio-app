class CommentsController < ApplicationController
  def create
    @comment = current_user.coments.build(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
