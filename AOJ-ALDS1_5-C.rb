include Math
Vector = Struct.new(:x, :y)

def koch n, a, b
  return nil if n == 0
  th = (PI * 60 / 180).to_f
  s = Vector.new
  t = Vector.new
  u = Vector.new
  s.x = (2.0 * a.x + 1.0 * b.x).to_f / 3.0
  s.y = (2.0 * a.y + 1.0 * b.y).to_f / 3.0
  t.x = (1.0 * a.x + 2.0 * b.x).to_f / 3.0
  t.y = (1.0 * a.y + 2.0 * b.y).to_f / 3.0
  u.x = (t.x - s.x) * cos(th) - (t.y - s.y) * sin(th) + s.x
  u.y = (t.x - s.x) * sin(th) + (t.y - s.y) * cos(th) + s.y

  koch n - 1 , a, s
  printf "%.8f %.8f\n", s.x, s.y
  koch n - 1, s, u
  printf "%.8f %.8f\n", u.x, u.y
  koch n - 1, u, t
  printf "%.8f %.8f\n", t.x, t.y
  koch n - 1, t, b
end

a = Vector.new 0, 0
b = Vector.new 100, 0
n = gets.to_i

printf "%.8f %.8f\n", a.x, a.y
koch n, a, b
printf "%.8f %.8f\n", b.x, b.y



