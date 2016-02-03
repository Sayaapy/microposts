class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create]
    
    def create
        @micropost = current_user.microposts.build(micropost_params)
       if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to root_url
       else
        render "static_pages/home"
       end
    end
    
    def destroy
        @micropost = current_user.microposts.find_by(id: paramas[:id])
        return redirect_to root_url if @micropot.nil?
        @micropost.destroy
        flash[:success] = "Micropost deleted"
        redirect_to requestreffer || root_url
    end
    
    private
    def micropost_params
        params.require(:micropost).permit(:content)
    end
end
