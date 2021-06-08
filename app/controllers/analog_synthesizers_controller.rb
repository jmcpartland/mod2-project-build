class AnalogSynthesizersController < ApplicationController

    # index
    get "/analog_synthesizers" do
        @as = AnalogSynthesizer.all
        erb :"analog_synthesizers/index.html"
    end

    get "/analog_synthesizers/my" do
        redirect_if_not_logged_in
        @as = AnalogSynthesizer.all
        erb :"analog_synthesizers/my.html"
    end

    # new
    get "/analog_synthesizers/new" do
        redirect_if_not_logged_in
        erb :"analog_synthesizers/new.html"
    end

    # show
    get "/analog_synthesizers/:id" do
        redirect_if_not_logged_in
        @as = AnalogSynthesizer.find(params[:id])
        erb :"analog_synthesizers/show.html"
    end

    # create
    # post "/analog_synthesizers" do
    #     redirect_if_not_logged_in
    #     @as = current_user.analog_synthesizers.create(params)
    #     redirect "/analog_synthesizers/#{@as.id}"
    # end

    post "/analog_synthesizers" do
        @as = AnalogSynthesizer.create(params)
        if @as.valid?
            flash[:success] = ["You have successfuly created your Synthesizer"]
            redirect "/analog_synthesizers/#{@as.id}"
        else
            flash[:errors] = @as.errors.full_messages
            redirect "/analog_synthesizers"
        end
    end


    # edit
    get "/analog_synthesizers/:id/edit" do
        redirect_if_not_logged_in
        @as = AnalogSynthesizer.find(params[:id])
        erb :"analog_synthesizers/edit.html"
    end

    patch "/analog_synthesizers/:id" do
        @as = AnalogSynthesizer.find(params[:id])
        # binding.pry
        if @as.user == current_user
            @as.update(name: params[:name], manufacturer: params[:manufacturer], date_release: params[:date_release], description: params[:description])
            redirect "/analog_synthesizers/#{@as.id}"
        end
    end

    # delete
    get "/analog_synthesizers/:id/delete" do
        @as = AnalogSynthesizer.find(params[:id])
        if @as.user == current_user
            @as.destroy
            redirect "/analog_synthesizers/my"
        end
    end
end