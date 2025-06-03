from linkify_it import LinkifyIt

def linkify(input):
  if input:
    linkify = LinkifyIt()
    match = linkify.match(input)
    if match:
      return {m.text:m.url for m in match}
  return {}

