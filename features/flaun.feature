Feature: hoge

Scenario: Open remote host
  Given config file:
  """
  port 8010

  target :sample do
    user 'bar'
    host 'eiel.info'
    path 'foo'
  end
  """
  Given should open "http://localhost:8010/foo"
  Given should ssh "eiel.info"
  When I run "sample"
