# Ref: https://github.com/collectiveidea/delayed_job#gory-details
# Don't use delayed job when testing so that tests can pass in realtime
Delayed::Worker.delay_jobs = !Rails.env.test?
