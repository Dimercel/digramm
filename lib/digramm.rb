require 'digramm/version'
require 'cairo'

module Digramm
  def h_axis
    surface = Cairo::SVGSurface.new('test.svg', 1000, 1000)
    cr = Cairo::Context.new(surface)
    cr.set_source_color(:white)
    cr.line_width = 1
    cr.paint

    cr.set_source_color(:black)
    cr.move_to 100, 100
    cr.line_to 500, 100
    cr.stroke

    step = 20
    step_len = 40
    count = 400 / step_len
    (0..count).each do |inx|
      cr.set_source_color(:black)
      cr.move_to 100 + inx * step_len, 100
      cr.line_to 100 + inx * step_len, 105
      cr.stroke

      e = cr.text_extents (inx * step).to_s
      cr.move_to (100 + inx * step_len) - e.width / 2, 100 + e.height + 10
      cr.show_text (inx * step).to_s
    end

    surface.finish
  end

  module_function :h_axis
end
