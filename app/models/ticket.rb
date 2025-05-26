class Ticket < ApplicationRecord
  validates :ean_code, presence: true, uniqueness: true
  validates :amount, presence: true
  validates :state, presence: true

  # If you'd like a default state:
  after_initialize :set_default_state

  validates :ean_code, presence: true, uniqueness: true

  before_validation :generate_ean_code, on: :create

  private

  def set_default_state
    self.state ||= 'pending'
  end

  def generate_ean_code
    return if ean_code.present?

    self.ean_code = loop do
      # For EAN-like codes, we typically need 13 digits; adjust length as you prefer:
      candidate = SecureRandom.random_number(10**8).to_s.rjust(8, "0")

      # Repeat if there's already a ticket with this code:
      break candidate unless Ticket.exists?(ean_code: candidate)
    end
  end
end
