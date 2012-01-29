require 'json'

class LevelsController < ApplicationController
  def new
     render 'new'
  end

  def create
        spec = [[:title, StringParseFunction.new('title')],
                [:levelName, StringParseFunction.new('levelName')],
                [:creatorsName, StringParseFunction.new('creatorsName')],
                [:startPoint, NumberParseFunction.new('startPoint')],
                [:endPoint, NumberParseFunction.new('endPoint')],
                [:totalTrials, NumberParseFunction.new('totalTrials')],
                [:questionSequence, StringParseFunction.new('question_sequence')],
    #            [:perfectHitPercent, NumberParseFunction.new('perfectHitPercent')],
    #            [:partialHitPercent, NumberParseFunction.new('partialHitPercent')],
    #            [:nearMissHitPercent, NumberParseFunction.new('nearMissHitPercent')],
                [:questionType, StringParseFunction.new('question_type')],
                [:numberType], StringParseFunction.new('numberType'),
                [:mode, StringParseFunction.new('mode')],
    #            [:guidesEnabled, StringParseFunction.new('guidesEnabled')],
    #            [:guidesMode, StringParseFunction.new('guidesMode')],
    #            [:guidesType, NumberParseFunction.new('guidesType')],
                [:timeLimit, NumberParseFunction.new('timeLimit')],
                [:questions, ArrayParseFunction.new('questions')],
                [:binsizes, MultipleParseFunction.new('binsize')],
                [:kcs, MultipleParseFunction.new('kcs')],
                [:sp, MultipleParseFunction.new('sp')],
                [:ep, MultipleParseFunction.new('ep')],
                [:fp, MultipleParseFunction.new('fp')],
                [:answer, MultipleParseFunction.new('answer')],
                [:type, StringParseFunction.new('type')]]

    lc = parse(params,spec)
    Level.create(lc)
    #binding.pry
    render 'index'
  end

  def show
    @lc = Level.find(:all)
  end

  def update
    temp = params[:level][:levelName]
    @levelOb = Level.all_of(levelName: temp).first
    @questionType = [@levelOb.questionType == 'normal', @levelOb.questionType == 'Measurement']
    @questionSequence = [@levelOb.questionSequence == 'random', @levelOb.questionSequence == 'random_once', @levelOb.questionSequence == 'as_in_instruction_set', @levelOb.questionSequence == 'rbbkt', @levelOb.questionSequence == 'rbdtree']
    @type = [@levelOb.type == 'At_Midpoint', @levelOb.type == 'at 0', @levelOb.type == 'at 1/4s', @levelOb.type == 'at 10s', @levelOb.type == 'at Whole Number']
    @mode = [@levelOb.mode == 'Click', @levelOb.mode == 'Type', @levelOb.mode == 'Mix!',  @levelOb.mode == 'Random']
    #binding.pry    
  end
  def createnew
        spec = [[:title, StringParseFunction.new('title')],
                [:levelName, StringParseFunction.new('levelName')],
                [:creatorsName, StringParseFunction.new('creatorsName')],
                [:startPoint, NumberParseFunction.new('startPoint')],
                [:endPoint, NumberParseFunction.new('endPoint')],
                [:totalTrials, NumberParseFunction.new('totalTrials')],
                [:questionSequence, StringParseFunction.new('question_sequence')],
    #            [:perfectHitPercent, NumberParseFunction.new('perfectHitPercent')],
    #            [:partialHitPercent, NumberParseFunction.new('partialHitPercent')],
    #            [:nearMissHitPercent, NumberParseFunction.new('nearMissHitPercent')],
                [:questionType, StringParseFunction.new('question_type')],
                [:numberType], StringParseFunction.new('numberType'),
                [:mode, StringParseFunction.new('mode')],
    #            [:guidesEnabled, StringParseFunction.new('guidesEnabled')],
    #            [:guidesMode, StringParseFunction.new('guidesMode')],
    #            [:guidesType, NumberParseFunction.new('guidesType')],
                [:timeLimit, NumberParseFunction.new('timeLimit')],
                [:questions, ArrayParseFunction.new('questions')],
                [:binsizes, MultipleParseFunction.new('binsize')],
                [:kcs, MultipleParseFunction.new('kcs')],
                [:sp, MultipleParseFunction.new('sp')],
                [:ep, MultipleParseFunction.new('ep')],
                [:fp, MultipleParseFunction.new('fp')],
                [:answer, MultipleParseFunction.new('answer')],
                [:type, StringParseFunction.new('type')]]
                lc = parse(params,spec)
                if params['db'] == 'create'
                   Level.create(lc)
                else
                   Level.where(levelName:lc[:levelName]).update_all(lc)
                end    
                render 'index'
  end
    
  def index 
  end
end
