#MAIN PAGE

    get '/' do
      erb :index
    end



#LOG IN

    get '/log_in' do
      @user = User.find_by_email(params[:user][:email])
      if @user.password == params[:user][:password]
        session['user_id'] = @user.id
        redirect to "/user/#{@user.id}"
      else
        redirect to "/"
      end
    end



#SIGN UP

    post '/create' do
      #There are few variable of birthdate(day, month, year)
      #So I define the birthdate in the model user.rb as combine_birthdate
      birthdate = User.combine_birthdate(params[:day],params[:month],params[:year])
      @user = User.new(params[:user])
      #@user.birthdate call from the column and assign back to = birthdate
      @user.birthdate = birthdate
      if @user.save
        redirect to "/user/#{@user.id}"
      else
        redirect to "/"
      end
    end

    get '/user/:id' do
      @user = User.find(params[:id])
      erb :profile
    end




#--------------------------------------------------------------------------



#DIRECT TO CREATE POST

    get '/user/:id/post' do
      @user = User.find(params[:id])
      @posts = @user.posts
      erb :new_post
    end




#CREATE NEW POST

    post '/user/:id/post' do
      @user = User.find_by_id(session['user_id'])
      @post = Post.new(params[:post])
      if @post.save
        @user.posts << @post
        redirect to "/user/#{@user.id}/post/#{@post.id}"
      else
        redirect to "/user/#{@user.id}"
      end
    end

    get '/user/:id/post/:post_id' do
      @user = User.find(params[:id])
      @posts = @user.posts.order('id desc')
      @post = Post.find(params[:post_id])
      erb :new_post
    end




#VIEW ALL

    get '/user/:id/view_all' do
      @user = User.find(params[:id])
      @posts = Post.all.order('id desc')
      erb :view_all
    end


#EDIT POST
    get '/user/:id/post/:post_id/edit' do
      @user = User.find(params[:id])
      @post = Post.find(params[:post_id])
      erb :"post_edit"
    end