class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}
  def venue_name
    venue.try(:name)
  end 

  def self.search(query)
     where("name like ?", "%#{query}%")
  end

  end 

