String::trim = ->
  @replace /^\s+|\s+$/g, ""

String::atrim = ->
  @replace /\s+/g, ""

Array::empty = ->
  @length == 0

Array::delete = (element) ->
  ar = []
  for a in this
    ar.push a unless a.atrim() == element
  this.splice(0)  # empty array
  while ar[0]
    this.push ar.pop() # fill current array object

Array::delete_at = (index) ->
  ar = []
  for a, i in this
    ar.push a unless i == index
  this.splice(0)
  while ar[0]
    this.push ar.pop()

# returns an array without nil/undefined elements. does not overwrite original object
Array::clean = ->
  ar = []
  for a in this
    ar.push a if a
  ar

Array::present = ->
  if this.length > 0
    true
  else
    false

# check if field has any value in it
$.extend $.fn,
  blank: ->
    if $(this).val() == ''
      true
    else
      false

# check if an element is present
$.extend $.fn,
  present: ->
    if $(this).length > 0
      true
    else
      false

# check if an element is not present
$.extend $.fn,
  absent: ->
    if $(this).length > 0
      false
    else
      true


