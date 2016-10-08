#attempts to parse an integer
def try_parse_int(s, base=10, val=None):
  try:
    return int(s, base)
  except ValueError:
    return val

#attempts to convert to binary
to_binary = lambda x: x >= 0 and str(bin(x))[2:] or "-" + str(bin(x))[3:]


first = "111" # for bits 15,14,13

def set_abit(comp):
  if comp.find('M') != -1:
    return "1"
  else:
    return "0"


#pads binary translation with addition 0's
def to_b(a):
  num = to_binary(a)
  length = len(num)
  diff = 16 - length
  rest = [ "0" for i in range(diff) ]
  rest = "".join(rest)
  return rest + num

def filter_line(a, op="//"):
  idx = a.find(op)
  if idx == -1:
    return a
  elif idx == 0:
    return ''
  else:
    if op == "//":
      a = a[:(idx-1)]
    else:
      a = a[:idx]
  return a

is_l_command = lambda i : i.find('(') != -1 and i.find(')') != -1
is_a_command = lambda i : i.find('@') != -1
is_c_command = lambda i : i.find("(") == -1 and i.find("@") == -1
