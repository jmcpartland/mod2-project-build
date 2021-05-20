class AnalogSynthesizerController < ApplicationController

    # index
    get "/analog_synthesizers" do
        @as = AnalogSynthesizer.all
        erb :"analog_synthesizers/index.html"
    end

    # new
    get "/analog_synthesizers/new" do
         erb :"analog_synthesizers/new.html"
    end

    # show
    get "/analog_synthesizers/:id" do
        @as = AnalogSynthesizer.find(params[:id])
        erb :"analog_synthesizers/show.html"
    end

    # create
    post "/analog_synthesizers" do
        as = current_user.analog_synthesizers.create(params)
        redirect "/analog_synthesizers/#{as.id}"
    end

    # edit
    get "/analog_synthesizers/:id/edit" do
        @as = AnalogSynthesizer.find(params[:id])
        erb :"analog_synthesizers/edit.html"
    end

    patch "/analog_synthesizers/:id" do
        as = AnalogSynthesizer.find(params[:id])
        as.update(params[:analog_synthesizer])
        redirect "/analog_synthesizers/#{as.id}"
    end

    delete "/analog_synthesizers/:id" do
        as = AnalogSynthesizer.find(params[:id])
        as.destroy
        redirect "/analog_synthesizers"
    end
end