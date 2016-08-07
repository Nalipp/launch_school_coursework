require "pry"

class Banner
  def initialize(message, *width)
    @message = message
    @width = width.join.to_i
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    @width == 0 ? "+" + "-"*(@message.length + 2) + "+" : "+" + "-"*(@width) + "+"
  end

  def empty_line
    @width == 0 ? "|" + " "*(@message.length + 2) + "|" : "|" + " "*(@width) + "|"
  end

  def center_message
    spaces = ((@width - @message.length) / 2)
    if (@width - @message.length).odd?
      "| " + " "*spaces + @message + " "*spaces + "|"
    else
      "| " + " "*(spaces-1) + @message + " "*spaces + "|"
    end
  end

  def message_line
    if @width == 0
      "| #{@message} |"
    elsif @width < @message.length
      "| " + @message[0, @width - 2] + " |"
    else
      center_message
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 61)
# banner = Banner.new('')
puts banner
