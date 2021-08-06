require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: {
    args: ENV['REAL_CHROME'] ? %w[no-sandbox] : %w[no-sandbox headless disable-gpu disable-dev-shm-usage],
  }
end
