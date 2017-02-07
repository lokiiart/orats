module PageVisitorsHelper
  def device (agent)
    case agent
      # mobile
      when /Android/i && /OPPO/i
        return 'OPPO'
      when /Android/i && /HUAWEI/i
        return 'HUAWEI'
      when /Android/i && /vivo/i
        return 'vivo'
      when /Android/i && /Xiaomi/i
        return 'Xiaomi'
      when /Android/i && /Lenovo/i
        return 'Lenovo'
      when /Android/i
        return 'Android'
      when /iPhone/i
        return 'iPhone'
      when /iPad/i
        return 'iPad'
      # pc
      when /Macintosh/i
        return 'Mac'
      when /Windows/i
        return 'Windows'
      when nil
        return '空'
      else
        return '未判断'
    end
  end
end
