require 'csv'
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
        if probable_reason.match(/10/)
          probable_reason.slice!("10")
          probable_reason.split("") + ["10"]
        else
          probable_reason.split("")
        end
      else
        probable_reason
      end
    end
    reasons_arr.flatten.join(",")
  end

  def clean_csv(path_to_csv)
    temp_csv_path = "#{path_to_csv}"
    temp_csv_path.slice!(".csv")
    temp_csv_path += "_temp.csv"
    CSV.open(temp_csv_path, "wb") do |csv|
      csv << ["id", "retoure_reason"]
      CSV.foreach(path_to_csv) do |row|
        next if row[0] == "id"
        row[1] = parse_reasons_from(row[1])
        csv << row
      end
    end
  end

  private

  def reasons_expression
    /\d+|x[1-4]/
  end
end
