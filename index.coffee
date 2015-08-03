refreshFrequency: 1000

style: """
  bottom: 10px
  left: 10px
  color: #fff
  font-family: Helvetica Neue
  border: 1px solid #fff

  img
    height: 30px

  div
    height: 30px
    width: 60px
    display: block
    font-size: 24px
    font-weight: 200
    margin-bottom: 0px

  a
    position: absolute
"""

render: ->"""
  <div>
    <img src="Unread-Messages.widget/icon.png">
    <a class="messages-count"></a>
  </div>
"""

command: 'cd ~/Library/Application\\ Support/Übersicht/widgets/Unread-Messages.widget/ && ./open.sh'

update: (output, domEl) ->
  rows = output.split("\n")
  count = 0
  for row in rows
    line = row.split("|")
    if line[2] == "5"
      count++
  $(domEl).find('.messages-count').html("#{count}")
