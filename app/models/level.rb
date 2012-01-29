class Level
  include Mongoid::Document

  field :title,          type: String
  field :levelName,      type: String      
  field :creatorsName,   type: String
  field :startPoint,     type:Integer
  field :endPoint,       type:Integer
  field :totalTrials,    type:Integer
  field :questionSequence, type:String
  field :perfectHitPercent, type:Integer
  field :partialHitPercent, type:Integer
  field :nearMissHitPercent, type:Integer
  field :questionType,     type:String
  field :numberType,      type:String
  field :mode,            type:String
  field :guidesEnabled,   type:Boolean
  field :guidesMode,      type:String
  field :guidesType,      type:Integer
  field :timeLimit,       type:Integer
  field :questions,       type:Array
  field :binsizes,        type:Array
  field :kcs,             type:Array
  field :sp,              type:Array
  field :ep,              type:Array
  field :fp,              type:Array
  field :answer,          type:Array
  field :type,            type:String
  
  validates_presence_of :levelName
  
  
end
