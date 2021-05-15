class AnalogSynthesizerController < ApplicationController

    # index
    get "/analog_synthesizers" do
        @analog_synthesizers = AnalogSynthesizer.all
        erb :"analog_synthesizers/index.html"
    end
    
    get "/analog_synthesizers/new" do
         erb :"analog_synthesizers/new.html"
    end
    
    get "/analog_synthesizers/:id" do
        @analog_synthesizer = AnalogSynthesizer.find(params[:id])
        erb :"analog_synthesizers/show.html"
    end


end