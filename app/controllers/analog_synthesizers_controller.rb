class AnalogSynthesizerController < ApplicationController

    # index
    get "/analog_synthesizers" do
        @as = AnalogSynthesizer.all
        erb :"analog_synthesizers/index.html"
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
    post "/analog_synthesizers" do
        redirect_if_not_logged_in
        as = current_user.analog_synthesizers.create(params)
        redirect "/analog_synthesizers/#{as.id}"
    end

    # edit
    get "/analog_synthesizers/:id/edit" do
        redirect_if_not_logged_in
        @as = AnalogSynthesizer.find(params[:id])
        erb :"analog_synthesizers/edit.html"
    end

    patch "/analog_synthesizers/:id" do
        as = AnalogSynthesizer.find(params[:id])
        if as.user == current_user
            as.update(params[:analog_synthesizer])
            redirect "/analog_synthesizers/#{as.id}"
        end
    end

    # delete
    delete "/analog_synthesizers/:id" do
        as = AnalogSynthesizer.find(params[:id])
        if as.user == current_user
            as.destroy
            redirect "/analog_synthesizers"
        end
    end
end