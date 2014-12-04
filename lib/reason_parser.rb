class ReasonParser
  def scan_expression(regexp, scannable_string)
    scannable_string.scan(regexp)
  end

  def parse_reasons_from(reasons_string)
    reasons_arr = scan_expression(reasons_expression, reasons_string)
    reasons_arr.map! do |probable_reason|
      if probable_reason.to_i > 1000000
        "8"
      elsif !probable_reason.match(/x[1-4]/) && probable_reason.length > 1
        probable_reason.split("")
      else
        probable_reason
      end
    end
    reasons_arr.flatten!.join(",")
  end

  private

  def reasons_expression
    /\d+|x[1-4]/
  end
end
