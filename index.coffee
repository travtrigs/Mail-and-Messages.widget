command: 'cd ~/Library/Application\\ Support/Übersicht/widgets/mail-and-messages.widget/ && ./open.sh'

refreshFrequency: 1000

style: """
  font-family: Helvetica Neue
  font-size: 20px
  color: #fff
  text-shadow: 0 1px 0 rgba(#000, 0.7)
  table
    position: fixed
    top: 100px
    right: 10px
    width: 140px

  th
    height: 23px
    font-weight: 200

  .messages
    max-width: 70px
    max-height: 30px
    width: 70px
    text-align: center
    position: relative
    left: 1 px
    border: 1px solid #fff

  .mail
    max-width: 70px
    max-height: 30px
    width: 70px
    text-align: center
    position: relative
    right: 1 px
    border: 1px solid #fff

  a
    text-align: right
    position: relative
    left: 1px
    bottom: 3px

  img
    text-align: left
    height: 100%
    position: relative
    right: 1px
    top: 2px

"""

render: ->"""
<table>
  <th class="mail" id="mail">
    <img src="mail-and-messages.widget/mail.png">
    <a class="mail-count"></a>
  </th>
  <th class="messages" id="messages">
    <img src="mail-and-messages.widget/messages.png">
    <a class="messages-count"></a>
  </th>
</table>


"""

afterRender: (domEl) ->
  $(domEl).on 'click', '#mail', => @run "open /Applications/Mail.app"
  $(domEl).on 'click', '#messages', => @run "open /Applications/Messages.app"

update: (output, domEl) ->
  rows = output.split("\n")
  i = 0 & j =0
  for row in rows
    line = row.split("|")
    if line[2] == "4"
      i++
    if line[2] == "5"
      j++
  $(domEl).find('.mail-count').html("#{i}")
  $(domEl).find('.messages-count').html("#{j}")

  @run ".exit"
