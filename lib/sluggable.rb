module Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :generate_slug!
    class_attribute :slug_column
  end

  def to_param
    self.slug
  end

  def generate_slug!
   the_slug = to_slug(self.send(self.class.slug_column.to_sym))
   post = self.class.find_by slug: the_slug
   count = 2
   while post and post != self
    the_slug = append_suffix(the_slug, count)
    post = self.class.find_by slug: the_slug
    count += 1
   end
   self.slug = the_slug
  end

  def append_suffix(str, count)
    if str.split('-').last.to_i != 0
      return str.split('-').slice(0...-1).join('-') + "-" + count.to_s
    else
      return str + "-" + count.to_s
    end
  end

  def to_slug(title)
    str = title.strip.downcase
    str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
    str.gsub! /-+/, '-' 
  end

  module ClassMethods
    def sluggable_column(column_name)
      self.slug_column = column_name
    end
  end
end