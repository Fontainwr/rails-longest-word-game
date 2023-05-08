class GamesController < ApplicationController
  # w(foo bar) is a shortcut for ["foo", "bar"] .
  # Meaning it's a notation to write an array of strings
  # separated by spaces instead of commas and without
  # quotes around them.
  VOWELS = %w(A E I O U)

  def new
    @letters = (Array.new(5) { VOWELS.sample } + Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }).shuffle
  end
  def score
    word = params[:word]
    letters = params[:letters]&.split
    @result = { word: word, score: 0 }

    if word.nil?
      @message = "No word submitted"
      return
    end

    if word.chars.all? { |char| word.count(char) <= letters.count(char) }
      if english_word?(word)
        @result[:score] = word.length
        @message = "Well done!"
      else
        @message = "Not an English word!"
      end
    else
      @message = "Not in the grid!"
    end

    session[:total_score] ||= 0
    session[:total_score] += @result[:score]
  end
end
